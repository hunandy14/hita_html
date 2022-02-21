# https://github.com/RedAndBlueEraser/rdp-file-password-encryptor
function decryptor {
    Param(
    [Parameter(Mandatory=$true)]
    [String]$PasswordEncryptedAsHex
    )

    Add-Type -AssemblyName System.Security

    [System.Text.UnicodeEncoding]$encoding = [System.Text.Encoding]::Unicode
    [int]$passwordEncryptedAsBytesLength = $PasswordEncryptedAsHex.Length / 2
    [byte[]]$passwordEncryptedAsBytes = New-Object -TypeName byte[] -ArgumentList $passwordEncryptedAsBytesLength
    for ($i = 0; $i -lt $passwordEncryptedAsBytesLength; $i++) {
        $passwordEncryptedAsBytes[$i] = [Convert]::ToByte($PasswordEncryptedAsHex.Substring($i * 2, 2), 16)
    }
    [byte[]]$passwordAsBytes = [System.Security.Cryptography.ProtectedData]::Unprotect($passwordEncryptedAsBytes, $null, [System.Security.Cryptography.DataProtectionScope]::CurrentUser)
    [string]$password = $encoding.GetString($passwordAsBytes)
    return $password
}

function encryptor {
    Param(
        [Parameter(Mandatory=$true)]
        [String]$Password
    )

    Add-Type -AssemblyName System.Security

    [System.Text.UnicodeEncoding]$encoding = [System.Text.Encoding]::Unicode
    [byte[]]$passwordAsBytes = $encoding.GetBytes($Password)
    [byte[]]$passwordEncryptedAsBytes = [System.Security.Cryptography.ProtectedData]::Protect($passwordAsBytes, $null, [System.Security.Cryptography.DataProtectionScope]::CurrentUser)
    [string]$passwordEncryptedAsHex = -join ($passwordEncryptedAsBytes | ForEach-Object { $_.ToString("X2") })
    return $passwordEncryptedAsHex
}
