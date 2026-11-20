$ErrorActionPreference = "Stop"

# Run this script from the root of your Celtics website project.
$imgFolder = Join-Path (Get-Location) "img"
New-Item -ItemType Directory -Force -Path $imgFolder | Out-Null

$photos = @{
  "jayson-tatum.png" = "1628369"
  "paul-george.png" = "202331"
  "derrick-white.png" = "1628401"
  "payton-pritchard.png" = "1630202"
  "sam-hauser.png" = "1630573"
  "mitchell-robinson.png" = "1629011"
  "mike-conley.png" = "201144"
  "luka-garza.png" = "1630568"
  "hugo-gonzalez.png" = "1642864"
  "ron-harper-jr.png" = "1631199"
  "dillon-mitchell.png" = "1641759"
  "chris-cenac-jr.png" = "1643416"
  "baylor-scheierman.png" = "1631248"
  "jordan-walsh.png" = "1641775"
  "neemias-queta.png" = "1629674"
  "amari-williams.png" = "1642873"
  "devin-carter.png" = "1642269"
  "bill-russell.png" = "78049"
  "larry-bird.png" = "1449"
  "kevin-garnett.png" = "708"
}

foreach ($file in $photos.Keys) {
  $url = "https://cdn.nba.com/headshots/nba/latest/1040x760/$($photos[$file]).png"
  $destination = Join-Path $imgFolder $file
  Invoke-WebRequest -Uri $url -OutFile $destination
  Write-Host "Downloaded $file"
}

Write-Host "Finished. Your player photos are now in the img folder."
