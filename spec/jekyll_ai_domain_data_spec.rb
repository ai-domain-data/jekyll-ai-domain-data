# frozen_string_literal: true

require "spec_helper"
require "jekyll"

RSpec.describe Jekyll::AIDomainData do
  it "has a version number" do
    expect(Jekyll::AIDomainData::VERSION).not_to be nil
  end

  describe "Validator" do
    let(:valid_profile) do
      {
        "spec" => "https://ai-domain-data.org/spec/v0.1",
        "name" => "Test Site",
        "description" => "A test site",
        "website" => "https://example.com",
        "contact" => "test@example.com"
      }
    end

    it "validates a correct profile" do
      result = Jekyll::AIDomainData::Validator.validate(valid_profile)
      expect(result[:valid]).to be true
      expect(result[:errors]).to be_empty
    end

    it "rejects a profile with missing required fields" do
      invalid = valid_profile.dup
      invalid.delete("name")
      result = Jekyll::AIDomainData::Validator.validate(invalid)
      expect(result[:valid]).to be false
      expect(result[:errors]).not_to be_empty
    end

    it "validates entity_type enum values" do
      valid = valid_profile.merge("entity_type" => "Organization")
      result = Jekyll::AIDomainData::Validator.validate(valid)
      expect(result[:valid]).to be true
    end

    it "rejects invalid entity_type values" do
      invalid = valid_profile.merge("entity_type" => "InvalidType")
      result = Jekyll::AIDomainData::Validator.validate(invalid)
      expect(result[:valid]).to be false
    end
  end
end

