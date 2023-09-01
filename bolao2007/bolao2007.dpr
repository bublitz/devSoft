library bolao2007;

{$R 'untDatMod.TDataModule.resources' 'untDatMod.resx'}
{$R 'admin.TWebForm2.resources' 'admin.resx'}

uses
  System.Reflection,
  System.Runtime.CompilerServices,
  Global in 'Global.pas' {Global.TGlobal: System.Web.HttpApplication},
  index in 'index.pas' {index.TWebForm1: System.Web.UI.Page},
  resultados in 'resultados.pas' {resultados.TWebForm2: System.Web.UI.Page},
  untDatMod in 'untDatMod.pas' {untDatMod.TDataModule: System.ComponentModel.Component},
  regulamento in 'regulamento.pas' {regulamento.TWebForm2: System.Web.UI.Page},
  curiosidades in 'curiosidades.pas' {curiosidades.TWebForm2: System.Web.UI.Page},
  apostas in 'apostas.pas' {apostas.TWebForm2: System.Web.UI.Page},
  admin in 'admin.pas' {admin.TWebForm2: System.Web.UI.Page},
  WebForm2 in 'WebForm2.pas' {WebForm2.TWebForm2: System.Web.UI.Page},
  cadastro in 'cadastro.pas' {cadastro.TWebForm2: System.Web.UI.Page},
  gerasenha in 'gerasenha.pas' {gerasenha.TWebForm1: System.Web.UI.Page},
  nova_tabela in 'nova_tabela.pas' {nova_tabela.TWebForm2: System.Web.UI.Page},
  cadastro_ok in 'cadastro_ok.pas' {cadastro_ok.TWebForm2: System.Web.UI.Page},
  recup_senha in 'recup_senha.pas' {recup_senha.TWebForm2: System.Web.UI.Page};

//
// General Information about an assembly is controlled through the following
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
//
[assembly: AssemblyDescription('')]
[assembly: AssemblyConfiguration('')]
[assembly: AssemblyCompany('')]
[assembly: AssemblyProduct('')]
[assembly: AssemblyCopyright('')]
[assembly: AssemblyTrademark('')]
[assembly: AssemblyCulture('')]

// The Delphi compiler controls the AssemblyTitleAttribute via the ExeDescription.
// You can set this in the IDE via the Project Options.
// Manually setting the AssemblyTitle attribute below will override the IDE
// setting.
// [assembly: AssemblyTitle('')]


//
// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:

[assembly: AssemblyVersion('1.0.*')]

//
// In order to sign your assembly you must specify a key to use. Refer to the 
// Microsoft .NET Framework documentation for more information on assembly signing.
//
// Use the attributes below to control which key is used for signing. 
//
// Notes: 
//   (*) If no key is specified, the assembly is not signed.
//   (*) KeyName refers to a key that has been installed in the Crypto Service
//       Provider (CSP) on your machine. KeyFile refers to a file which contains
//       a key.
//   (*) If the KeyFile and the KeyName values are both specified, the 
//       following processing occurs:
//       (1) If the KeyName can be found in the CSP, that key is used.
//       (2) If the KeyName does not exist and the KeyFile does exist, the key 
//           in the KeyFile is installed into the CSP and used.
//   (*) In order to create a KeyFile, you can use the sn.exe (Strong Name) utility.
//       When specifying the KeyFile, the location of the KeyFile should be
//       relative to the project output directory which is
//       %Project Directory%\bin\<configuration>. For example, if your KeyFile is
//       located in the project directory, you would specify the AssemblyKeyFile 
//       attribute as [assembly: AssemblyKeyFile('..\\..\\mykey.snk')]
//   (*) Delay Signing is an advanced option - see the Microsoft .NET Framework
//       documentation for more information on this.
//
[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile('')]
[assembly: AssemblyKeyName('')]

begin
end.
