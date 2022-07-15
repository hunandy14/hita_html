function enBase64($String) {
    return [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($String))
} # enBase64 "SampleString"

function deBase64($Code) {
    return [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($code))
} # deBase64 "U2FtcGxlU3RyaW5n"
