unit untCalculo;

interface
  uses
    SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
    Forms, Dialogs, StdCtrls, DB;

procedure MontaCompos( CodServ: string; myLS, myBDI: real; Zera: boolean );
function  CalcServico( CodServ: string; myLS, myBDI: real; Zera: boolean ): real;
function  CalcServDesc( CodServ: string; var valMDO: real; var valMAT: real; Zera: boolean ): real;
function  CalcValor( valMAT, valMDO, myLS, myBDI: real ): real;
function  CalcOrcam: boolean;
function  CalcCrono: boolean;
procedure CalcInsumos;
procedure CalcInsCrono( nPer: integer );

var
   CodigoServicos: string;

implementation

uses Funcoes, untMain, untDatMod, untEditAcomp;
{***********************************************
************************************************
****                                        ****
****  MONTA COMPOSIÇÃO DE SERVIÇOS          ****
****                                        ****
************************************************
************************************************
}
procedure MontaCompos;
var
   myCodServ, desc, unid, tipo: string;
   quant, VlServ: real;
   myCodIns, RecAnt: longint;

begin
   DatMod.TabCompo.Active := False;
   if Zera then
      DatMod.TabCompo.EmptyTable;
   DatMod.TabCompo.Active := True;

   if not DatMod.TabCompo.FindKey([ CodServ ]) then
   begin
      if DatMod.TabCompServ.FindKey([ CodServ ]) then
      begin
         while ( DatMod.TabCompServ.FieldByName('CodigoServico').AsString = CodServ ) and
            ( not DatMod.TabCompServ.Eof ) do
         begin
            RecAnt    := DatMod.TabCompServ.RecNo;
            myCodServ := DatMod.TabCompServ.FieldByName('CodigoServComp').AsString;
            quant     := DatMod.TabCompServ.FieldByName('Quantidade').AsFloat;
            VlServ    := CalcServico( myCodServ, myLS, 0.00, True );

            DatMod.TabServicos.FindKey([ myCodServ ]);
            desc      := DatMod.TabServicosDescricao.Value;
            unid      := DatMod.TabServicosUnidade.Value;

            with DatMod do
            begin
               TabCompo.Append;
               TabCompoCodigo.Value := CodServ;
               TabCompoComponente.Value := myCodServ;
               TabCompoDescricao.Value := desc;
               TabCompoQuantidade.Value := quant;
               TabCompoTipo.Value := '7';
               TabCompoUnidade.Value := unid;
               TabCompoValor.Value := VlServ;
               TabCompoLS.Value := myLS;
               TabCompoBDI.Value := myBDI;
               TabCompo.Post;
            end;

            DatMod.TabCompServ.RecNo := RecAnt;
            DatMod.TabCompServ.Next;
         end;
      end;

      if DatMod.TabCompInsu.FindKey([ CodServ ]) then
      begin
         while ( DatMod.TabCompInsu.FieldByName('CodigoServico').AsString = CodServ ) and
               ( not DatMod.TabCompInsu.Eof ) do
         begin
            RecAnt   := DatMod.TabCompInsu.RecNo;
            myCodIns := DatMod.TabCompInsu.FieldByName('CodigoInsumoComp').AsInteger;
            quant    := DatMod.TabCompInsu.FieldByName('Quantidade').AsFloat;

            if frmMain.TemInsu then
            begin
               DatMod.TabInsu.FindKey([ myCodIns ]);
               desc   := DatMod.TabInsuDescricao.Value;
               unid   := DatMod.TabInsuUnidade.Value;
               tipo   := DatMod.TabInsuTipo.AsString;
               VlServ := DatMod.TabInsuValor.Value;
            end
            else
            begin
               DatMod.TabInsumos.FindKey([ myCodIns ]);
               desc   := DatMod.TabInsumosDescricao.Value;
               unid   := DatMod.TabInsumosUnidade.Value;
               tipo   := DatMod.TabInsumosTipo.AsString;
               VlServ := DatMod.TabInsumosValor.Value;
            end;

            with DatMod do
            begin
               TabCompo.Append;
               TabCompoCodigo.Value     := CodServ;
               TabCompoComponente.Value := IntToStr(myCodIns);
               TabCompoDescricao.Value  := desc;
               TabCompoQuantidade.Value := quant;
               TabCompoTipo.Value       := tipo;
               TabCompoUnidade.Value    := unid;
               TabCompoValor.Value      := VlServ;
               TabCompoLS.Value := myLS;
               TabCompoBDI.Value := myBDI;
               TabCompo.Post;
            end;

            DatMod.TabCompInsu.RecNo := RecAnt;
            DatMod.TabCompInsu.Next;
         end;
      end;
   end;
