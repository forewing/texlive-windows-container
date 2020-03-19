FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY test-fonts.ps1 C:/temp/
COPY install-fonts.ps1 C:/temp/
COPY C:/Windows/Fonts/msyh.ttc C:/temp/fonts-to-be-installed/
COPY C:/Windows/Fonts/msyhbd.ttc C:/temp/fonts-to-be-installed/
COPY C:/Windows/Fonts/msyhl.ttc C:/temp/fonts-to-be-installed/

WORKDIR C:/temp/
RUN powershell ./install-fonts.ps1
RUN powershell ./test-fonts.ps1
