function deBase64($String) {
    return [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($String))
} # deBase64 "SampleString"

function enBase64($Code) {
    return [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($code))
} # enBase64 "U2FtcGxlU3RyaW5n"
