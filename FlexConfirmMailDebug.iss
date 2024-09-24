[Setup]
AppName=FlexConfirmMail
AppVerName=FlexConfirmMail
VersionInfoVersion=22.1.0.0
AppPublisher=ClearCode Inc.
AppVersion=22.2
UninstallDisplayIcon={app}\fcm.ico
DefaultDirName={commonpf}\FlexConfirmMail
ShowLanguageDialog=no
Compression=lzma2
SolidCompression=yes
OutputDir=dest
OutputBaseFilename=FlexConfirmMailDebugSetup-{#SetupSetting("AppVersion")}
VersionInfoDescription=FlexConfirmMailDebugSetup
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Registry]
Root: HKLM; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: string; ValueName: "Description"; ValueData: "Addon for Checking Recipients and Attachments"
Root: HKLM; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: string; ValueName: "FriendlyName"; ValueData: "FlexConfirmMail"
Root: HKLM; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: string; ValueName: "Manifest"; ValueData: "file:///{app}\FlexConfirmMail.vsto|vstolocal"
Root: HKLM; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: dword; ValueName: "LoadBehavior"; ValueData: 3

; Install for 32bit Office as well
Root: HKLM32; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; Flags: uninsdeletekey
Root: HKLM32; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: string; ValueName: "Description"; ValueData: "Addon for Checking Recipients and Attachments"
Root: HKLM32; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: string; ValueName: "FriendlyName"; ValueData: "FlexConfirmMail"
Root: HKLM32; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: string; ValueName: "Manifest"; ValueData: "file:///{app}\FlexConfirmMail.vsto|vstolocal"
Root: HKLM32; Subkey: "Software\Microsoft\Office\Outlook\Addins\FlexConfirmMail"; ValueType: dword; ValueName: "LoadBehavior"; ValueData: 3

; Prevent Outlook from disabling .NET addon
Root: HKCU; Subkey: "Software\Microsoft\Office\16.0\Outlook\Resiliency\DoNotDisableAddinList"; ValueType: dword; ValueName: "FlexConfirmMail"; ValueData: 1
Root: HKCU; Subkey: "Software\Microsoft\Office\13.0\Outlook\Resiliency\DoNotDisableAddinList"; ValueType: dword; ValueName: "FlexConfirmMail"; ValueData: 1

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: jp; MessagesFile: "compiler:Languages\Japanese.isl"

[Files]
Source: "bin\Debug\FlexConfirmMail.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\FlexConfirmMail.dll.manifest"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\FlexConfirmMail.vsto"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\en\FlexConfirmMail.resources.dll"; DestDir: "{app}\en"; Flags: ignoreversion
Source: "bin\Debug\zh\FlexConfirmMail.resources.dll"; DestDir: "{app}\zh"; Flags: ignoreversion
Source: "bin\Debug\Microsoft.Office.Tools.Common.v4.0.Utilities.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\Microsoft.Office.Tools.Outlook.v4.0.Utilities.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "Resources\fcm.ico"; DestDir: "{app}"; Flags: ignoreversion
