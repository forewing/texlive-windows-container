function New-FontReg($name, $file) {
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts' -Name $name -PropertyType String -Value $file
}

New-FontReg 'Microsoft YaHei & Microsoft YaHei UI (TrueType)' msyh.ttc
New-FontReg 'Microsoft YaHei Bold & Microsoft YaHei UI Bold (TrueType)' msyhbd.ttc
New-FontReg 'Microsoft YaHei Light & Microsoft YaHei UI Light (TrueType)' msyhl.ttc

Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