end;

{***********************************************
************************************************
****                                        ****
****  CALCULA O VALOR DOS SERVIÇOS          ****
****                                        ****
************************************************
************************************************
}
function CalcServico;
var
   VlInsumos, VlServicos, VlIns, VlServ, quant: real;
   myCodInsu, RecAnt: integer;
   myCodServ: string;

begin
   if Zera then CodigoServicos := '';

   if Pos( CodServ, CodigoServicos ) > 0 then
   begin
      CalcServico := -999999999999.99999;
      exit;
   end;

   CodigoServicos := CodigoServicos + CodServ + '@';

   // Calcula Insumos
   VlInsumos := 0;
   if DatMod.TabCompInsu.FindKey([ CodServ ]) then
   begin
      while ( DatMod.TabCompInsu.FieldByName('CodigoServico').AsString = CodServ ) and
            ( not DatMod.TabCompInsu.Eof ) do
      begin
         myCodInsu := DatMod.TabCompInsu.FieldByName('CodigoInsumoComp').AsInteger;
         quant     := DatMod.TabCompInsu.FieldByName('Quantidade').AsFloat;
         if frmMain.TemInsu = False then
         begin
            if DatMod.TabInsumos.FindKey([ myCodInsu ]) then
               VlIns := DatMod.TabInsumos.FieldByName('Valor').AsFloat
            else
               VlIns := 0.00;
            if DatMod.TabInsumos.FieldByName('Tipo').AsInteger = 1 then
               VlIns := VlIns + VlIns * myLS / 100;
         end
         else
         begin
            if DatMod.TabInsu.FindKey([ myCodInsu ]) then
               VlIns := DatMod.TabInsu.FieldByName('Valor').AsFloat
            else
               VlIns := 0.00;
            if DatMod.TabInsu.FieldByName('Tipo').AsInteger = 1 then
               VlIns := VlIns + VlIns * myLS / 100;
         end;

         VlIns := VlIns + VlIns * myBDI / 100;

         VlInsumos := VlInsumos + VlIns * quant;
         DatMod.TabCompInsu.Next;
      end;
   end;

   // Calcula Servicos
   VlServicos := 0;
   if DatMod.TabCompServ.FindKey([ CodServ ]) then
   begin
      while ( DatMod.TabCompServ.FieldByName('CodigoServico').AsString = CodServ ) and
            ( not DatMod.TabCompServ.Eof ) do
      begin
         myCodServ := DatMod.TabCompServ.FieldByName('CodigoServComp').AsString;
         quant     := DatMod.TabCompServ.FieldByName('Quantidade').AsFloat;
         RecAnt    := DatMod.TabCompServ.RecNo;

         VlServ := CalcServico( myCodServ, myLS, 0.00, False );

         VlServ := VlServ + VlServ * myBDI / 100;

         VlServicos := VlServicos + VlServ * quant;

         DatMod.TabCompServ.RecNo := RecAnt;
         DatMod.TabCompServ.Next;
      end;
   end;

   CalcServico := VlInsumos + VlServicos;

end;

{***********************************************
************************************************
****                                        ****
****  CALCULA VALOR DOS SERVIÇOS            ****
****                                        ****
************************************************
************************************************
}
function CalcServDesc;
var
   VlIns, quant: real;
   myCodInsu, RecAnt: integer;
   myCodServ: string;

