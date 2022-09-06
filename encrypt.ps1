Param($text = "", $lang = "ja")
if($text -eq ""){
    $text = Get-Content "output/${lang}/_AutoGeneratedTranslations.txt" -Encoding UTF8
}
$text = $text -join "`r`n" | Out-String
$encryptedKey = (1..16)
$encrypted = ConvertTo-SecureString -String $text -AsPlainText -Force
ConvertFrom-SecureString -SecureString $encrypted -Key $encryptedKey
