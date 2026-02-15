#!/usr/bin/env bash
# =============================================================
#  Git Crash Course — Command Cheat Sheet
#  "Zero to Confident" — 2026 Edition
#  Run: bash cheatsheet.sh  (or source it for functions)
# =============================================================

echo "
╔══════════════════════════════════════════════════════════════╗
║          GIT CHEAT SHEET — Zero to Confident 2026           ║
╚══════════════════════════════════════════════════════════════╝
"

# ─────────────────────────────────────────────────────────────
# 🏁  SETUP & CONFIG
# ─────────────────────────────────────────────────────────────
echo "═══ 🏁 SETUP & CONFIG ═══════════════════════════════════"
cat << 'CMDS'
  git --version                          # Check Git version
  git config --global user.name "Name"   # Set your name
  git config --global user.email "e@m"   # Set your email
  git config --global core.editor "code --wait"  # Set editor
  git config --list                      # View all config
CMDS

# ─────────────────────────────────────────────────────────────
# 📁  INITIALIZE & CLONE
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ 📁 INITIALIZE & CLONE ═══════════════════════════════"
cat << 'CMDS'
  git init                               # Init new local repo
  git init <folder>                      # Init in new folder
  git clone <url>                        # Clone remote repo
  git clone <url> <folder>               # Clone into folder
CMDS

# ─────────────────────────────────────────────────────────────
# 📸  SNAPSHOT (STAGE & COMMIT)
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ 📸 STAGE & COMMIT ═══════════════════════════════════"
cat << 'CMDS'
  git status                             # Show working tree
  git add <file>                         # Stage a file
  git add .                              # Stage all changes
  git add -p                             # Interactively stage hunks
  git commit -m "type: message"          # Commit with message
  git commit --amend                     # Edit last commit (not pushed!)
  git diff                               # Unstaged changes
  git diff --staged                      # Staged changes
CMDS

# ─────────────────────────────────────────────────────────────
# 📜  HISTORY & INSPECT
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ 📜 HISTORY & INSPECT ════════════════════════════════"
cat << 'CMDS'
  git log                                # Full history
  git log --oneline                      # Compact history
  git log --oneline --graph --all        # Visual branch graph
  git log -n 5                           # Last 5 commits
  git log --author="Name"                # Filter by author
  git show <hash>                        # Show commit details
  git blame <file>                       # Who wrote each line
CMDS

# ─────────────────────────────────────────────────────────────
# 🌿  BRANCHING
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ 🌿 BRANCHING ════════════════════════════════════════"
cat << 'CMDS'
  git branch                             # List local branches
  git branch -a                          # List all (incl. remote)
  git branch <name>                      # Create a branch
  git checkout <name>                    # Switch to branch
  git checkout -b <name>                 # Create + switch ⭐
  git switch <name>                      # Modern: switch
  git switch -c <name>                   # Modern: create + switch
  git merge <branch>                     # Merge into current
  git branch -d <name>                   # Delete merged branch
  git branch -D <name>                   # Force delete
  git branch -m <old> <new>              # Rename branch
CMDS

# ─────────────────────────────────────────────────────────────
# ☁️  REMOTE REPOSITORIES
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ ☁️  REMOTE ═══════════════════════════════════════════"
cat << 'CMDS'
  git remote -v                          # List remotes
  git remote add origin <url>            # Add remote
  git remote remove origin               # Remove remote
  git push origin <branch>               # Push branch
  git push -u origin <branch>            # Push + track ⭐
  git push                               # Push (tracked branch)
  git push --all                         # Push all branches
  git pull                               # Fetch + merge ⭐
  git pull origin <branch>               # Pull specific branch
  git fetch                              # Fetch (no merge)
  git fetch --all                        # Fetch all remotes
CMDS

# ─────────────────────────────────────────────────────────────
# ⏪  UNDO & REVERT
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ ⏪ UNDO & REVERT ════════════════════════════════════"
cat << 'CMDS'
  git restore <file>                     # Discard working changes
  git restore --staged <file>            # Unstage file
  git reset HEAD~1                       # Undo commit (keep files)
  git reset --soft HEAD~1                # Undo commit (keep staged)
  git reset --hard HEAD~1                # Undo commit + discard ⚠️
  git revert <hash>                      # Safe undo (new commit)
  git revert HEAD                        # Revert last commit
  git stash                              # Stash work-in-progress
  git stash pop                          # Restore stash
  git stash list                         # List stashes
  git stash drop                         # Delete stash
CMDS

# ─────────────────────────────────────────────────────────────
# 🔀  REBASE & ADVANCED
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ 🔀 REBASE & ADVANCED ════════════════════════════════"
cat << 'CMDS'
  git rebase main                        # Rebase onto main
  git rebase -i HEAD~3                   # Interactive rebase (last 3)
  git cherry-pick <hash>                 # Apply a commit
  git tag v1.0.0                         # Create tag
  git tag -a v1.0.0 -m "Release v1.0.0" # Annotated tag
  git push origin --tags                 # Push tags to remote
  git clean -fd                          # Remove untracked files ⚠️
CMDS

# ─────────────────────────────────────────────────────────────
# 🔍  SEARCH
# ─────────────────────────────────────────────────────────────
echo ""
echo "═══ 🔍 SEARCH ═══════════════════════════════════════════"
cat << 'CMDS'
  git grep "pattern"                     # Search in tracked files
  git log --grep="keyword"               # Search commit messages
  git log -S "code-string"               # Find commits adding text
  git bisect start                       # Binary search for bug
CMDS

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "  💡 TIP: Use 'git help <command>' for full docs"
echo "  🌐 WEB: https://git-scm.com/docs"
echo "  🎮 PRACTICE: https://learngitbranching.js.org"
echo "═══════════════════════════════════════════════════════════"
echo ""

# ─────────────────────────────────────────────────────────────
# 📝  COMMIT MESSAGE CONVENTIONS
# ─────────────────────────────────────────────────────────────
echo "═══ 📝 CONVENTIONAL COMMIT MESSAGES ════════════════════"
cat << 'EXAMPLES'

  Format:  <type>: <short description>

  Types:
    feat:      New feature
    fix:       Bug fix
    docs:      Documentation only
    style:     Formatting (no code change)
    refactor:  Code restructuring
    test:      Adding/updating tests
    chore:     Maintenance (deps, config)
    perf:      Performance improvement
    ci:        CI/CD changes
    revert:    Reverting a previous commit

  Examples:
    feat: add OAuth2 login with Google
    fix: resolve null pointer in user profile page
    docs: update README with installation steps
    refactor: extract auth logic into separate service
    chore: upgrade dependencies to latest versions

EXAMPLES

echo "═══════════════════════════════════════════════════════════"
echo ""
