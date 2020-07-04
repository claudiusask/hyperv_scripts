# Powershell code to create a New VM
# READ more over here https://docs.microsoft.com/en-us/powershell/module/hyper-v/?view=win10-ps

New-VM -Name ldap -MemoryStartupBytes 1.5GB -BootDevice NetworkAdapter -NewVHDPath C:\Users\Public\Documents\Hyper-V\ldap\ldap.vhdx -Path C:\ProgramData\Microsoft\Windows\Hyper-V -NewVHDSizeBytes 32GB -Generation 1 -Switch LAN11Katello