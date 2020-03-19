FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY test-fonts.ps1 install-fonts.ps1 C:/temp/
COPY msyh.ttc msyhbd.ttc msyhl.ttc C:/temp/fonts-to-be-installed/

WORKDIR C:/temp/
RUN powershell ./install-fonts.ps1
RUN powershell ./test-fonts.ps1
