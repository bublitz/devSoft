<%@ Page language="c#" Debug="true" Codebehind="admin.pas" AutoEventWireup="false" Inherits="admin.TWebForm2" ValidateRequest="false" %>
<%@ Register TagPrefix="ajax" Namespace="MagicAjax.UI.Controls" Assembly="MagicAjax" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title></title>
  </head>

  <body>
	 <form runat="server">
      <p>&nbsp;</p>
      <p>
        <table cellspacing="1" cellpadding="1" width="100%" border="1"><tr>
  <td colspan="2">
                <ajax:AjaxPanel id="AjaxPanel1" style="POSITION: relative" runat="server" height="68px" width="100%">
      <P></P>
                  <P align="center"><strong><font face="Verdana">Jogos</font> 
          </strong>
                  </P>
      <P>
                    <ASP:Panel id="Panel1" style="POSITION: relative" runat="server" horizontalalign="Center" font-size="XX-Small" enabled="False" height="46px" width="95%">
                      <TABLE cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
					  <td>
                              <p align="center">J:
                                <ASP:Label id="labNum" runat="server" font-size="X-Small"></ASP:Label>
                                &nbsp;&nbsp;F:
                                <ASP:Label id="labF" runat="server" font-size="X-Small"></ASP:Label>
                                &nbsp;&nbsp;R:
                                <ASP:Label id="labR" runat="server" font-size="X-Small"></ASP:Label>
						  
						  <br>
                                <ASP:Label id="labS1" runat="server" font-size="X-Small"></ASP:Label>&nbsp;
				  
                                <ASP:DropDownList id="txtG1" runat="server" enabled="False" autopostback="True">
                                  <ASP:ListItem value="0">0</ASP:ListItem>
                                  <ASP:ListItem value="1">1</ASP:ListItem>
                                  <ASP:ListItem value="2">2</ASP:ListItem>
                                  <ASP:ListItem value="3">3</ASP:ListItem>
                                  <ASP:ListItem value="4">4</ASP:ListItem>
                                  <ASP:ListItem value="5">5</ASP:ListItem>
                                  <ASP:ListItem value="6">6</ASP:ListItem>
                                  <ASP:ListItem value="7">7</ASP:ListItem>
                                  <ASP:ListItem value="8">8</ASP:ListItem>
                                  <ASP:ListItem value="9">9</ASP:ListItem>
                                  <ASP:ListItem value="10">10</ASP:ListItem>
                                </ASP:DropDownList>&nbsp;x&nbsp;
				  
                                <ASP:DropDownList id="txtG2" runat="server" enabled="False" autopostback="True">
                                  <ASP:ListItem value="0">0</ASP:ListItem>
                                  <ASP:ListItem value="1">1</ASP:ListItem>
                                  <ASP:ListItem value="2">2</ASP:ListItem>
                                  <ASP:ListItem value="3">3</ASP:ListItem>
                                  <ASP:ListItem value="4">4</ASP:ListItem>
                                  <ASP:ListItem value="5">5</ASP:ListItem>
                                  <ASP:ListItem value="6">6</ASP:ListItem>
                                  <ASP:ListItem value="7">7</ASP:ListItem>
                                  <ASP:ListItem value="8">8</ASP:ListItem>
                                  <ASP:ListItem value="9">9</ASP:ListItem>
                                  <ASP:ListItem value="10">10</ASP:ListItem>
                                </ASP:DropDownList>&nbsp;
						  
                                <ASP:Label id="labS2" runat="server" font-size="X-Small"></ASP:Label>
                              </p></td>
					  <td>
                              <ASP:RadioButtonList id="rbResul" runat="server" font-size="XX-Small" width="100%" enableviewstate="False" visible="False" cellspacing="0" cellpadding="0">
                                <ASP:ListItem value="Sele&#231;&#227;o 1">Sele&#231;&#227;o 1</ASP:ListItem>
                                <ASP:ListItem value="Sele&#231;&#227;o 2" selected="True">Sele&#231;&#227;o 2</ASP:ListItem>
                              </ASP:RadioButtonList></td>
					</tr>
                      </TABLE>
                      <ASP:Button id="btnGravar" runat="server" text="Gravar"></ASP:Button>&nbsp;
				
                      <ASP:Button id="btnCancelar" runat="server" text="Cancelar"></ASP:Button>
                    </ASP:Panel></P>
                  <P align="center">
                    <ASP:DataGrid id="DGJogos" runat="server" font-size="XX-Small" width="346px" cellpadding="3" datamember="Table" pagesize="20" allowpaging="True" datasource="<%# dsJogos %>" autogeneratecolumns="False" gridlines="Vertical" backcolor="White"
                                  borderwidth="1px" borderstyle="None" bordercolor="#999999" datakeyfield="NUM_JOGO">
                      <FooterStyle forecolor="Black" backcolor="#CCCCCC"></FooterStyle>
                      <SelectedItemStyle font-bold="True" forecolor="White" backcolor="#008A8C"></SelectedItemStyle>
                      <AlternatingItemStyle backcolor="Gainsboro"></AlternatingItemStyle>
                      <ItemStyle forecolor="Black" backcolor="#EEEEEE"></ItemStyle>
                      <HeaderStyle font-bold="True" forecolor="White" backcolor="#000084"></HeaderStyle>
                  <Columns>
                        <ASP:BoundColumn datafield="NUM_JOGO" headertext="#"></ASP:BoundColumn>
                        <ASP:BoundColumn datafield="DATA_HORA" headertext="Data" dataformatstring="{0:dd/MM HH:mm}"></ASP:BoundColumn>
                        <ASP:BoundColumn datafield="DESC_TIME1" headertext="Sel 1">
                          <HeaderStyle horizontalalign="Right"></HeaderStyle>
                          <ItemStyle horizontalalign="Right"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="GOL_T1" headertext="G1">
                          <HeaderStyle horizontalalign="Center"></HeaderStyle>
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="GOL_T2" headertext="G2">
                          <HeaderStyle horizontalalign="Center"></HeaderStyle>
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="DESC_TIME2" headertext="Sel 2"></ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="RESULTADO" headertext="R">
                          <HeaderStyle horizontalalign="Center"></HeaderStyle>
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn datafield="FASE" headertext="F">
                          <HeaderStyle horizontalalign="Center"></HeaderStyle>
                          <ItemStyle horizontalalign="Center"></ItemStyle>
                        </ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="COD_TIME1"></ASP:BoundColumn>
                        <ASP:BoundColumn visible="False" datafield="COD_TIME2"></ASP:BoundColumn>
                        <ASP:ButtonColumn text="Altera" commandname="Select"></ASP:ButtonColumn>
                  </Columns>
                      <PagerStyle horizontalalign="Center" forecolor="Black" backcolor="#999999" mode="NumericPages"></PagerStyle>
                    </ASP:DataGrid>
                  </P>
                </ajax:AjaxPanel></td>