begin
   if Zera then CodigoServicos := '';

   if Pos( CodServ, CodigoServicos ) > 0 then
   begin
      CalcServDesc := -999999999999.99999;
      exit;
   end;

   CodigoServicos := CodigoServicos + CodServ + '@';

   // Calcula Insumos
   if DatMod.TabCompInsu.FindKey([ CodServ ]) then
   begin
      while ( DatMod.TabCompInsu.FieldByName('CodigoServico').AsString = CodServ ) and
            ( not DatMod.TabCompInsu.Eof ) do
      begin
         myCodInsu := DatMod.TabCompInsu.FieldByName('CodigoInsumoComp').AsInteger;
         quant     := DatMod.TabCompInsu.FieldByName('Quantidade').AsFloat;

         if frmMain.TemInsu = False then
         begin
            if DatMod.TabInsumos.FindKey([ myCodInsu ]) then
               VlIns := DatMod.TabInsumos.FieldByName('Valor').AsFloat
            else
               VlIns := 0.00;
            if DatMod.TabInsumos.FieldByName('Tipo').AsInteger = 1 then
               valMDO := valMDO + VlIns * quant
            else
               valMAT := valMAT + VlIns * quant;
         end
         else
         begin
            if DatMod.TabInsu.FindKey([ myCodInsu ]) then
               VlIns := DatMod.TabInsu.FieldByName('Valor').AsFloat
            else
               VlIns := 0.00;
            if DatMod.TabInsu.FieldByName('Tipo').AsInteger = 1 then
               valMDO := valMDO + VlIns * quant
            else
               valMAT := valMAT + VlIns * quant;
         end;
         DatMod.TabCompInsu.Next;
      end;
   end;

   // Calcula Servicos
   if DatMod.TabCompServ.FindKey([ CodServ ]) then
   begin
      while ( DatMod.TabCompServ.FieldByName('CodigoServico').AsString = CodServ ) and
            ( not DatMod.TabCompServ.Eof ) do
      begin
         myCodServ := DatMod.TabCompServ.FieldByName('CodigoServComp').AsString;
         quant     := DatMod.TabCompServ.FieldByName('Quantidade').AsFloat;
         RecAnt    := DatMod.TabCompServ.RecNo;

         valMAT := valMAT + CalcServico( myCodServ, DatMod.TabDadosGeraisLS.Value,
                                            0.00, False ) * quant;
         DatMod.TabCompServ.RecNo := RecAnt;
         DatMod.TabCompServ.Next;
      end;
   end;

   CalcServDesc := valMat + valMDO;

end;

{***********************************************
************************************************
****                                        ****
****  CALCULA VALOR DO SERVIÇO BASEADO NO   ****
****  VALOR DE MAT, MDO, LS E BDI           ****
****                                        ****
************************************************
************************************************
}
function CalcValor;
var
   myMDO, myMAT: real ;

begin
   myMDO := valMDO + (valMDO * myLS / 100);
   myMDO := myMDO + (myMDO * myBDI / 100);
   myMAT := valMAT + (valMAT * myBDI / 100);
   CalcValor := myMDO + myMAT
end;

{***************************************************
****************************************************
****                                            ****
****  CALCULA TOTAIS E SUB-TOTAIS DO ORÇAMENTO  ****
****                                            ****
****************************************************
****************************************************
}
function CalcOrcam;
var
   n1MDO, n2MDO, n3MDO,
   n1MAT, n2MAT, n3MAT,
   myMDO, myMAT,
   valBDI, valLS, valMDO, valMAT, valQtd: real;
   nivel, registro: integer;

begin
   n1MDO := 0; n2MDO := 0; n3MDO := 0;
   n1MAT := 0; n2MAT := 0; n3MAT := 0;
   with DatMod do
   begin
      registro := TabOrcam.RecNo;
      TabOrcam.Last;
      while not TabOrcam.Bof do
      begin
         nivel := myInt(TabOrcamNivel.AsString);

         valBDI := TabOrcamValBDI.Value;
         valLS  := TabDadosGeraisLS.Value;
         valMDO := TabOrcamMDO.Value;
         valMAT := TabOrcamMAT.Value;
         valQtd := TabOrcamQuantidade.Value;

         myMDO := valMDO + (valMDO * valLS / 100);
         myMDO := myMDO + (myMDO * valBDI / 100);
         myMAT := valMAT + (valMAT * valBDI / 100);

         if nivel = 0 then
         begin
            n1MDO := n1MDO + ( myMDO * valQtd );
            n2MDO := n2MDO + ( myMDO * valQtd );
            n3MDO := n3MDO + ( myMDO * valQtd );
            n1MAT := n1MAT + ( myMAT * valQtd );
            n2MAT := n2MAT + ( myMAT * valQtd );
            n3MAT := n3MAT + ( myMAT * valQtd );
         end else
         if nivel = 1 then
         begin
            TabOrcam.Edit;
            TabOrcamMAT.Value := n1MAT;
            TabOrcamMDO.Value := n1MDO;
            TabOrcamQuantidade.asString := '';
            n1MDO := 0; n1MAT := 0;
         end else
         if nivel = 2 then
         begin
            TabOrcam.Edit;
            TabOrcamMAT.Value := n2MAT;
            TabOrcamMDO.Value := n2MDO;
            TabOrcamQuantidade.asString := '';
            n2MAT := 0; n1MAT := 0;
            n2MDO := 0; n1MDO := 0;
         end else
         if nivel = 3 then
         begin
            TabOrcam.Edit;
            TabOrcamMAT.Value := n3MAT;
            TabOrcamMDO.Value := n3MDO;
            TabOrcamQuantidade.asString := '';
            n3MAT := 0; n2MAT := 0; n1MAT := 0;
            n3MDO := 0; n2MDO := 0; n1MDO := 0;
         end;
         TabOrcam.Prior;
      end;
      if TabOrcam.State in [ dsInsert, dsEdit ] then
         TabOrcam.Post;
      TabDadosGerais.Edit;
      TabDadosGeraisTotal.Value := TabOrcamTotalServ.Value;
      if TabDadosGerais.State in [ dsInsert, dsEdit ] then
         TabDadosGerais.Post;
      TabOrcam.RecNo := registro;
   end;
   CalcOrcam := True;
