Invoke-WebRequest -Uri "http://mirror.ctan.org/systems/texlive/tlnet/install-tl.zip" -OutFile "install-tl.zip"
Expand-Archive -Path install-tl.zip -DestinationPath install-tl
Set-Location install-tl
Move-Item -Path ./install-tl-*/* -Destination ./
New-Item -Path 'C:/texlive' -ItemType Directory
./install-tl-windows.bat --profile=../texlive.profile
xelatex --version