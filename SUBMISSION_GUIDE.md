# Submission Guide for Jekyll Plugins Directory

This guide will help you submit `jekyll-ai-domain-data` to the official Jekyll plugins directory.

## Prerequisites

1. **Publish to RubyGems**: The plugin must be published to [RubyGems.org](https://rubygems.org) before submission.

2. **GitHub Repository**: The plugin should be hosted on GitHub with:
   - Clear README with installation and usage instructions
   - LICENSE file (MIT)
   - CHANGELOG.md
   - Proper version tagging

## Steps to Submit

### 1. Publish to RubyGems

```bash
cd jekyll-ai-domain-data
gem build jekyll-ai-domain-data.gemspec
gem push jekyll-ai-domain-data-0.1.1.gem
```

You'll need a RubyGems account. Sign up at https://rubygems.org/sign_up

### 2. Create GitHub Repository

1. Create a new repository on GitHub: `jekyll-ai-domain-data`
2. Push the code:
   ```bash
   git init
   git add .
   git commit -m "Initial release: jekyll-ai-domain-data v0.1.1"
   git remote add origin https://github.com/ai-domain-data/jekyll-ai-domain-data.git
   git push -u origin main
   git tag v0.1.1
   git push origin v0.1.1
   ```

### 3. Submit to Jekyll Plugins Directory

1. Fork the Jekyll repository: https://github.com/jekyll/jekyll
2. Edit the plugins documentation file:
   - File: `docs/_docs/plugins.md`
   - Add your plugin in the appropriate category (likely "Generators" or "Site Metadata")
3. Format for adding:
   ```markdown
   - **[jekyll-ai-domain-data](https://github.com/ai-domain-data/jekyll-ai-domain-data)** - 
     Automatically generates and validates domain-profile.json files according to the 
     AI Domain Data Standard v0.1.1. Provides Liquid tags for accessing domain data.
   ```
4. Create a pull request with:
   - Clear description of what the plugin does
   - Link to the RubyGems page
   - Link to the GitHub repository

### 4. Plugin Listing Format

When adding to `plugins.md`, use this format:

```markdown
### Site Metadata

- **[jekyll-ai-domain-data](https://github.com/ai-domain-data/jekyll-ai-domain-data)** - 
  Automatically generates and validates `.well-known/domain-profile.json` files according 
  to the [AI Domain Data Standard](https://ai-domain-data.org) v0.1.1. Provides Liquid 
  tags for accessing domain data in templates. Supports all required and optional fields 
  including schema.org JSON-LD embedding.
```

## Checklist Before Submission

- [ ] Plugin is published to RubyGems
- [ ] GitHub repository is public with proper README
- [ ] LICENSE file is included (MIT)
- [ ] CHANGELOG.md is present
- [ ] Version is tagged in git
- [ ] Plugin follows Jekyll plugin best practices:
  - [ ] Uses `safe true` if appropriate
  - [ ] Sets appropriate priority
  - [ ] Doesn't execute arbitrary code
  - [ ] Has clear error messages
- [ ] README includes:
  - [ ] Installation instructions
  - [ ] Configuration examples
  - [ ] Usage examples
  - [ ] Requirements (Jekyll version, Ruby version)
- [ ] Plugin is tested and works with current Jekyll versions

## After Submission

Once your PR is merged:

1. The plugin will appear on https://jekyllrb.com/docs/plugins/
2. Users can find it in the official directory
3. Consider adding a badge to your README:
   ```markdown
   [![Jekyll](https://img.shields.io/badge/Jekyll-Plugin-blue.svg)](https://jekyllrb.com/docs/plugins/)
   ```

## Additional Resources

- [Jekyll Plugin Documentation](https://jekyllrb.com/docs/plugins/)
- [Jekyll Contributing Guide](https://jekyllrb.com/docs/contributing/)
- [RubyGems Publishing Guide](https://guides.rubygems.org/publishing/)

