$base = "https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20{0}%20for%20Powerline.ttf?raw=true"
$progressPreference = 'silentlyContinue'

mkdir -f Fonts

Invoke-WebRequest -Uri $($base -f "Regular") -OutFile "Fonts/Regular.ttf"
Invoke-WebRequest -Uri $($base -f "Bold") -OutFile "Fonts/Bold.ttf"
Invoke-WebRequest -Uri $($base -f "Italic") -OutFile "Fonts/Italic.ttf"
Invoke-WebRequest -Uri $($base -f "Bold%20Italic") -OutFile "Fonts/Bold Italic.ttf"

pause