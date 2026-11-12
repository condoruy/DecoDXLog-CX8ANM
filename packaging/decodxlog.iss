; DecoDXLog — l'installatore per Windows (Inno Setup 6).
;
; Si installa per l'utente, dentro %LOCALAPPDATA%\Programs\DecoDXLog: niente
; richiesta di amministratore, e l'aggiornamento automatico puo' lanciarlo da
; solo. Il log e le impostazioni stanno altrove (%APPDATA%\Decodium) e non si
; toccano ne' installando ne' disinstallando: un logbook non si butta via con
; il programma.
;
; Si compila cosi' (lo fa scripts/installer.sh):
;   ISCC.exe /DVersion=1.2.0 /DSource=C:\decolog\dist /DOut=C:\decolog packaging\decodxlog.iss

#ifndef Version
  #define Version "0.0.0"
#endif
#ifndef Source
  #define Source "..\dist"
#endif
#ifndef Out
  #define Out ".."
#endif

#define AppName "DecoDXLog"
; Edicion CX8ANM: nombre visible propio, el ejecutable sigue siendo DecoDXLog.exe
#define DisplayName "DecoDXLog CX8ANM"
#define Publisher "CX8ANM - Cóndor Tecnológico (basado en DecoDXLog de IU8LMC)"
#define Home "https://github.com/condoruy/DecoDXLog-CX8ANM"

[Setup]
; L'AppId non cambia mai: e' quello che fa riconoscere una versione gia'
; installata e la aggiorna invece di metterne una seconda accanto.
AppId={{6C1B0E7D-2A3F-4C58-B8D1-C8A5D0CC8A01}
AppName={#DisplayName}
AppVersion={#Version}
AppVerName={#DisplayName} {#Version}
VersionInfoVersion={#Version}
AppPublisher={#Publisher}
AppPublisherURL={#Home}
AppSupportURL={#Home}/issues
AppUpdatesURL={#Home}/releases
DefaultDirName={autopf}\{#DisplayName}
DefaultGroupName={#DisplayName}
DisableProgramGroupPage=yes
; Per l'utente, senza UAC: cosi' «Aggiorna ora» non deve chiedere niente a
; nessuno, e chi non e' amministratore del proprio computer installa lo stesso.
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir={#Out}
OutputBaseFilename={#AppName}-{#Version}-setup
SetupIconFile=..\resources\decodxlog.ico
UninstallDisplayIcon={app}\{#AppName}.exe
UninstallDisplayName={#DisplayName} {#Version}
WizardStyle=modern
Compression=lzma2/max
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
; Se DecoDXLog e' aperto, l'installatore lo dice e si offre di chiuderlo: i
; file di un programma in esecuzione non si sostituiscono.
CloseApplications=yes
CloseApplicationsFilter=*.exe,*.dll
RestartApplications=no
LicenseFile=..\LICENSE

[Languages]
Name: "english";  MessagesFile: "compiler:Default.isl"
Name: "italian";  MessagesFile: "compiler:Languages\Italian.isl"
Name: "german";   MessagesFile: "compiler:Languages\German.isl"
Name: "french";   MessagesFile: "compiler:Languages\French.isl"
Name: "spanish";  MessagesFile: "compiler:Languages\Spanish.isl"
Name: "catalan";  MessagesFile: "compiler:Languages\Catalan.isl"
Name: "dutch";    MessagesFile: "compiler:Languages\Dutch.isl"
Name: "danish";   MessagesFile: "compiler:Languages\Danish.isl"
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "russian";  MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Tutta la cartella preparata da scripts/deploy.sh: l'eseguibile, le librerie
; Qt, i moduli QML, i plugin TLS e SQLite, le mappe del rotore.
Source: "{#Source}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#DisplayName}"; Filename: "{app}\{#AppName}.exe"
Name: "{autodesktop}\{#DisplayName}"; Filename: "{app}\{#AppName}.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppName}.exe"; Description: "{cm:LaunchProgram,{#DisplayName}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; Quello che il programma si crea dentro la sua cartella (cache dei moduli QML):
; il log e le impostazioni stanno in %APPDATA%\Decodium e non si toccano.
Type: filesandordirs; Name: "{app}\qml"
Type: dirifempty; Name: "{app}"
