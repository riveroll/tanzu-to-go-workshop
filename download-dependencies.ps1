$ENV:VENDIR_GITHUB_API_TOKEN = "<your-github-token>"

# Download installation files
ytt -f setup/vendir.yml --data-values-file config.yaml | vendir sync --chdir setup -f-

# Make binaries executable and put them in the PATH
if ( -not (Test-Path -Path $HOME\tce))
{
    mkdir $HOME\tce
    mkdir $HOME\tce\bin
}

# Copy files to the bin directory under $HOME\tce
copy setup\vendir\binaries\kn\kn* $HOME\tce\bin\kn.exe
copy setup\vendir\binaries\kp\kp* $HOME\tce\bin\kp.exe
copy setup\vendir\binaries\yq\yq* $HOME\tce\bin\yq.exe
copy setup\vendir\binaries\kubectl\kub* $HOME\tce\bin\kubectl.exe

# Add location for tools to path
$ENV:PATH = "$ENV:PATH;$HOME\tce\bin;"
