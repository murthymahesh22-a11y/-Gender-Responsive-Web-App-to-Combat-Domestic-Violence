Param(
  [int]$Port = 8000
)

Set-Location -Path "$PSScriptRoot\.."

# Use npx to run serve non-interactively
npx --yes serve -s . -l $Port
