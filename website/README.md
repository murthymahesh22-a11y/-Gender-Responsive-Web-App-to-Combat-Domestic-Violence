# Website folder

This folder (`website/`) contains a ready-to-publish static site (Reveal.js slide deck) that you can host on GitHub Pages, Netlify, Vercel, or run locally.

Files:

- `index.html` — slide deck
- `assets/styles.css` — styles

Local preview

From PowerShell in the `website` folder you can run a simple static server with Python (if Python is installed):

```powershell
# serve on port 8000
python -m http.server 8000 --bind 127.0.0.1
# then open http://127.0.0.1:8000 in your browser
```

Quick deploy options

- GitHub Pages (manual):
  1. Create a GitHub repository and push the repository that contains this `website/` folder (or move the files to the repo root).
  2. In the repository settings → Pages, set the Source to the branch (main) and folder (`root` or `/docs`) where `index.html` lives.
  3. Save — GitHub will publish at `https://<username>.github.io/<repo>` (or at your custom domain if configured).

- GitHub Pages (using `gh` CLI):

```powershell
# from the repo root
git init
git add .
git commit -m "Initial site"
gh repo create your-repo-name --public --source=. --push
# then enable Pages in web UI or via gh commands
```

- Netlify (drag & drop):
  - Go to https://app.netlify.com/drop and drop the contents of this `website/` folder.

- Vercel:
  - Install Vercel CLI or use the web dashboard and import the GitHub repo. It will detect a static site and deploy automatically.

If you want, I can add a GitHub Actions workflow that automatically deploys the `website/` folder to the `gh-pages` branch when you push to `main`.

Push to GitHub (exact PowerShell commands)

Use these commands in PowerShell from the project root (replace placeholders):

```powershell
cd 'C:\Users\muert\OneDrive\Desktop\Gender-Responsive Web App to Combat Domestic Violenc'
# initialize git (if not already a git repo)
git init
git add .
git commit -m "Initial site and slide deck"

# If you have the GitHub CLI installed (recommended):
# this will create a new public repository and push the current repo
gh repo create <your-github-username>/<your-repo-name> --public --source=. --push

# If you don't use gh, create a repo on GitHub and then run:
# replace <your-username> and <your-repo> below
git remote add origin https://github.com/<your-username>/<your-repo>.git
git branch -M main
git push -u origin main
```

Notes:
- I added a GitHub Actions workflow at `.github/workflows/deploy-website.yml` which will deploy the `website/` folder to the `gh-pages` branch automatically when you push to `main`.
- After the workflow runs the site will be published at `https://<your-username>.github.io/<your-repo>/` (GitHub Pages). If you prefer publishing from `docs/` or root, change the workflow or repository Pages settings.
