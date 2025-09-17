# Instructions
Identify profile paths
`$Profile | Format-List -force`

Change to dir for CurrentUserCurrentHost (if installing for yourself)
Note you most likely will not have a profile but double check that one does not already exist.
`cd c:\Users\mccle\Documents\`

Clone this repo
`git clone https://github.com/mcclellangg/terminal_profile.git`

Rename folder (in order to match path specified in CurrentUserCurrentHost)
`Rename-Item .\terminal_profile\ .\PowerShell`

Open dir
`cd .\ PowerShell`

Create config.ps1 and update for local env

### config.ps1
Desktop 
```PowerShell
$profile_path = "C:\Users\mccle\Documents\PowerShell"
$dev = "C:\Users\mccle\dev"
$para = "C:\Users\mccle\vaults\PARA"
$repos = "C:\Users\mccle\dev\repos"
$sketchbook = "C:\Users\mccle\dev\sketchbook"
$win_terminal_profile_path = "C:\Users\mccle\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
```

Laptop
```PowerShell
$profile_path = "C:\Users\mccle\Documents\PowerShell"
$dev = "C:\Users\mccle\dev"
$para = "C:\Users\mccle\dev\vaults\PARA"
$repos = "C:\Users\mccle\dev\repos"
# $sketchbook = "C:\Users\mccle\dev\sketchbook"
# $win_terminal_profile_path = "C:\Users\mccle\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
```

Install Modules (recomment and update git)

oh-my-posh  will require separate install