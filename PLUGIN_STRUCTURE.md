# Jekyll AI Domain Data Plugin - Structure Overview

## Complete Plugin Structure

```
jekyll-ai-domain-data/
├── .gitignore                 # Standard Ruby gem gitignore
├── .rspec                     # RSpec configuration
├── CHANGELOG.md               # Version history
├── EXAMPLE_CONFIG.yml          # Example Jekyll configuration
├── Gemfile                     # Development dependencies
├── jekyll-ai-domain-data.gemspec  # Gem specification
├── LICENSE                    # MIT License
├── PLUGIN_STRUCTURE.md        # This file
├── Rakefile                   # Rake tasks for building/testing
├── README.md                  # User documentation
├── SUBMISSION_GUIDE.md        # Guide for submitting to Jekyll directory
└── lib/
    └── jekyll-ai-domain-data/
        ├── generator.rb       # Jekyll Generator (creates .well-known/domain-profile.json)
        ├── schema.rb          # JSON Schema for validation
        ├── tags.rb            # Liquid tag implementation
        ├── validator.rb       # Schema validation logic
        ├── version.rb         # Version constant
        └── jekyll-ai-domain-data.rb  # Main entry point (autoloads all modules)
└── spec/
    ├── jekyll_ai_domain_data_spec.rb  # RSpec tests
    └── spec_helper.rb         # Test configuration
```

## Key Components

### 1. Generator (`lib/jekyll-ai-domain-data/generator.rb`)
- Inherits from `Jekyll::Generator`
- Automatically runs during Jekyll site generation
- Creates `.well-known/domain-profile.json` in the site source
- Validates configuration before generating
- Registers the file as a static file for Jekyll to copy

### 2. Validator (`lib/jekyll-ai-domain-data/validator.rb`)
- Uses `json-schema` gem for validation
- Validates against the AI Domain Data Standard v0.1.1 schema
- Returns structured error messages
- Raises `ValidationError` for programmatic validation

### 3. Schema (`lib/jekyll-ai-domain-data/schema.rb`)
- Contains the complete JSON Schema for AI Domain Data Standard v0.1.1
- Defines required fields, optional fields, and validation rules
- Includes entity_type enum values
- Includes jsonld structure requirements

### 4. Liquid Tags (`lib/jekyll-ai-domain-data/tags.rb`)
- Provides `{% ai_domain_data %}` tag for templates
- Supports field access: `name`, `description`, `website`, `contact`, `logo`, `entity_type`
- Supports JSON output: `json`, `json_compact`
- Returns full JSON if no field specified

### 5. Main Module (`lib/jekyll-ai-domain-data.rb`)
- Entry point for the plugin
- Autoloads all sub-modules
- Jekyll automatically loads generators when plugin is in `plugins` array

## Installation & Usage

### For End Users

1. Add to `Gemfile`:
   ```ruby
   gem "jekyll-ai-domain-data"
   ```

2. Run `bundle install`

3. Add to `_config.yml`:
   ```yaml
   plugins:
     - jekyll-ai-domain-data
   
   ai_domain_data:
     contact: "contact@example.com"
     # ... other config
   ```

4. Build site: `jekyll build` or `bundle exec jekyll build`

5. File will be generated at: `.well-known/domain-profile.json`

### For Developers

1. Clone repository
2. Run `bundle install`
3. Run tests: `bundle exec rspec`
4. Build gem: `gem build jekyll-ai-domain-data.gemspec`
5. Install locally: `gem install ./jekyll-ai-domain-data-0.1.1.gem`

## Testing

Run the test suite:
```bash
bundle exec rspec
```

Tests cover:
- Version constant
- Schema validation
- Required field validation
- Entity type enum validation
- Invalid data rejection

## Publishing

1. Update version in `lib/jekyll-ai-domain-data/version.rb`
2. Update `CHANGELOG.md`
3. Build gem: `gem build jekyll-ai-domain-data.gemspec`
4. Publish: `gem push jekyll-ai-domain-data-0.1.1.gem`
5. Tag release: `git tag v0.1.1 && git push origin v0.1.1`

## Dependencies

- `jekyll` >= 3.8, < 5.0
- `json-schema` ~> 4.0
- Ruby >= 2.7.0

## Compatibility

- Jekyll 3.8+
- Jekyll 4.x
- Ruby 2.7+
- Ruby 3.x

## License

MIT License - See LICENSE file

