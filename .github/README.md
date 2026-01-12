# GitHub Workflows & Templates

This directory contains GitHub Actions workflows, issue templates, and pull request templates for automating repository maintenance and standardizing contributions.

## 📁 Directory Structure

```
.github/
├── workflows/               # GitHub Actions workflows
│   ├── ci.yml              # Continuous Integration
│   ├── release.yml         # Automated releases
│   ├── auto-update.yml     # Plugin updates
│   ├── stale.yml           # Stale issue management
│   └── markdown-link-check.json  # Link check config
├── ISSUE_TEMPLATE/         # Issue templates
│   ├── bug_report.md       # Bug report template
│   └── feature_request.md  # Feature request template
├── PULL_REQUEST_TEMPLATE.md # Pull request template
├── LICENSE                 # Project license
└── README.md              # This file
```

## 🤖 Workflows

### CI Workflow (`ci.yml`)

**Triggers:** Push to main, Pull requests

**Jobs:**

1. **Lint and Format Check**
   - Checks Lua code formatting with StyLua
   - Lints Lua files with luacheck
   - Ensures code quality standards

2. **Neovim Test**
   - Tests on Neovim stable and nightly
   - Verifies configuration loads without errors
   - Installs and tests plugins

3. **Documentation Check**
   - Verifies required documentation exists
   - Checks for broken links in markdown files

**Usage:**
- Automatically runs on every push and PR
- All checks must pass before merging

**Local Testing:**
```bash
make format  # Format code
make lint    # Lint code
make test    # Test configuration
```

---

### Release Workflow (`release.yml`)

**Triggers:** Tag push (v*)

**Jobs:**

1. **Create Release**
   - Extracts changelog for the version
   - Creates release archive
   - Publishes GitHub release
   - Updates CHANGELOG.md

**Usage:**
To create a new release:

```bash
# 1. Update CHANGELOG.md with version changes
# 2. Commit changes
git add CHANGELOG.md
git commit -m "chore: prepare for v1.0.0"

# 3. Create and push tag
git tag v1.0.0
git push origin v1.0.0

# 4. GitHub Actions will automatically create the release
```

**What Gets Released:**
- Compressed archive of the configuration
- Changelog for that version
- GitHub release page

---

### Auto-Update Workflow (`auto-update.yml`)

**Triggers:** 
- Weekly (Mondays at 9:00 AM UTC)
- Manual trigger via GitHub Actions UI

**Jobs:**

1. **Check for Plugin Updates**
   - Updates all plugins via lazy.nvim
   - Creates PR if updates are available
   - Includes checklist for testing

**Usage:**

**Automatic:**
- Runs weekly, creates PR if updates found

**Manual:**
1. Go to Actions tab
2. Select "Auto Update Plugins"
3. Click "Run workflow"

**Reviewing Update PRs:**
1. Review the PR created by the bot
2. Test locally:
   ```bash
   git fetch origin
   git checkout plugin-updates
   nvim  # Test the updates
   ```
3. Complete the testing checklist
4. Merge if everything works

---

### Stale Management Workflow (`stale.yml`)

**Triggers:** Daily at midnight UTC

**Configuration:**

**Issues:**
- Marked stale after 60 days of inactivity
- Closed after 14 more days
- Exempt labels: `pinned`, `security`, `roadmap`

**Pull Requests:**
- Marked stale after 30 days of inactivity
- Closed after 7 more days
- Exempt labels: `pinned`, `security`

**Usage:**
- Automatically manages inactive issues/PRs
- Removes stale label when updated
- No manual intervention required

**Preventing Stale:**
- Add `pinned` label to keep open indefinitely
- Comment on the issue/PR to reset the timer

---

## 📋 Issue Templates

### Bug Report (`ISSUE_TEMPLATE/bug_report.md`)

**Use when:** Reporting bugs or unexpected behavior

**Includes:**
- Description
- Steps to reproduce
- Expected vs actual behavior
- Environment information
- Health check output
- Screenshots

**Creating a bug report:**
1. Go to Issues → New Issue
2. Select "Bug Report" template
3. Fill in all sections
4. Add appropriate labels

---

### Feature Request (`ISSUE_TEMPLATE/feature_request.md`)

**Use when:** Suggesting new features or enhancements

**Includes:**
- Feature description
- Problem statement
- Proposed solution
- Use cases
- Implementation ideas

**Creating a feature request:**
1. Go to Issues → New Issue
2. Select "Feature Request" template
3. Describe the feature and use case
4. Explain why it's valuable

---

## 📝 Pull Request Template

**Automatically applied** to all new pull requests.

**Includes:**
- Description and issue reference
- Type of change checklist
- Testing requirements
- Environment information
- Documentation updates checklist

**Creating a PR:**
1. Push your branch to GitHub
2. Create pull request
3. Template will auto-populate
4. Fill in all sections
5. Complete checklist before requesting review

---

## 🔧 Workflow Configuration

### Modifying Workflows

All workflows are in `workflows/*.yml`. To modify:

1. Edit the YAML file
2. Test changes in a branch
3. Create PR to review changes
4. Merge to main to activate

### Disabling Workflows

To temporarily disable a workflow:

1. Go to Actions tab
2. Select the workflow
3. Click "..." → "Disable workflow"

Or remove/rename the workflow file.

### Adding New Workflows

1. Create new `.yml` file in `workflows/`
2. Define triggers and jobs
3. Test in a feature branch
4. Document in this README

---

## 🏷️ Labels

Recommended labels for issues and PRs:

**Type:**
- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Documentation improvements
- `question` - Further information requested

**Priority:**
- `critical` - Blocking issue
- `high` - Important
- `medium` - Normal priority
- `low` - Nice to have

**Status:**
- `stale` - No activity
- `wontfix` - Will not be addressed
- `duplicate` - Already exists
- `good first issue` - Good for newcomers

**Category:**
- `plugin` - Related to plugins
- `theme` - Theme-related
- `lsp` - LSP configuration
- `keybinding` - Keybinding issue

**Automated:**
- `dependencies` - Dependency updates
- `automated` - Created by automation

---

## 📊 Monitoring

### Checking Workflow Status

**View all workflows:**
1. Go to Actions tab
2. See recent workflow runs
3. Click on run to see details

**Check specific workflow:**
1. Actions tab → Select workflow
2. View run history
3. Click run for logs

### Workflow Badges

Add to README.md:

```markdown
![CI](https://github.com/dotbrains/nvim/workflows/CI/badge.svg)
![Release](https://github.com/dotbrains/nvim/workflows/Release/badge.svg)
```

---

## 🔐 Secrets

No secrets are required for current workflows. All use `GITHUB_TOKEN` which is automatically provided.

If adding workflows that need secrets:

1. Go to Settings → Secrets and variables → Actions
2. Add new repository secret
3. Reference in workflow: `${{ secrets.SECRET_NAME }}`

---

## 📚 Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Issue Templates Guide](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests)

---

## 🛠️ Troubleshooting

**Workflow failing?**
1. Check the logs in Actions tab
2. Verify all dependencies are correct
3. Test locally with similar commands
4. Check for breaking changes in actions

**PR checks not running?**
1. Verify workflow file is on main branch
2. Check if workflows are enabled
3. Ensure proper permissions are set

**Updates PR not created?**
1. Check workflow logs
2. Verify no plugins were updated
3. Check permissions for PR creation

---

For more information, see [CONTRIBUTING.md](../CONTRIBUTING.md).
