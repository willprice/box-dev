# Windows Developer Box setup

## Usage:

Install [chocolatey](https://chocolatey.org/install):

With `cmd.exe`:

```cmd
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

or with `powershell.exe`

```powershell
Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Install boxstarter:

```powershell
cinst -y boxstarter
```

Finally run the install script using the boxstarter shell by running `install.ps1` or by running:

```powershell
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/willprice/box-dev/master/install.ps1 -DisableReboots
```


## Optional

### Thinkpads

* Install [ThinkVantage](https://support.lenovo.com/gb/en/solutions/ht037696) utilities.
