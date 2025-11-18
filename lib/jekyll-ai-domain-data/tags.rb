# frozen_string_literal: true

require "json"

module Jekyll
  module AIDomainData
    # Liquid tag to output domain profile data
    # Usage: {% ai_domain_data name %} or {% ai_domain_data json %}
    class DomainDataTag < Liquid::Tag
      def initialize(tag_name, field, tokens)
        super
        @field = field&.strip
      end

      def render(context)
        site = context.registers[:site]
        config = site.config["ai_domain_data"] || {}
        
        # Build profile (same logic as generator)
        profile = build_profile(site, config)
        
        case @field
        when "name"
          profile["name"] || ""
        when "description"
          profile["description"] || ""
        when "website"
          profile["website"] || ""
        when "contact"
          profile["contact"] || ""
        when "logo"
          profile["logo"] || ""
        when "entity_type"
          profile["entity_type"] || ""
        when "json"
          JSON.pretty_generate(profile)
        when "json_compact"
          JSON.generate(profile)
        else
          # Return all data as JSON if no field specified
          JSON.pretty_generate(profile)
        end
      end

      private

      def build_profile(site, config)
        website = config["website"] || site.config["url"]
        if website && !website.start_with?("http")
          website = "https://#{website}"
        end

        profile = {
          "spec" => "https://ai-domain-data.org/spec/v0.1",
          "name" => config["name"] || site.config["title"] || site.config["name"] || "Untitled Site",
          "description" => config["description"] || site.config["description"] || "",
          "website" => website || "",
          "contact" => config["contact"] || site.config["email"] || ""
        }

        profile["logo"] = config["logo"] if config["logo"]
        profile["entity_type"] = config["entity_type"] if config["entity_type"]
        profile["jsonld"] = config["jsonld"] if config["jsonld"]

        profile
      end
    end
  end
end

Liquid::Template.register_tag("ai_domain_data", Jekyll::AIDomainData::DomainDataTag)