end;

{***********************************************
************************************************
****                                        ****
****       INSUMOS DO ORÇAMENTO             ****
****                                        ****
************************************************
************************************************
}
procedure CalcInsumos;
   procedure GravaInsumos( CodSer: string; QtdSer: real );
   var
      desc, unid: string;
      valo, quant: real;
      codins, tipo: integer;
   begin
      Application.ProcessMessages;
      if DatMod.TabCompInsu.FindKey([CodSer]) then
         while (DatMod.TabCompInsuCodigoServico.Value=CodSer)
               and (not DatMod.TabCompInsu.Eof) do
         begin
            codins := DatMod.TabCompInsuCodigoInsumoComp.Value;
            if not DatMod.TabInsOrc.FindKey([codins]) then
            begin
               if frmMain.TemInsu = False then
               begin
                  DatMod.TabInsumos.FindKey([codins]);
                  desc := DatMod.TabInsumosDescricao.Value;
                  tipo := DatMod.TabInsumosTipo.Value;
                  unid := DatMod.TabInsumosUnidade.Value;
                  valo := DatMod.TabInsumosValor.Value;
               end
               else
               begin
                  DatMod.TabInsu.FindKey([codins]);
                  desc := DatMod.TabInsuDescricao.Value;
                  tipo := DatMod.TabInsuTipo.Value;
                  unid := DatMod.TabInsuUnidade.Value;
                  valo := DatMod.TabInsuValor.Value;
               end;
               DatMod.TabInsOrc.Append;
               DatMod.TabInsOrc.FieldByName('CodigoInsumo').Value := codins;
               DatMod.TabInsOrc.FieldByName('Descricao').Value := desc;
               DatMod.TabInsOrc.FieldByName('Unidade').Value := unid;
               DatMod.TabInsOrc.FieldByName('Quantidade').Value := 0.00;
               DatMod.TabInsOrc.FieldByName('Valor').Value := valo;
               DatMod.TabInsOrc.FieldByName('Tipo').Value := tipo;
               DatMod.TabInsOrc.Post;
            end;
            quant := DatMod.TabInsOrc.FieldByName('Quantidade').Value;
            quant := quant + (DatMod.TabCompInsuQuantidade.Value*QtdSer);
            DatMod.TabInsOrc.Edit;
            DatMod.TabInsOrc.FieldByName('Quantidade').Value := quant;
            DatMod.TabInsOrc.Post;
            DatMod.TabCompInsu.Next;
         end;

      if DatMod.TabCompServ.FindKey([CodSer]) then
         while (DatMod.TabCompServCodigoServico.Value=CodSer)
               and (not DatMod.TabCompServ.Eof) do
         begin
            GravaInsumos( DatMod.TabCompServCodigoServComp.Value, DatMod.TabCompServQuantidade.Value );
            DatMod.TabCompServ.Next;
         end;
   end;

begin
   if DatMod.TabInsOrc.Active then
      DatMod.TabInsOrc.Close;
   DatMod.TabInsOrc.Exclusive := True;
   DatMod.TabInsOrc.Active := True;
   DatMod.TabInsOrc.EmptyTable;
   DatMod.TabOrcam.First;
   while not DatMod.TabOrcam.Eof do
   begin
       if DatMod.TabServicos.FindKey( [DatMod.TabOrcamCodigoServico.Value] ) then
          GravaInsumos( DatMod.TabOrcamCodigoServico.Value, DatMod.TabOrcamQuantidade.Value );
       DatMod.TabOrcam.Next;
   end;
   DatMod.TabInsOrc.Close;
