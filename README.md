# 🛠️ Demo Project: Git Crash Course — Hands-On Walkthrough

<div align="center">
  <h3>Git Tutorial for Beginners: Learn Git in 1 Hour (2026)</h3>
  <a href="https://www.youtube.com/watch?v=XLJuoOBm7Go">
    <img src="https://img.youtube.com/vi/XLJuoOBm7Go/maxresdefault.jpg" alt="Watch the Git Tutorial for Beginners" style="width:100%; max-width:600px;">
  </a>
  <p><i>Click the image to master Git and GitHub workflow on YouTube</i></p>
</div>
This demo walks through every command shown in the video, step by step.
Clone this repo or follow along in a fresh terminal.

## 📋 Prerequisites

- Git installed (`git --version` should return a version)
- A terminal (Bash, Zsh, or Git Bash on Windows)
- A GitHub account (free) for the remote sections

---

## 🏁 PART 1: First Repository

```bash
# Create a fresh project
mkdir git-demo && cd git-demo

# Initialize Git
git init
# Output: Initialized empty Git repository in ~/git-demo/.git/

# Check status (nothing tracked yet)
git status

# Create your first file
echo "# Git Demo Project" > README.md
echo "A hands-on demo for the Git Crash Course video." >> README.md

# Check status again — file is now "untracked" (red)
git status

# Stage the file
git add README.md

# Status again — file is now "staged" (green)
git status

# Make your first commit
git commit -m "Initial commit: add README"

# See your first commit in history
git log --oneline
```

---

## 📁 PART 2: Building Up History

```bash
# Create a src directory with a JS file
mkdir src
cat > src/index.js << 'EOF'
// Main entry point
function greet(name) {
  return `Hello, ${name}! Welcome to Git.`;
}

console.log(greet("World"));
EOF

# Create a package.json
cat > package.json << 'EOF'
{
  "name": "git-demo",
  "version": "1.0.0",
  "description": "A Git crash course demo project",
  "main": "src/index.js",
  "scripts": {
    "start": "node src/index.js"
  }
}
EOF

# Create .gitignore (ALWAYS do this early!)
cat > .gitignore << 'EOF'
# Dependencies
node_modules/

# Build output
dist/
build/

# Environment variables — NEVER commit these
.env
.env.local
*.key

# OS files
.DS_Store
Thumbs.db

# Editor files
.vscode/settings.json
EOF

# Stage everything
git add .

# Check what we're about to commit
git status
git diff --staged

# Commit
git commit -m "feat: add project structure and .gitignore"

# View history
git log --oneline
# You should now see 2 commits
```

---

## 🌿 PART 3: Branching

```bash
# See current branches
git branch
# Output: * main

# Create AND switch to a new branch in one command
git checkout -b feature/dark-mode

# Confirm we're on the new branch
git branch
# Output:
# * feature/dark-mode
#   main

# Create a dark mode stylesheet
mkdir -p src/styles
cat > src/styles/dark-mode.css << 'EOF'
/* Dark Mode Styles */
:root {
  --bg-color: #1a1a2e;
  --text-color: #e8e8e8;
  --accent: #F05032;
}

body.dark {
  background-color: var(--bg-color);
  color: var(--text-color);
}

a.dark {
  color: var(--accent);
}
EOF

# Update index.js to import dark mode
cat >> src/index.js << 'EOF'

// Dark mode toggle
function toggleDarkMode() {
  document.body.classList.toggle('dark');
}
EOF

# Stage and commit on the feature branch
git add .
git commit -m "feat: add dark mode CSS and toggle function"

# Add another commit on this branch
echo "## Dark Mode" >> README.md
echo "Toggle dark mode with the moon icon in the nav." >> README.md
git add README.md
git commit -m "docs: document dark mode feature"

# Check log on feature branch
git log --oneline
# Should show 4 commits (2 from main + 2 new)

# Switch back to main — notice dark-mode.css is gone!
git checkout main
ls src/styles/
# No styles directory — it's safely in the feature branch

# Merge feature branch into main
git merge feature/dark-mode
# Output: Updating ... Fast-forward

# Dark mode files are now in main
ls src/styles/

# Clean up merged branch
git branch -d feature/dark-mode

# Final history
git log --oneline --graph --all
```

---

## ☁️ PART 4: Push to GitHub

```bash
# Step 1: Create a new repo on GitHub
# Go to github.com → New Repository
# Name: git-demo
# Leave it completely empty (no README, no .gitignore)
# Click "Create Repository"

# Step 2: Connect your local repo to GitHub
# Replace YOUR-USERNAME with your GitHub username
git remote add origin https://github.com/YOUR-USERNAME/git-demo.git

# Verify remote was added
git remote -v
# Output:
# origin  https://github.com/YOUR-USERNAME/git-demo.git (fetch)
# origin  https://github.com/YOUR-USERNAME/git-demo.git (push)

# Step 3: Push all commits to GitHub
git push -u origin main
# -u sets upstream tracking so future pushes are just: git push

# Step 4: Make a change and push it
echo "## Contributing" >> README.md
echo "Fork this repo and submit a PR!" >> README.md
git add README.md
git commit -m "docs: add contributing section"
git push
# No need to specify origin main anymore!

# Step 5: Simulate a teammate's commit (edit on GitHub directly)
# In GitHub browser: edit README.md and commit via the UI
# Then pull their change to your local machine:
git pull
git log --oneline
# Your local history now includes the teammate's commit
```

