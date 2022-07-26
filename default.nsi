!include MUI2.nsh
!include x64.nsh
!include LogicLib.nsh

Unicode true
Name "Hellish Quart JP"
;InstallDir "C:\Program Files (x86)\Steam\steamapps\common\Hellish Quart"
OutFile "release\HellishQuartJP-installer-1.0.exe"

;-----------------------------------
;Interface Settings
    !define MUI_COMPONENTSPAGE_SMALLDESC
    !define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
    !define MUI_PRODUCT "Hellish Quart JP Ver. 1.0"
    !define MUI_FILE "savefile"
    !define MUI_VERSION ""
    !define MUI_BRANDINGTEXT "Hellish Quart JP Ver. 1.0"
    !define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\orange-install-nsis.ico"
    !define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall-nsis.ico"
    !define MUI_HEADERIMAGE
    !define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-r-nsis.bmp"
    !define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange-nsis.bmp"
    !define MUI_ABORTWARNING
    !define MUI_FINISHPAGE_NOAUTOCLOSE
    !define MUI_LANGDLL_ALLLANGUAGES


;-------------------------------------
; Page Settings
    !insertmacro MUI_PAGE_WELCOME
    ;!insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
    ;!insertmacro MUI_PAGE_DIRECTORY
    Page Directory "" "" PromptDir
    !insertmacro MUI_PAGE_INSTFILES
    !insertmacro MUI_PAGE_FINISH
    !insertmacro MUI_UNPAGE_CONFIRM
    !insertmacro MUI_UNPAGE_INSTFILES

;-------------------------------------
; Lang
    !insertmacro MUI_LANGUAGE "English"
    !insertmacro MUI_LANGUAGE "Japanese"
    LangString DirNotExist ${LANG_Japanese} "$InstDir は存在しません. インストール時に作成しますか?"
    LangString DirNotExist ${LANG_English} "$InstDir does not exist. create during installation?"

; ------------------------------------
Function .onInit
    !insertmacro MUI_LANGDLL_DISPLAY
    ; auto path detection
    ${If} $InstDir == "" ;
        ${If} ${RunningX64}
            SetRegView 64
            ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1000360" "InstallLocation"
            SetRegView LastUsed
            StrCpy $InstDir $0
        ${Else}
            ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1000360" "InstallLocation"
            StrCpy $InstDir $0
        ${EndIf}
    ${EndIf}
FunctionEnd

; check if installation folder is empty
Function PromptDir
    ${If} ${FileExists} "$InstDir\*"
        ;MessageBox MB_OKCANCEL "${FileAlreadyExist}" IDOK +2
        ;Abort
    ${ElseIf} ${FileExists} "$InstDir"
    ${Else}
        MessageBox MB_OKCANCEL "$(DirNotExist)" IDOK +2
        Abort
    ${EndIf}
FunctionEnd

;-------------------------------------
;Installer Sections
Section "Install"
    SetOutPath $InstDir
    File /r "release/HellishQuartJP\*"
SectionEnd