end;

{***************************************************
****************************************************
****                                            ****
****  CALCULA TOTAIS E SUB-TOTAIS DO CRONOGRAMA ****
****                                            ****
****************************************************
****************************************************
}
function CalcCrono;
var
   n1V, n2V, n3V: variant;
   camv, camp: string;
   valor, perce, vtotal, ptotal: real;
   nivel, niv, registro, per, i: integer;

begin
   per := DatMod.TabDadosGeraisPerodos.AsInteger-1;
   niv := DatMod.TabDadosGeraisNivel.AsInteger;

   n1V := VarArrayCreate([0, per], varDouble);
   n2V := VarArrayCreate([0, per], varDouble);
   n3V := VarArrayCreate([0, per], varDouble);

   for i := 0 to per do
   begin
      n1V[ i ] := 0.00; n2V[ i ] := 0.00; n3V[ i ] := 0.00;
   end;

   with DatMod do
   begin
      registro := TabCrono.RecNo;
      TabCrono.Last;
      while not TabCrono.Bof do
      begin
         nivel := myInt(TabCrono.FieldByName('Nivel').AsString);

         vtotal := 0.00;
         ptotal := 0.00;

         for i := 0 to per do
         begin
            camv := 'PerV'+StrZero(i+1,5,0);
            camp := 'PerP'+StrZero(i+1,5,0);

            valor := TabCrono.FieldByName( camv ).asFloat;
            perce := TabCrono.FieldByName( camp ).asFloat;

            vtotal := vtotal + valor;
            ptotal := ptotal + perce;

            if nivel = niv then
            begin
               n1V[ i ] := n1V[ i ] + valor;
               n2V[ i ] := n2V[ i ] + valor;
               n3V[ i ] := n3V[ i ] + valor;
            end else
            if nivel = niv+1 then
            begin
               TabCrono.Edit;
               TabCrono.FieldByName( camv ).Value := n1V[ i ];
               if TabCrono.FieldByName( 'Valor' ).Value > 0 then
                  TabCrono.FieldByName( camp ).Value := Trunc(n1V[ i ]*100/TabCrono.FieldByName( 'Valor' ).Value*100)/100
               else
                  TabCrono.FieldByName( camp ).Value := 0.00;
               n1V[ i ] := 0.00;
            end else
            if nivel = niv+2 then
            begin
               TabCrono.Edit;
               TabCrono.FieldByName( camv ).Value := n2V[ i ];
               if TabCrono.FieldByName( 'Valor' ).Value > 0 then
                  TabCrono.FieldByName( camp ).Value := Trunc(n2V[ i ]*100/TabCrono.FieldByName( 'Valor' ).Value*100)/100
               else
                  TabCrono.FieldByName( camp ).Value := 0.00;
               n1V[ i ] := 0.00;
               n2V[ i ] := 0.00;
            end else
            if nivel = niv+3 then
            begin
               TabCrono.Edit;
               TabCrono.FieldByName( camv ).Value := n3V[ i ];
               if TabCrono.FieldByName( 'Valor' ).Value > 0 then
                  TabCrono.FieldByName( camp ).Value := Trunc(n3V[ i ]*100/TabCrono.FieldByName( 'Valor' ).Value*100)/100
               else
                  TabCrono.FieldByName( camp ).Value := 0.00;
               n1V[ i ] := 0.00;
               n2V[ i ] := 0.00;
               n3V[ i ] := 0.00;
            end;
         end; // for i := 0 to per do

         TabCrono.Edit;
         TabCrono.FieldByName('TotalV').Value := vtotal;
         if nivel = niv then
            TabCrono.FieldByName('TotalP').Value := Trunc(ptotal*100)/100
         else
            if TabCrono.FieldByName( 'Valor' ).Value > 0 then
               TabCrono.FieldByName( 'TotalP' ).Value := Trunc(vtotal*100/TabCrono.FieldByName( 'Valor' ).Value*100)/100
            else
               TabCrono.FieldByName( 'TotalP' ).Value := 0.00;


         TabCrono.Prior;
      end;
      if TabCrono.State in [ dsInsert, dsEdit ] then
         TabCrono.Post;

      TabCrono.RecNo := registro;
   end;
   CalcCrono := True;
end;


