# import modules
Import-Module posh-git
Import-Module PSReadLine
Import-Module oh-my-posh

# set theme for posh-git
Set-PoshPrompt -Theme Paradox

# set PSReadLine auto complete
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key "Tab" -Function Complete
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# for Python
$env:PATHEXT += ";.py"
function UpdatePythonPackages {
    Write-Host "Update all outdated Python package" -ForegroundColor Magenta -BackgroundColor Cyan
    $a = pip list --outdated
    $num_package = $a.Length - 2
    for ($i = 0; $i -lt $num_package; $i++) {
        $tmp = ($a[2 + $i].Split(" "))[0]
        pip install -U $tmp
    }
}

# set alias for wsl2-ssh script
function SetSshForWsl {
    C:\Software\wsl_ssh.ps1
}
Set-Alias wslssh SetSshForWsl
Set-Alias -Name ll -Value Get-ChildItem