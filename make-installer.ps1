Param($arch = "x64", $lang = "ja", [switch]$build)

${VERSION} = "1.5.2-2022.10.17"
${BuildDirML} = "MelonLoader/Output/Release"
${BuildDirXU} = "XUnity.AutoTranslator/dist"
${ConfDir} = "XUATConfig"
${OutDir} = "release/HellishQuartJP"

Write-Output "Archtecture: ${arch}"
Write-Output "Output language: ${lang}"

if ($build) {
    # Build dependencies
    Set-Location MelonLoader
    & "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv" MelonLoader.sln -Build
    Set-Location ../XUnity.AutoTranslator
    & "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv" XUnity.AutoTranslator.sln -Build
    Set-Location ../
}


mkdir ${OutDir} -ea 0 | Out-Null
# MelonLoader
mkdir "${OutDir}/MelonLoader/Dependencies" -Force -ea 0 | Out-Null
Copy-Item "${BuildDirML}/MelonLoader/Melonloader.dll" "${OutDir}/Melonloader" -Force
Copy-Item "${BuildDirML}/MelonLoader/Melonloader.xml" "${OutDir}/Melonloader" -Force
Copy-Item "${BuildDirML}/MelonLoader/Dependencies" "${OutDir}/Melonloader/" -Force -Recurse
Copy-Item "${BuildDirML}/${arch}/MelonLoader/Dependencies/Bootstrap.dll" "${OutDir}/MelonLoader/Dependencies"
Copy-Item "${BuildDirML}/${arch}/version.dll" "${OutDir}" -Force
Copy-Item "${BuildDirML}/../../NOTICE.txt" "${OutDir}" -Force
# XUnity
Copy-Item "${BuildDirXU}/MelonMod/*" "${OutDir}/" -Force -Recurse
# XUnity config and text
mkdir "${OutDir}/AutoTranslator/Translation/${lang}/Text" -Force -ea 0 | Out-Null
Copy-Item "${ConfDir}/Config.ini" "${OutDir}/AutoTranslator" -Force
$encryptedKey = (1..16)
$encryptedText = Get-Content "text/encrypted.txt" | ConvertTo-SecureString -Key $encryptedKey
[System.Runtime.InteropServices.Marshal]::PtrToStringUni(
    [System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode(
        $encryptedText
        )
) | out-file -Encoding utf8 "${OutDir}/AutoTranslator/Translation/${lang}/Text/_AutoGeneratedTranslations.txt"
# make installer
makensis -INPUTCHARSET UTF8 -DVERSION="${VERSION}" default.nsi
exit 0