{***************************************************
****************************************************
****                                            ****
****  CALCULA INSUMOS DO CRONOGRAMA (1 PERÍODO) ****
****                                            ****
****************************************************
****************************************************
}
procedure CalcInsCrono;
var nivel: integer;
    p: real;

   procedure GravaInsumos( CodSer: string; QtdSer, Perc: real );
   var
      desc, unid: string;
      valo, quant: real;
      codins, tipo: integer;
   begin
      Application.ProcessMessages;
      if DatMod.TabCompInsu.FindKey([CodSer]) then
         while (DatMod.TabCompInsuCodigoServico.Value=CodSer)
               and (not DatMod.TabCompInsu.Eof) do
         begin
            codins := DatMod.TabCompInsuCodigoInsumoComp.Value;
            if not DatMod.TabInsOrc.FindKey([codins]) then
            begin
               if frmMain.TemInsu = False then
               begin
                  DatMod.TabInsumos.FindKey([codins]);
                  desc := DatMod.TabInsumosDescricao.Value;
                  tipo := DatMod.TabInsumosTipo.Value;
                  unid := DatMod.TabInsumosUnidade.Value;
                  valo := DatMod.TabInsumosValor.Value;
               end
               else
               begin
                  DatMod.TabInsu.FindKey([codins]);
                  desc := DatMod.TabInsuDescricao.Value;
                  tipo := DatMod.TabInsuTipo.Value;
                  unid := DatMod.TabInsuUnidade.Value;
                  valo := DatMod.TabInsuValor.Value;
               end;
               DatMod.TabInsOrc.Append;
               DatMod.TabInsOrc.FieldByName('CodigoInsumo').Value := codins;
               DatMod.TabInsOrc.FieldByName('Descricao').Value := desc;
               DatMod.TabInsOrc.FieldByName('Unidade').Value := unid;
               DatMod.TabInsOrc.FieldByName('Quantidade').Value := 0.00;
               DatMod.TabInsOrc.FieldByName('Valor').Value := valo;
               DatMod.TabInsOrc.FieldByName('Tipo').Value := tipo;
               DatMod.TabInsOrc.Post;
            end;
            quant := DatMod.TabInsOrc.FieldByName('Quantidade').Value;
            quant := quant + (DatMod.TabCompInsuQuantidade.Value*QtdSer)*Perc/100;
            DatMod.TabInsOrc.Edit;
            DatMod.TabInsOrc.FieldByName('Quantidade').Value := quant;
            DatMod.TabInsOrc.Post;
            DatMod.TabCompInsu.Next;
         end;

      if DatMod.TabCompServ.FindKey([CodSer]) then
         while (DatMod.TabCompServCodigoServico.Value=CodSer)
               and (not DatMod.TabCompServ.Eof) do
         begin
            GravaInsumos( DatMod.TabCompServCodigoServComp.Value, DatMod.TabCompServQuantidade.Value, 00 );
            DatMod.TabCompServ.Next;
         end;
   end;

begin
   if DatMod.TabInsOrc.Active then
      DatMod.TabInsOrc.Close;
   DatMod.TabInsOrc.Exclusive := True;
   DatMod.TabInsOrc.Active := True;
   DatMod.TabInsOrc.EmptyTable;

   nivel := DatMod.TabDadosGeraisNivel.AsInteger;

   DatMod.TabCrono.First;
   DatMod.TabOrcam.First;
   while not DatMod.TabOrcam.Eof do
   begin
     p := DatMod.TabCrono.FieldByName( 'PerP'+StrZero(nPer,5,0) ).AsFloat;
     if myInt(DatMod.TabCrono.FieldByName('nivel').AsString) = nivel then
     begin
        DatMod.TabOrcam.Next;
        while ( myInt(DatMod.TabOrcamNivel.AsString) < nivel )
              and (DatMod.TabOrcam.Eof = False) do
        begin
           if ( p > 0.00 ) and
              ( DatMod.TabServicos.FindKey( [DatMod.TabOrcamCodigoServico.Value] ) ) then
              GravaInsumos( DatMod.TabOrcamCodigoServico.Value, DatMod.TabOrcamQuantidade.Value, p );
           DatMod.TabOrcam.Next;
        end;
        if DatMod.TabOrcam.Eof = False then
           DatMod.TabOrcam.Prior;
     end;
     DatMod.TabCrono.Next;
     DatMod.TabOrcam.Next;
   end;
   DatMod.TabInsOrc.Close;
end;

end.

