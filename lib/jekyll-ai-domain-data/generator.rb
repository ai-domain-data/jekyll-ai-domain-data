# frozen_string_literal: true

require "json"
require "fileutils"
require_relative "validator"
require_relative "schema"

module Jekyll
  module AIDomainData
    # Jekyll Generator that creates .well-known/domain-profile.json
    class Generator < Jekyll::Generator
      safe true
      priority :low

      def generate(site)
        config = site.config["ai_domain_data"] || {}
        
        # Skip if disabled
        return if config["enabled"] == false

        # Build domain profile from config
        profile = build_profile(site, config)
        
        # Validate the profile
        validation_result = Validator.validate(profile)
        
        if validation_result[:valid]
          # Create the .well-known directory and file
          create_domain_profile(site, profile)
          Jekyll.logger.info "AI Domain Data:", "Generated .well-known/domain-profile.json"
        else
          Jekyll.logger.warn "AI Domain Data:", "Validation failed:"
          validation_result[:errors].each do |error|
            Jekyll.logger.warn "", "  - #{error}"
          end
          Jekyll.logger.warn "", "Skipping domain-profile.json generation. Fix configuration errors and rebuild."
        end
      end

      private

      def build_profile(site, config)
        # Get site URL (required)
        website = config["website"] || site.config["url"]
        if website && !website.start_with?("http")
          website = "https://#{website}"
        end

        # Build required fields
        profile = {
          "spec" => "https://ai-domain-data.org/spec/v0.1",
          "name" => config["name"] || site.config["title"] || site.config["name"] || "Untitled Site",
          "description" => config["description"] || site.config["description"] || "",
          "website" => website || "",
          "contact" => config["contact"] || site.config["email"] || ""
        }

        # Add optional fields if provided
        profile["logo"] = config["logo"] if config["logo"]
        profile["entity_type"] = config["entity_type"] if config["entity_type"]
        profile["jsonld"] = config["jsonld"] if config["jsonld"]

        profile
      end

      def create_domain_profile(site, profile)
        # Create .well-known directory in source
        well_known_source = File.join(site.source, ".well-known")
        FileUtils.mkdir_p(well_known_source) unless Dir.exist?(well_known_source)

        # Write domain-profile.json to source
        output_path = File.join(well_known_source, "domain-profile.json")
        File.write(output_path, JSON.pretty_generate(profile) + "\n")

        # Register the file with Jekyll so it gets copied to the destination
        # Check if it's already registered to avoid duplicates
        existing = site.static_files.find do |file|
          file.relative_path == "/.well-known/domain-profile.json"
        end
        
        unless existing
          site.static_files << Jekyll::StaticFile.new(
            site,
            site.source,
            ".well-known",
            "domain-profile.json"
          )
        end
      end
    end
  end
end

