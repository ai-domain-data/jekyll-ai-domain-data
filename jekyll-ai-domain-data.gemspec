# frozen_string_literal: true

require_relative "lib/jekyll-ai-domain-data/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-ai-domain-data"
  spec.version       = Jekyll::AIDomainData::VERSION
  spec.authors       = ["AI Domain Data Standard Contributors"]
  spec.email         = ["info@ascendingwebservices.com"]

  spec.summary       = "Jekyll plugin for generating AI Domain Data Standard domain-profile.json files"
  spec.description   = <<~DESC
    A Jekyll plugin that automatically generates and validates domain-profile.json files
    according to the AI Domain Data Standard v0.1.1. The plugin creates the file at
    .well-known/domain-profile.json during site generation and provides Liquid tags
    for accessing domain data in your templates.
  DESC
  spec.homepage      = "https://github.com/ai-domain-data/jekyll-ai-domain-data"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata = {
    "bug_tracker_uri"   => "https://github.com/ai-domain-data/jekyll-ai-domain-data/issues",
    "changelog_uri"     => "https://github.com/ai-domain-data/jekyll-ai-domain-data/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://github.com/ai-domain-data/jekyll-ai-domain-data#readme",
    "source_code_uri"   => "https://github.com/ai-domain-data/jekyll-ai-domain-data"
  }

  spec.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(lib|README|LICENSE|CHANGELOG)!)
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.8", "< 5.0"
  spec.add_dependency "json-schema", "~> 4.0"
end

