FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell -Command [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
RUN powershell -Command (New-Object System.Drawing.Text.InstalledFontCollection).Families
