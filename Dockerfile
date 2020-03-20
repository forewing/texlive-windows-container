FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY msyh.ttc msyhbd.ttc msyhl.ttc c:/windows/fonts/

WORKDIR C:/temp/
COPY test-fonts.ps1 install-fonts.ps1 C:/temp/
RUN powershell ./install-fonts.ps1
RUN powershell ./test-fonts.ps1

# RUN powershell ./install-fonts.ps1
