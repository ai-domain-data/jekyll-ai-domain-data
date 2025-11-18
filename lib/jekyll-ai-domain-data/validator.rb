# frozen_string_literal: true

require "json-schema"
require_relative "schema"

module Jekyll
  module AIDomainData
    # Validates domain profile data against the AI Domain Data Standard schema
    class Validator
      def self.validate(data)
        errors = []
        
        begin
          JSON::Validator.validate!(SCHEMA, data, strict: false)
          { valid: true, errors: [] }
        rescue JSON::Schema::ValidationError => e
          errors << e.message
          { valid: false, errors: errors }
        rescue JSON::Schema::SchemaError => e
          errors << "Schema error: #{e.message}"
          { valid: false, errors: errors }
        rescue StandardError => e
          errors << "Validation error: #{e.message}"
          { valid: false, errors: errors }
        end
      end

      def self.validate!(data)
        result = validate(data)
        unless result[:valid]
          raise ValidationError, "Domain profile validation failed:\n  #{result[:errors].join("\n  ")}"
        end
        result
      end
    end

    # Custom error class for validation failures
    class ValidationError < StandardError; end
  end
end

