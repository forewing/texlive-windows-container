FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY test-fonts.ps1 C:/temp/

WORKDIR C:/temp/
RUN ./test-fonts.ps1
