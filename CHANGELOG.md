# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release of DumpConfluence CLI tool
- Confluence page backup with images and attachments
- Self-contained HTML output with embedded CSS
- Profile management system for storing credentials
- Automatic profile selection (single profile or default)
- Batch processing for multiple pages
- Rich CLI interface with progress indicators
- Comprehensive error handling and validation
- Support for different output directories
- Metadata export (JSON format)

### Features
- **Backup single pages**: Download complete Confluence pages with all assets
- **Batch processing**: Process multiple URLs from a file
- **Profile management**: Save and reuse credentials securely
- **Auto-profile selection**: Automatically use single profiles or defaults
- **Rich output**: Beautiful CLI with colors and progress bars
- **Error handling**: Detailed error messages with helpful tips
- **Cross-platform**: Works on Windows, macOS, and Linux
- **Type safety**: Full type hints for better development experience

### Security
- Input validation for all user inputs
- Secure credential storage in user config directory
- Protection against path traversal attacks
- Safe filename sanitization
- Proper error handling without credential leakage

### Technical
- Python 3.8+ support
- Modern packaging with pyproject.toml
- Comprehensive test suite with pytest
- Type checking with mypy compatibility
- Code formatting with black and ruff
- Professional documentation and docstrings

## [1.0.0] - TBD

### Added
- First stable release
- All features from unreleased version
- Complete documentation
- CI/CD pipeline
- PyPI package distribution

---

## Release Notes

### v0.1.0 (Development)
- Initial development version
- Core functionality implementation
- Basic CLI interface
- Profile management
- Error handling
- Test suite

### Planned for v1.0.0
- [ ] Performance optimizations
- [ ] Additional export formats (PDF, Markdown)
- [ ] Bulk operations improvements
- [ ] Enhanced logging options
- [ ] Configuration file support
- [ ] Plugin system architecture

### Future Versions
- [ ] Space-level backup operations
- [ ] Incremental backup support
- [ ] Backup compression options
- [ ] Cloud storage integration
- [ ] GUI interface option
- [ ] Docker container support

---

## Migration Guide

### From Script to CLI
If you were using the original `confluence_backup.py` script:

1. Install the new CLI tool: `pip install dumpconfluence`
2. Create a profile: `dumpconfluence config add myprofile`
3. Use new syntax: `dumpconfluence backup URL --profile myprofile`

### Environment Variables
The new CLI uses profiles instead of environment variables:
- Old: Set `CONFLUENCE_EMAIL`, `CONFLUENCE_API_TOKEN` in `.env`
- New: Use `dumpconfluence config add` to save profiles

### Output Structure
Output structure remains the same:
```
Page_Title/
├── Page_Title.html
├── metadata.json
└── images/
```