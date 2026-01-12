# Issue & Pull Request Templates

This document describes the templates used for issues and pull requests in this repository.

> **See also:** [WORKFLOWS.md](WORKFLOWS.md) for GitHub Actions workflows documentation.

## 📁 Template Files

```
.github/
├── ISSUE_TEMPLATE/
│   ├── bug_report.md       # Bug report template
│   └── feature_request.md  # Feature request template
└── PULL_REQUEST_TEMPLATE.md # Pull request template
```

## 📋 Issue Templates

### Bug Report (`ISSUE_TEMPLATE/bug_report.md`)

**Use when:** Reporting bugs or unexpected behavior

**Template includes:**
- **Description** - Clear description of the bug
- **Steps to Reproduce** - Numbered steps to reproduce the issue
- **Expected Behavior** - What should happen
- **Actual Behavior** - What actually happens
- **Environment Information**
  - OS (macOS, Ubuntu, etc.)
  - Neovim version
  - Terminal emulator
  - Shell
  - Active theme
- **Configuration** - Default or modified
- **Error Messages** - Command output, logs
- **Screenshots** - Visual evidence (optional)
- **Health Check** - Output from `:checkhealth`
- **Checklist** - Pre-submission verification

**Creating a bug report:**

1. Go to **Issues** → **New Issue**
2. Select **"Bug Report"** template
3. Fill in all required sections
4. Add appropriate labels (`bug`, priority, etc.)
5. Submit

**Tips for good bug reports:**
- Be specific and detailed
- Include actual error messages
- Provide minimal reproduction steps
- Run `:checkhealth` and include relevant output
- Mention if this is a regression (worked before)

---

### Feature Request (`ISSUE_TEMPLATE/feature_request.md`)

**Use when:** Suggesting new features or enhancements

**Template includes:**
- **Feature Description** - Clear description of the proposed feature
- **Problem Statement** - What problem does this solve?
- **Proposed Solution** - Your suggested implementation
- **Alternatives Considered** - Other approaches you've thought about
- **Use Case** - How would this be used? Who benefits?
- **Implementation Ideas** - Technical suggestions (optional)
- **Additional Context** - Extra information, examples
- **Related Plugins/Configs** - Similar implementations elsewhere
- **Checklist** - Pre-submission verification

**Creating a feature request:**

1. Go to **Issues** → **New Issue**
2. Select **"Feature Request"** template
3. Describe the feature and its value
4. Explain the use case
5. Add appropriate labels (`enhancement`, etc.)
6. Submit

**Tips for good feature requests:**
- Explain the "why" not just the "what"
- Consider if it aligns with project goals
- Search for existing similar requests first
- Be open to alternative implementations

---

## 📝 Pull Request Template

**Automatically applied** to all new pull requests.

**Template includes:**

### 1. Description
- Summary of changes
- Related issue number (e.g., "Fixes #123")

### 2. Type of Change
Checklist of change types:
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Configuration change
- [ ] Plugin update
- [ ] Performance improvement
- [ ] Code refactoring

### 3. Changes Made
Bulleted list of specific changes

### 4. Testing
Testing checklist:
- [ ] Configuration loads without errors
- [ ] All plugins load correctly
- [ ] Tested with Nord theme
- [ ] Tested with Gruvbox theme
- [ ] Run `:checkhealth` - no new errors
- [ ] Verified keybindings work as expected
- [ ] Tested in multiple file types (if applicable)

### 5. Environment
- OS
- Neovim version
- Terminal emulator

### 6. Screenshots
Visual evidence of changes (if applicable)

### 7. Checklist
Pre-merge verification:
- [ ] My code follows the style guidelines of this project (run `make format`)
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings or errors
- [ ] I have updated the CHANGELOG.md (if applicable)
- [ ] Any dependent changes have been merged and published

**Creating a pull request:**

1. **Push your branch** to GitHub
2. **Create pull request** - template auto-populates
3. **Fill in all sections** completely
4. **Complete the checklist** items
5. **Request review** when ready
6. **Address feedback** promptly

**Tips for good pull requests:**
- Keep changes focused and atomic
- Write clear commit messages
- Test thoroughly before submitting
- Update documentation
- Reference related issues
- Respond to review feedback

---

## 🏷️ Recommended Labels

Use these labels to categorize issues and PRs:

### Type Labels
- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Documentation improvements
- `question` - Further information requested

### Priority Labels
- `critical` - Blocking issue, needs immediate attention
- `high` - Important, should be addressed soon
- `medium` - Normal priority
- `low` - Nice to have, not urgent

### Status Labels
- `stale` - No recent activity
- `wontfix` - Will not be addressed
- `duplicate` - Already exists elsewhere
- `good first issue` - Good for newcomers
- `help wanted` - Community contributions welcome

### Category Labels
- `plugin` - Related to plugins
- `theme` - Theme-related changes
- `lsp` - LSP configuration
- `keybinding` - Keybinding changes
- `performance` - Performance improvements

### Automation Labels
- `dependencies` - Dependency updates (auto-applied)
- `automated` - Created by automation (auto-applied)

---

## 🎯 Label Usage Guidelines

**When to apply labels:**

1. **On creation** - Apply type and category labels
2. **During triage** - Add priority and status labels
3. **When resolved** - Update status labels

**Label combinations:**
- All issues should have at least one type label
- High-priority items should have priority labels
- Use category labels for easier filtering

---

## 📚 Resources

- [Creating Issue Templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository)
- [Creating PR Templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository)
- [Managing Labels](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels)

---

For GitHub Actions workflows, see [WORKFLOWS.md](WORKFLOWS.md).

For general contribution guidelines, see [CONTRIBUTING.md](../CONTRIBUTING.md).
