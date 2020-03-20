FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY msyh.ttc msyhbd.ttc msyhl.ttc c:/windows/fonts/

RUN powershell.exe -NoProfile -Command New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts' -Name 'Microsoft YaHei & Microsoft YaHei UI (TrueType)' -PropertyType String -Value msyh.ttc
RUN powershell.exe -NoProfile -Command New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts' -Name 'Microsoft YaHei Bold & Microsoft YaHei UI Bold (TrueType)' -PropertyType String -Value msyhbd.ttc
RUN powershell.exe -NoProfile -Command New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts' -Name 'Microsoft YaHei Light & Microsoft YaHei UI Light (TrueType)' -PropertyType String -Value msyhl.ttc

# WORKDIR C:/temp/
# RUN powershell ./install-fonts.ps1
RUN powershell Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
