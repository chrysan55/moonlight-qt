; Build with makensis /DPAYLOAD=<deployed files> /DOUTPUT=<output folder>.
!include "FileFunc.nsh"
!include "LogicLib.nsh"
!include "x64.nsh"

!ifndef PAYLOAD
  !error "PAYLOAD must point to the Windows deployment directory"
!endif
!ifndef OUTPUT
  !error "OUTPUT must point to an existing output directory"
!endif

Unicode true
Name "CloudComputer"
Caption "CloudComputer"
OutFile "${OUTPUT}\CloudComputer.exe"
Icon "..\app\moonlight.ico"
RequestExecutionLevel user
SilentInstall silent
AutoCloseWindow true
SetCompressor /SOLID lzma
VIProductVersion "6.2.0.0"
VIAddVersionKey "ProductName" "CloudComputer"
VIAddVersionKey "FileDescription" "CloudComputer single-file launcher (AMD64 application)"
VIAddVersionKey "FileVersion" "6.2.0.0"
VIAddVersionKey "LegalCopyright" "Moonlight Game Streaming Project contributors"

Var Parameters
Var AppExitCode

Function .onInit
  ${IfNot} ${RunningX64}
    MessageBox MB_OK|MB_ICONSTOP "CloudComputer requires 64-bit Windows."
    SetErrorLevel 193
    Quit
  ${EndIf}
  ${GetParameters} $Parameters
  InitPluginsDir
FunctionEnd

Section
  ClearErrors
  SetOutPath "$PLUGINSDIR\runtime"
  ; Settings must not be written into the temporary runtime directory.
  File /r /x portable.dat "${PAYLOAD}\*"
  IfErrors launchFailed

  ; An existing portable.dat beside the launcher continues to enable portable mode.
  SetOutPath "$EXEDIR"
  ClearErrors
  ExecWait '"$PLUGINSDIR\runtime\CloudComputer.exe" $Parameters' $AppExitCode
  IfErrors launchFailed
  SetErrorLevel $AppExitCode
  ; NSIS removes its unique $PLUGINSDIR after the child application exits.
  Goto done

launchFailed:
  MessageBox MB_OK|MB_ICONSTOP "Unable to start CloudComputer. Check temporary disk space and permissions."
  SetErrorLevel 1
done:
SectionEnd
