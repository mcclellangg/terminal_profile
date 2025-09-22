# INSTALL MODULES
# Install-Module -Name Terminal-Icons
# Install-Module -Name PS-Menu
# Install-Module -Name BurntToast

# IMPORTS
Import-Module -Name Terminal-Icons
Import-Module -Name PS-Menu
Import-Module -Name BurntToast

# VARIABLES
# Load from config
$configPath = "$HOME\Documents\PowerShell\config.ps1" 

try {
    if (Test-Path $configPath) {
        . $configPath
        # Write-Host "✅ Config loaded successfully from $configPath" -ForegroundColor Green
    }
    else {
        throw "Config file not found at: $configPath"
    }
}
catch {
    Write-Host "❌ Failed to load config: $_" -ForegroundColor Red
}

# FUNCTIONS
function dev {
    Set-Location -Path $dev
    Get-ChildItem 
}

function para {
    Set-Location -Path $para
}

function sketch {
    Set-Location -Path $sketchbook
}

function st {
    # Set-Title
    $path = Get-Location
    $lowest_directory = Split-Path -path $path -Leaf
    $host.UI.RawUI.WindowTitle = $lowest_directory
}

function mdl {
    # Run md_linkify.py script to create markdown formatted links from user input
    # This script is located in the dev/tools directory.
    # python "C:\Users\mccle\dev\tools\md_linkify\md_linkify.py" @args
}

function cdx {
    # Display code repos, and navigate to selected.
    $repo_map = [ordered]@{} # hash tables don't normally perserve order
    $sorted_dirs = Get-ChildItem -Path $repos -Directory | Sort-Object LastWriteTime -Descending
    
    # Populate hash table
    $sorted_dirs | ForEach-Object { $repo_map[$_.Name] = $_.FullName }
    try {
        $repo_name = menu @($repo_map.keys)
        $selected_repo = $repo_map[$repo_name]
        Set-Location -Path $selected_repo
        Get-ChildItem # Display repo contents to user
    } catch {
        Write-Host 
        Write-Host "Error occurred: $_"
    }
}

function src ([string] $pattern, [string]$path=".") {
    <# 
    .SYNOPSIS 
    Searches subdirectories for pattern given by user. (Searching current working directory by default)
    
    .EXAMPLE
    src "error" "C:\Logs"

    .NOTES
    Uses "inline parameter declaration" (which I much prefer to the param block style)
    #>
    Get-ChildItem -Path $path -Recurse -File | Select-String -Pattern $pattern
}

function help() {
    Write-Output "--------------"
    Write-Output "NAVIGATION";
    Write-Output "--------------"
    Write-Output "dev - navigate to dev, and display directory";
    Write-Output "para - navigate to PARA directory";

    Write-Output "--------------"
    Write-Output "UTILITIES";
    Write-Output "--------------"
    Write-Output "st - Renames the title window for terminal to current lowest directory";
    Write-Output "cdx - Displays a menu of code repos, changes location to one selected by user";
    Write-Output 'src - Search subdirs for pattern. EX - src "error" "C:\Logs"';
    Write-Output "mdl - Run md_linkify.py script to create markdown formatted links from user input";
}

# ALIASES
Set-Alias -Name np "C:\Program Files\Notepad++\notepad++.exe"
Set-Alias -Name g -Value "C:\Program Files\Git\cmd\git.exe"

# MAIN
Set-PSReadlineKeyHandler -Chord Alt+F4 -Function ViExit # Add close window shortcut
if ($env:TERM_PROGRAM -ne "vscode") {
    Set-Location -Path $dev
}
oh-my-posh init pwsh --config "C:\Users\mccle\dev\terminal_themes\dracula.omp.json" | Invoke-Expression
