FROM mcr.microsoft.com/windows/servercore:ltsc2019

# COPY msyh.ttc msyhbd.ttc msyhl.ttc c:/windows/fonts/

RUN ${source:-obj/Docker/publish/InstallFont.ps1}

WORKDIR C:/temp/
COPY test-fonts.ps1 C:/temp/
RUN powershell ./test-fonts.ps1

# RUN powershell ./install-fonts.ps1
