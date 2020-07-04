# Set VM Name, Switch Name, and Installation Media Path.
#katello = 'katello'
#'LAN11 - katello' = 'LAN11 - katello'
#$InstallMedia = 'E:\Full_D_drive_Copy\ISO_z\Centos_7\CentOS-7-x86_64-Everything-2003.iso'
#$kickstart = 'C:\Users\alidr\Dropbox\my_scripts\hl_local_project\kickstart.iso'

# Create New Virtual Machine
New-VM -Name katello -MemoryStartupBytes 12288MB -Generation 1 -NewVHDPath "C:\Users\Public\Documents\Hyper-V\katello\katello.vhdx" -NewVHDSizeBytes 135GB -Path "D:\Virtual Machines\katello" -SwitchName 'LAN11 - Katello'

# Add DVD Drive to Virtual Machine
Add-VMScsiController -VMName katello
Add-VMDvdDrive -VMName katello -ControllerNumber 1 -ControllerLocation 0 -Path 'E:\Full_D_drive_Copy\ISO_z\Centos_7\CentOS-7-x86_64-Everything-2003.iso'
Add-VMDvdDrive -VMName katello -ControllerNumber 1 -ControllerLocation 1 -Path 'C:\Users\alidr\Dropbox\my_scripts\hl_local_project\kickstart.iso'

# Mount Installation Media
$DVDDrive = Get-VMDvdDrive -VMName katello

# Configure Virtual Machine to Boot from DVD
Set-VMFirmware -VMName katello -FirstBootDevice $DVDDrive