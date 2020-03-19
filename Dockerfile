FROM mcr.microsoft.com/windows:10.0.17763.1098

RUN New-Item -Path 'C:/temp' -ItemType Directory

COPY install-texlive.ps1 C:/temp/
COPY texlive.profile C:/temp/

RUN ./install-texlive.ps1

RUN New-Item -Path 'C:/data' -ItemType Directory
WORKDIR C:/data