FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY msyh.ttc msyhbd.ttc msyhl.ttc c:/windows/fonts/

WORKDIR C:/temp/
COPY install-fonts.ps1 install-texlive.ps1 texlive.profile C:/temp/
RUN powershell ./install-fonts.ps1
RUN powershell ./install-texlive.ps1
