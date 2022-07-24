Param($arch = "x64", $lang = "ja")

${BuildDirML} = "MelonLoader/Output/Release"
${BuildDirXU} = "XUnity.AutoTranslator/dist"
${ConfDir} = "XUATConfig"
${OutDir} = "release/HellishQuartJP"

Write-Output "Archtecture: ${arch}"
Write-Output "Output language: ${lang}"

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
If(Test-Path "../output/${lang}/_AutoGeneratedTranslations.txt") {
    Copy-Item "../output/${lang}/_AutoGeneratedTranslations.txt" "${OutDir}/AutoTranslator/Translation/${lang}/Text"
} Else {

}
makensis default.nsi
exit 0