</tr><tr>
              <td>
                <ajax:AjaxPanel id="AjaxPanel3" style="POSITION: relative" runat="server" width="100%" height="250px">
                  <P><strong><font face="Verdana">Tabelas</font>
                    </strong>
                  </P>
                  <P><font face="Verdana"><font size="2">Quantidade:</font>
                    </font><font face="Times New Roman">&nbsp;<ASP:TextBox id="txtQtd" runat="server" width="37px" columns="2" borderwidth="1px" maxlength="2"></ASP:TextBox><ASP:Button id="btnGeraTab" runat="server" text="Gerar"></ASP:Button></font>
                  </P>
                  <P><font face="Times New Roman"><ASP:DataGrid id="DGTabelas" runat="server" width="95%" autogeneratecolumns="False" bordercolor="#999999" borderstyle="None" borderwidth="0px" backcolor="White" cellpadding="0" gridlines="Vertical" cellspacing="1" allowpaging="True" datamember="Table" datakeyfield="COD_TABELA" font-size="XX-Small" datasource="<%# dsTabelas %>" pagesize="20">
                  <FooterStyle forecolor="Black" backcolor="#CCCCCC"></FooterStyle>
                  <SelectedItemStyle font-bold="True" forecolor="White" backcolor="#008A8C"></SelectedItemStyle>
                  <AlternatingItemStyle backcolor="Gainsboro"></AlternatingItemStyle>
                  <ItemStyle forecolor="Black" backcolor="#EEEEEE"></ItemStyle>
                  <HeaderStyle font-bold="True" forecolor="White" backcolor="#000084"></HeaderStyle>
                  <Columns>
                    <ASP:BoundColumn datafield="COD_TABELA" sortexpression="COD_TABELA" readonly="True" headertext="Tabela">
                      <HeaderStyle width="30%"></HeaderStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="PONTOS" sortexpression="PONTOS" headertext="Pontos">
                      <HeaderStyle width="10%"></HeaderStyle>
                    </ASP:BoundColumn>
                    <ASP:BoundColumn datafield="NOME_JOGADOR" sortexpression="NOME_JOGADOR" readonly="True" headertext="Jogador">
                      <HeaderStyle width="60%"></HeaderStyle>
                    </ASP:BoundColumn>
                  </Columns>
                  <PagerStyle horizontalalign="Center" forecolor="Black" backcolor="#999999" mode="NumericPages"></PagerStyle></ASP:DataGrid>
                  </P></FONT>
                </ajax:AjaxPanel></td>
              <td>
                <ajax:AjaxPanel id="AjaxPanel2" style="POSITION: relative" runat="server" width="100%" height="203"><strong><font face="Verdana"> <p align="center"> 
          <ASP:Button id="btnRanking" runat="server" text="Atualiza Ranking"></ASP:Button>
                <ASP:TextBox id="txtSQL" runat="server" height="55px" width="95%" textmode="MultiLine"></ASP:TextBox>
                <ASP:Button id="Button2" runat="server" text="NonQuery"></ASP:Button>
                <ASP:Button id="btnSelect" runat="server" text="Select"></ASP:Button> </p>
              <p align="center">  <ASP:DataGrid id="DataGrid1" runat="server" width="95%" bordercolor="#3366CC" borderstyle="None" borderwidth="1px" backcolor="White" cellpadding="0" font-size="XX-Small">
                  <FooterStyle forecolor="#003399" backcolor="#99CCCC"></FooterStyle>
                  <SelectedItemStyle font-bold="True" forecolor="#CCFF99" backcolor="#009999"></SelectedItemStyle>
                  <ItemStyle forecolor="#003399" backcolor="White"></ItemStyle>
                  <HeaderStyle font-bold="True" forecolor="#CCCCFF" backcolor="#003399"></HeaderStyle>
                  <PagerStyle horizontalalign="Left" forecolor="#003399" backcolor="#99CCCC" mode="NumericPages"></PagerStyle>
                    </ASP:DataGrid></p></font> 
          </strong>
                </ajax:AjaxPanel></td>
            </tr><tr>
  <td colspan="2">
                <p>
  <ASP:TextBox id="txtEmail" runat="server" width="240px">bublitz@tre-mt.gov.br</ASP:TextBox>
  <ASP:Button id="Button1" runat="server" text="Envia teste" width="100px" causesvalidation="False"></ASP:Button></p>
                <p>
  <ASP:TextBox id="txtBody" runat="server" width="700px" height="166px" textmode="MultiLine"></ASP:TextBox></p>
                <p>
  
  <ASP:Button id="Button3" runat="server" text="Todos" width="100px"></ASP:Button>
  <ASP:Button id="Button4" runat="server" text="20 primeiros" width="100px"></ASP:Button>&nbsp;
  <ASP:Label id="Label1" runat="server">Status: </ASP:Label></p></td>
</tr>
        </table>
      </p>
     </form>
  </body>
</html>
