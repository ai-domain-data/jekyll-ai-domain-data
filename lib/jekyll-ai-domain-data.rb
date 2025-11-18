# frozen_string_literal: true

require "jekyll"

module Jekyll
  module AIDomainData
    autoload :Generator, "jekyll-ai-domain-data/generator"
    autoload :Validator, "jekyll-ai-domain-data/validator"
    autoload :Schema, "jekyll-ai-domain-data/schema"
    autoload :DomainDataTag, "jekyll-ai-domain-data/tags"
    autoload :VERSION, "jekyll-ai-domain-data/version"
  end
end

# Explicitly require the generator and tags so Jekyll can discover them
require_relative "jekyll-ai-domain-data/generator"
require_relative "jekyll-ai-domain-data/tags"

