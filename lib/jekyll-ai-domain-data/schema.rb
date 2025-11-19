# frozen_string_literal: true

module Jekyll
  module AIDomainData
    # JSON Schema for AI Domain Data Standard v0.1.1
    SCHEMA = {
      "$id" => "https://ai-domain-data.org/spec/schema-v0.1.json",
      "title" => "AI Domain Data v0.1.1",
      "type" => "object",
      "additionalProperties" => false,
      "required" => %w[spec name description website contact],
      "properties" => {
        "spec" => {
          "type" => "string",
          "const" => "https://ai-domain-data.org/spec/v0.1",
          "description" => "Canonical URL for the AI Domain Data specification version."
        },
        "name" => {
          "type" => "string",
          "minLength" => 1,
          "description" => "Public-facing name for the site, organization, or publisher."
        },
        "description" => {
          "type" => "string",
          "minLength" => 1,
          "description" => "Concise description used by AI agents to understand the domain."
        },
        "website" => {
          "type" => "string",
          "format" => "uri",
          "description" => "Primary website URL for the domain."
        },
        "logo" => {
          "type" => "string",
          "format" => "uri",
          "description" => "Optional URL to a logo or representative image."
        },
        "contact" => {
          "type" => "string",
          "minLength" => 1,
          "description" => "Preferred contact point (email or URL)."
        },
        "entity_type" => {
          "type" => "string",
          "enum" => %w[
            Organization
            Person
            Blog
            NGO
            Community
            Project
            CreativeWork
            SoftwareApplication
            Thing
          ],
          "description" => "Optional schema.org @type value for entity classification."
        },
        "jsonld" => {
          "type" => "object",
          "description" => "Optional embedded JSON-LD block for schema.org alignment.",
          "properties" => {
            "@context" => {
              "type" => "string",
              "const" => "https://schema.org"
            },
            "@type" => {
              "type" => "string",
              "minLength" => 1
            }
          },
          "required" => %w[@context @type],
          "additionalProperties" => true
        }
      }
    }.freeze
  end
end

