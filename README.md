# jekyll-ai-domain-data

A Jekyll plugin that automatically generates and validates `domain-profile.json` files according to the [AI Domain Data Standard](https://ai-domain-data.org) v0.1.1.

The AI Domain Data Standard is an open, vendor-neutral format for publishing authoritative domain identity data for AI systems, search engines, and automated agents. This plugin makes it easy to add AI Domain Data support to your Jekyll site.

## Installation

Add this line to your site's `Gemfile`:

```ruby
gem "jekyll-ai-domain-data"
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install jekyll-ai-domain-data
```

Then add the plugin to your `_config.yml`:

```yaml
plugins:
  - jekyll-ai-domain-data
```

## Configuration

Add an `ai_domain_data` section to your `_config.yml`:

```yaml
ai_domain_data:
  enabled: true  # Set to false to disable generation
  name: "Your Site Name"
  description: "A concise description of your site or organization"
  website: "https://example.com"  # Optional, defaults to site.url
  contact: "contact@example.com"
  logo: "https://example.com/logo.png"  # Optional
  entity_type: "Organization"  # Optional: Organization, Person, Blog, NGO, Community, Project, CreativeWork, SoftwareApplication, or Thing
  jsonld:  # Optional: Embedded JSON-LD block
    "@context": "https://schema.org"
    "@type": "Organization"
    "name": "Your Site Name"
    "url": "https://example.com"
    "email": "contact@example.com"
```

### Field Mapping

The plugin will automatically use values from your Jekyll config if not explicitly set:

- `name`: Falls back to `site.title` or `site.name`
- `description`: Falls back to `site.description`
- `website`: Falls back to `site.url` (will be prefixed with `https://` if missing)
- `contact`: Falls back to `site.email`

### Minimal Configuration

If you already have basic site metadata in `_config.yml`, you can use a minimal configuration:

```yaml
ai_domain_data:
  contact: "contact@example.com"  # Required, no fallback
```

All other fields will be pulled from your existing Jekyll configuration.

## Usage

### Automatic Generation

Once configured, the plugin automatically generates `.well-known/domain-profile.json` during site build. The file will be available at:

```
https://yourdomain.com/.well-known/domain-profile.json
```

### Liquid Tags

You can also access domain data in your templates using the `ai_domain_data` tag:

```liquid
{% ai_domain_data name %}        <!-- Outputs: Your Site Name -->
{% ai_domain_data description %} <!-- Outputs: Your description -->
{% ai_domain_data website %}     <!-- Outputs: https://example.com -->
{% ai_domain_data contact %}     <!-- Outputs: contact@example.com -->
{% ai_domain_data logo %}        <!-- Outputs: https://example.com/logo.png -->
{% ai_domain_data entity_type %} <!-- Outputs: Organization -->
{% ai_domain_data json %}        <!-- Outputs: Pretty-printed JSON -->
{% ai_domain_data json_compact %} <!-- Outputs: Compact JSON -->
{% ai_domain_data %}             <!-- Outputs: Pretty-printed full JSON -->
```

### Example: Embedding in HTML

```html
<script type="application/ld+json">
{% ai_domain_data json %}
</script>
```

## Validation

The plugin validates your configuration against the AI Domain Data Standard schema before generating the file. If validation fails, you'll see warnings in the build output and the file won't be generated.

Common validation errors:

- Missing required fields (`name`, `description`, `website`, `contact`)
- Invalid `entity_type` (must be a valid schema.org @type value)
- Invalid `jsonld` structure (must include `@context: "https://schema.org"` and `@type`)

## Examples

### Basic Configuration

```yaml
# _config.yml
title: "My Awesome Blog"
description: "A blog about web development and technology"
url: "https://myblog.com"
email: "hello@myblog.com"

ai_domain_data:
  contact: "hello@myblog.com"
  entity_type: "Blog"
```

### Complete Configuration

```yaml
# _config.yml
ai_domain_data:
  name: "Acme Corporation"
  description: "Leading provider of innovative solutions"
  website: "https://acme.com"
  contact: "info@acme.com"
  logo: "https://acme.com/logo.png"
  entity_type: "Organization"
  jsonld:
    "@context": "https://schema.org"
    "@type": "Organization"
    "name": "Acme Corporation"
    "url": "https://acme.com"
    "logo": "https://acme.com/logo.png"
    "email": "info@acme.com"
    "description": "Leading provider of innovative solutions"
    "foundingDate": "2020-01-01"
    "numberOfEmployees": "50-100"
```

## Requirements

- Jekyll >= 3.8, < 5.0
- Ruby >= 2.7.0

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ai-domain-data/jekyll-ai-domain-data.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Related Projects

- [AI Domain Data Standard](https://ai-domain-data.org) - The specification this plugin implements
- [AI Domain Data CLI](https://github.com/ai-domain-data/spec/tree/main/packages/cli) - Command-line tool for generating and validating domain profiles
- [AI Domain Data Resolver SDK](https://github.com/ai-domain-data/spec/tree/main/packages/resolver) - TypeScript/Node.js SDK for resolving domain profiles

## Support

For issues, questions, or contributions, please visit:
- GitHub Issues: https://github.com/ai-domain-data/jekyll-ai-domain-data/issues
- AI Domain Data Standard: https://ai-domain-data.org

