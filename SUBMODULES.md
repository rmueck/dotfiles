# Nested Repositories

This dotfiles repository contains nested git repositories:

## FZF (Fuzzy Finder)
- Location: `fzf/.fzf/`
- Repo: https://github.com/junegunn/fzf.git
- Purpose: Command-line fuzzy finder
- Update: `cd fzf/.fzf && git pull`

## Vim Plugins
- Location: `vim/.vim/bundle/`
- Various plugin repos
- Update: `cd vim/.vim/bundle/<plugin> && git pull`

## Handling Options

### Option 1: Ignore Changes (Recommended for users)
```bash
git config diff.ignoreSubmodules dirty
git config status.ignoreSubmodules dirty
```

### Option 2: Track as Submodules (Advanced)
Convert to proper submodules if you want version tracking:
```bash
git submodule add <url> <path>
```

### Option 3: Update Nested Repos
To update nested repos to latest:
```bash
find ~/.dotfiles -mindepth 2 -name ".git" -type d | while read gitdir; do
    repo_dir=$(dirname "$gitdir")
    echo "Updating $repo_dir"
    (cd "$repo_dir" && git pull)
done
```
