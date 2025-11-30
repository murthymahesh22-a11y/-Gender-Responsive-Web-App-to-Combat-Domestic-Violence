Param(
  [string]$RepoUrl = "https://github.com/<your-username>/<your-repo>.git",
  [string]$Branch = "main"
)

Write-Host "Pushing repository to remote and triggering GitHub Actions deploy..."

Set-Location -Path "$PSScriptRoot\.."

if (-not (Test-Path .git)) {
  git init
}

git add .
git commit -m "Deploy website: update" -a --allow-empty

git remote remove origin -ErrorAction SilentlyContinue
git remote add origin $RepoUrl
git branch -M $Branch
git push -u origin $Branch

Write-Host "Push complete. Monitor Actions tab on GitHub to see deployment status." 