---

## ⚔️ PART 5: Merge Conflicts (Simulation)

```bash
# We'll simulate a conflict between two branches touching the same file

# On main, edit the greeting in index.js
sed -i 's/Hello, ${name}! Welcome to Git./Hello, ${name}! Learn Git in 2026./' src/index.js
git add src/index.js
git commit -m "chore: update welcome message for 2026"

# Create a feature branch from the same starting point (one commit back)
git checkout -b feature/greeting-update HEAD~1

# On this branch, make a DIFFERENT change to the same line
sed -i 's/Hello, ${name}! Welcome to Git./Hi there, ${name}! Master Git today./' src/index.js
git add src/index.js
git commit -m "feat: personalize greeting message"

# Try to merge back into main — this will conflict!
git checkout main
git merge feature/greeting-update
# Output: CONFLICT (content): Merge conflict in src/index.js

# View the conflict
cat src/index.js
# You'll see:
# <<<<<<< HEAD
#   return `Hello, ${name}! Learn Git in 2026.`;
# =======
#   return `Hi there, ${name}! Master Git today.`;
# >>>>>>> feature/greeting-update

# Resolve: pick one or combine them
# Let's use a combination. Edit src/index.js to:
cat > src/index.js << 'EOF'
// Main entry point
function greet(name) {
  return `Hi there, ${name}! Learn Git in 2026.`;
}

console.log(greet("World"));

// Dark mode toggle
function toggleDarkMode() {
  document.body.classList.toggle('dark');
}
EOF

# Stage the resolved file
git add src/index.js

# Check status — should show "All conflicts fixed"
git status

# Commit the resolution
git commit -m "resolve: merge conflict in greeting — combined messages"

# View final history
git log --oneline --graph --all

# Clean up
git branch -d feature/greeting-update
```

---

## 🔄 PART 6: Useful Undo Commands

```bash
# Scenario 1: Undo unstaged changes to a file
echo "oops typo" >> README.md
git diff README.md
git restore README.md    # Discards the change
git diff README.md       # Nothing — change is gone

# Scenario 2: Unstage a staged file (keep the changes)
echo "oops staged too early" >> README.md
git add README.md
git status               # README is staged
git restore --staged README.md  # Back to unstaged
git status               # README is modified but not staged
git restore README.md    # Discard it

# Scenario 3: Stash work in progress
echo "half-finished feature" >> src/index.js
git stash               # Temporarily shelves your changes
git status              # Clean working directory
git stash pop           # Restore the stashed changes
git restore src/index.js  # Clean up

# Scenario 4: Undo last commit (keep changes unstaged)
git commit -m "test: accidentally committed"  src/index.js 2>/dev/null || true
git log --oneline       # See the accidental commit
git reset HEAD~1        # Undo last commit, keep file changes
git log --oneline       # Commit is gone
git status              # But changes are still here
git restore src/index.js  # Clean up

# Scenario 5: Safe undo with revert (creates a new commit)
# This is the SAFE way to undo in shared branches
LAST_COMMIT=$(git log --oneline | head -1 | awk '{print $1}')
# git revert $LAST_COMMIT --no-edit   # Uncomment to try
```

---

## 🏁 Final Project Structure

After completing all parts, your project should look like:

```
git-demo/
├── .git/               ← Git's database (don't touch!)
├── .gitignore          ← Files Git should ignore
├── README.md           ← Project documentation
├── package.json        ← Node.js metadata
└── src/
    ├── index.js        ← Main JavaScript entry point
    └── styles/
        └── dark-mode.css ← Dark mode CSS
```

---

## 📋 Quick Reference — All Commands Used

```bash
git init                    # Initialize a new repo
git status                  # Show working tree status
git add <file>              # Stage a file
git add .                   # Stage all changes
git commit -m "message"     # Save a snapshot
git log --oneline           # Compact history
git log --oneline --graph   # Visual branch history
git diff                    # Show unstaged changes
git diff --staged           # Show staged changes

git branch                  # List branches
git checkout -b <name>      # Create + switch branch
git checkout <name>         # Switch branch
git merge <branch>          # Merge branch into current
git branch -d <name>        # Delete merged branch

git remote add origin <url> # Link to remote
git push -u origin main     # Push + set upstream
git push                    # Push (after upstream set)
git pull                    # Fetch + merge from remote
git fetch                   # Fetch only (no merge)
git remote -v               # Show remote connections

git restore <file>          # Discard working changes
git restore --staged <file> # Unstage file
git reset HEAD~1            # Undo last commit (keep changes)
git stash                   # Shelve changes temporarily
git stash pop               # Restore stashed changes
git revert <hash>           # Safe undo (new commit)
```

---

## 🎓 What to Practice Next

1. **Create a GitHub account** and push a real project
2. **Collaborate** — fork a public repo and make a pull request
3. **Practice branching** at learngitbranching.js.org
4. **Explore** GitHub Actions for basic CI/CD
5. **Read** the Pro Git book (free at git-scm.com/book)
