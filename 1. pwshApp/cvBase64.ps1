function deBase64($String) { 
    return [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($String)) 
} # deBase64 "Charlotte"

function enBase64($Code) { 
    return [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($code)) 
} # enBase64 "Q2hhcmxvdHRl"
