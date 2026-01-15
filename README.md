# Blog workspace

This workspace is a Hugo site with a separate GitHub Pages output repo.
We intentionally avoid git submodules.

## Repository layout
- `/home/lorenzi/blog` is the main git repo (origin: `git@github.com:lorenzifrancesco/blog.git`).
- `lorenziblog/` is the Hugo site root (not its own git repo).
- `lorenziblog/public/` is the generated site and has its own git repo
  (origin: `git@github.com:lorenzifrancesco/lorenzifrancesco.github.io.git`).
- `lorenziblog/public/` is gitignored by the parent repo.

## Submodules policy
This setup does not use git submodules. If you see old submodule metadata
like `.gitmodules` or gitlinks in the parent repo, treat them as legacy.

## Workflow
0. 
1. Work and commit source changes in the parent repo.
2. Build the site into `lorenziblog/public/`.
3. Commit and push from inside `lorenziblog/public/` to publish.
