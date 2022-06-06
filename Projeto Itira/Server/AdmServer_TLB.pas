unit AdmServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 10/12/2006 18:32:10 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Documents and Settings\Jorge Luis\Meus documentos\Projeto Itira\Server\AdmServer.tlb (1)
// LIBID: {CA16CC88-8797-49D0-81C3-E8A33FB1B7A3}
// LCID: 0
// Helpfile: 
// HelpString: AdmServer Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\system32\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  AdmServerMajorVersion = 1;
  AdmServerMinorVersion = 0;

  LIBID_AdmServer: TGUID = '{CA16CC88-8797-49D0-81C3-E8A33FB1B7A3}';

  IID_IDM: TGUID = '{20BCA1E4-A5BF-43AA-9BAA-1AFCA6D86AE3}';
  CLASS_DM: TGUID = '{2D412DD6-3DEE-45E6-8E8B-99DD5AAE6C57}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDM = interface;
  IDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DM = IDM;


// *********************************************************************//
// Interface: IDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {20BCA1E4-A5BF-43AA-9BAA-1AFCA6D86AE3}
// *********************************************************************//
  IDM = interface(IAppServer)
    ['{20BCA1E4-A5BF-43AA-9BAA-1AFCA6D86AE3}']
  end;

// *********************************************************************//
// DispIntf:  IDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {20BCA1E4-A5BF-43AA-9BAA-1AFCA6D86AE3}
// *********************************************************************//
  IDMDisp = dispinterface
    ['{20BCA1E4-A5BF-43AA-9BAA-1AFCA6D86AE3}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoDM provides a Create and CreateRemote method to          
// create instances of the default interface IDM exposed by              
// the CoClass DM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDM = class
    class function Create: IDM;
    class function CreateRemote(const MachineName: string): IDM;
  end;

implementation

uses ComObj;

class function CoDM.Create: IDM;
begin
  Result := CreateComObject(CLASS_DM) as IDM;
end;

class function CoDM.CreateRemote(const MachineName: string): IDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DM) as IDM;
end;

end.
