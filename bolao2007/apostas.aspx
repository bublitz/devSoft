<%@ Page Language="c#" Debug="true" Codebehind="apostas.pas" AutoEventWireup="false" Inherits="apostas.TWebForm2"%>
<%@ Register TagPrefix="ajax" Namespace="MagicAjax.UI.Controls" Assembly="MagicAjax" %><html>
  <head>
<title>Bolão 2007
</title><!-- #BeginTemplate "/Templates/Bolao2007.dwt" --><!-- DW6 -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- #BeginEditable "doctitle" -->
<!-- #EndEditable -->
<link rel="stylesheet" href="styles.css">
<style type="text/css">.style1 {
	FONT-SIZE: 24px
}
</style>
  </head>
<body>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr> 
    <td height="21" colspan="2" bgcolor="#495e83"></td>
    <td height="21" bgcolor="#495e83"></td>
  </tr>
  <tr> 
    <td width="170" height="119" align="left" valign="middle" bgcolor="#ffffff" class="title">  <img src="images\ene5.logo-copam_170x110.gif" alt="LogoCopaAmerica2007" width="170" height="110" align="middle" class="title"></td>
    <td width="617" align="left" valign="top" bgcolor="#ffffff" class="title">
        <img src="images\topo.jpg" width="617" height="114">
      </td>
    <td align="right" width="115"><div align="left"><img src="images\cooper.JPG" width="97" height="95"></div></td>
  </tr>
  <tr> 
    <td height="35" colspan="3" valign="middle" bgcolor="#495e83">&nbsp; &nbsp; <a href="index.aspx" class="links">Página Inicial
</a> &nbsp; &nbsp; <a href="resultados.aspx" class="links">Resultados
</a> &nbsp; &nbsp; <a href="cadastro.aspx" class="links">Cadastrar
</a> &nbsp; &nbsp; <a href="#" class="links">Ranking Atual
</a> &nbsp; &nbsp; <a href="curiosidades.aspx" class="links">Curiosidades
</a> &nbsp; &nbsp; <a href="regulamento.aspx" class="links">Regulamento
</a> &nbsp; &nbsp; <a href="#" class="links">Contato
</a>
</td>
  </tr>
  <tr>
    <td height="1" colspan="2"><img alt="" src="images\spacer.gif" width="1" height="1"></td>
    <td height="1"><img alt="" src="images\spacer.gif" width="1" height="1"></td>
  </tr>
  <tr background="images/links_bot_fill.gif">
    <td height="30" colspan="3"></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="5" bgcolor="#ffffff">
  <tr> 
    <td bgcolor="#ffffff" width="20"><img alt="" src="images\spacer.gif" width="20" height="10"></td>
        
    <td height="309" align="left" valign="top" bgcolor="#ffffff" class="text"> 
      <!-- #BeginEditable "content" -->
	<form runat="server">
	<ajax:AjaxPanel id="AjaxPanel1" style="POSITION: relative" runat="server" width="100%">
                <P>
                  <ASP:Panel style="POSITION: relative" id="Panel13" runat="server" width="100%" height="152px">
                    <TABLE border="1" cellspacing="0" bordercolor="#ffffff" cellpadding="0" width="780" bgcolor="#495e83">
                        <tr>
                          <td style="WIDTH: 192px" width="150">
                            <p><font size="2" face="Verdana"><a class="links" href="http://localhost/bolao2007/nova_tabela.aspx">Clique aqui para inserir uma&nbsp; Nova Tabela
</a>. 
</font>
                            </p></td>
                          <td><font size="2" face="Verdana"><font color="#ffffff">Número da Tabela:&nbsp;<strong><%=num_tabela%></strong>
                              




</font><br>
                              <div align="center">
                                <ASP:Button id="btnTableFull" runat="server" visible="False" text="Mostra tabela completa"></ASP:Button>
                              </div>
                            </font></td>
                        </tr>
                        <tr>
                          <td style="WIDTH: 192px" valign="top" rowspan="2">
                            <p align="left"><font size="2" face="Verdana"><strong></strong><font color="#ffffff">Ou selecione uma tabela abaixo:
</font>
                                <asp:DataGrid id="DataGrid1" runat="server" width="200px" showheader="False" horizontalalign="Center" autogeneratecolumns="False" borderstyle="None" borderwidth="0px" bordercolor="#CCCCCC" backcolor="White" cellpadding="0">
                                  <FooterStyle forecolor="#000066" backcolor="White"></FooterStyle>
                                  <SelectedItemStyle font-size="X-Small" font-bold="True" forecolor="White" backcolor="LightBlue"></SelectedItemStyle>
                                  <ItemStyle font-size="X-Small" forecolor="#000066"></ItemStyle>
                                  <HeaderStyle font-size="X-Small" font-bold="True" forecolor="White" backcolor="#006699"></HeaderStyle>
                                  <Columns>
                                    <ASP:BoundColumn datafield="COD_TABELA" sortexpression="COD_TABELA" headertext="Tabela"></ASP:BoundColumn>
                                    <ASP:ButtonColumn text="Selecionar" buttontype="PushButton" commandname="Select">
                                      <HeaderStyle width="30px"></HeaderStyle>
                                      <ItemStyle horizontalalign="Center"></ItemStyle>
                                    </ASP:ButtonColumn>
                                  </Columns>
                                  <PagerStyle nextpagetext="Pr&#243;ximo &amp;gt;" prevpagetext="&amp;lt; Anterior" horizontalalign="Left" forecolor="#000066" backcolor="White" mode="NumericPages"></PagerStyle>
                                </asp:DataGrid>
                              </font>
                            </p></font></td>
						  <td><font size="2" face="Verdana"><ASP:Panel style="POSITION: relative" id="panFase1" runat="server" width="100%" height="37px" visible="False" horizontalalign="Center" font-size="XX-Small"><FONT color="#ffffff">Selecione um dos grupos abaixo:
</FONT><BR>
								<ASP:Button id="btnA" runat="server" height="22px" text="Grupo A" borderwidth="1px"></ASP:Button>&nbsp; <ASP:Button id="btnB" runat="server" height="22px" text="Grupo B" borderwidth="1px"></ASP:Button>&nbsp; <ASP:Button id="bttC" runat="server" height="22px" text="Grupo C" borderwidth="1px"></ASP:Button>&nbsp; <ASP:Button id="bttD" runat="server" height="22px" text="Grupo D" borderwidth="1px"></ASP:Button><BR>
                                <ASP:Button id="bttE" runat="server" height="22px" text="Grupo E" borderwidth="1px"></ASP:Button>&nbsp; <ASP:Button id="bttF" runat="server" height="22px" text="Grupo F" borderwidth="1px"></ASP:Button>&nbsp; <ASP:Button id="bttG" runat="server" height="22px" text="Grupo G" borderwidth="1px"></ASP:Button>&nbsp; <ASP:Button id="bttH" runat="server" height="22px" text="Grupo H" borderwidth="1px"></ASP:Button> 
</ASP:Panel>
                              <ASP:Panel style="POSITION: relative" id="panFase2" runat="server" width="100%" height="31px" visible="False" horizontalalign="Center">
                                <ASP:Button id="btnFase2" runat="server" height="22px" text="Oitavas de Final" borderwidth="1px"></ASP:Button>
                                <ASP:Button id="btnFase3" runat="server" height="22px" text="Quartas de Final" borderwidth="1px"></ASP:Button>
                                <ASP:Button id="btnFase4" runat="server" height="22px" text="Semi Final" borderwidth="1px"></ASP:Button>
                                <ASP:Button id="btnFase5" runat="server" height="22px" text="Final" borderwidth="1px"></ASP:Button>
                              </ASP:Panel>
                            </font></td>
                        </tr>
                        <tr>
                          <td>
                            <ASP:Panel style="POSITION: relative" id="panOitavas" runat="server" width="100%" visible="False" backcolor="White" font-size="X-Small" font-names="Verdana">
                              <P align="center"><font face="Verdana"><strong><font size="+0"><font color="#000000" size="3">Oitavas
</font>
                                    </font>
                                  </strong>
                                </font>
                              </P>
                              <DIV align="center">
                                <table border="1" cellspacing="0" bordercolor="darkblue" cellpadding="0" width="100%" bgcolor="snow">
                                    <tr>
                                      <td><font size="2" face="Verdana"><strong>Dia Hr
</strong>
                                        </font></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><strong>Seleção
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>x
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><strong>Seleção
</strong>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana"><strong>Vencedor
</strong>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho1" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o1" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o1" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o1" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o1" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do1" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho2" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o2" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o2" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"></font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o2" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o2" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do2" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho3" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o3" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o3" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o3" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o3" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do3" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td style="HEIGHT: 28px">
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho4" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o4" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o4" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o4" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o4" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do4" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho5" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o5" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o5" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o5" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o5" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do5" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho6" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o6" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o6" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"></font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o6" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o6" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do6" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho7" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o7" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o7" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o7" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o7" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do7" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td style="HEIGHT: 28px">
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="ho8" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1o8" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1o8" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2o8" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2o8" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="do8" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                </table>
                              </DIV>
                              <DIV align="center">
                                <div align="center"></div>
                                <div align="center">
                                  <ASP:Button id="btnAltera8" runat="server" height="22px" text="Gravar" borderwidth="1px"></ASP:Button>
                                </div>
                              </DIV>
                            </ASP:Panel>
                            <ASP:Panel style="POSITION: relative" id="panQuartas" runat="server" width="100%" visible="False" backcolor="White" font-size="X-Small" font-names="Verdana">
                              <P align="center"><font face="Verdana"><strong><font size="+0"><font color="#000000" size="3">Quartas
</font>
                                    </font>
                                  </strong>
                                </font>
                              </P>
                              <DIV align="center">
                                <table border="1" cellspacing="0" bordercolor="darkblue" cellpadding="0" width="100%" bgcolor="snow">
                                    <tr>
                                      <td><font size="2" face="Verdana"><strong>Dia Hr
</strong>
                                        </font></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><strong>Seleção
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>x
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><strong>Seleção
</strong>
                                          </font>
                                        </p></td><td><font size="2" face="Verdana"><strong>Vencedor
</strong>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="hq1" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1q1" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1q1" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2q1" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2q1" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="dq1" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="hq2" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1q2" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1q2" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"></font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2q2" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2q2" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="dq2" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="hq3" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1q3" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1q3" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2q3" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2q3" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="dq3" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td style="HEIGHT: 28px">
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="hq4" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="s1q4" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g1q4" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="g2q4" runat="server" autopostback="True"><ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td style="HEIGHT: 28px">
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="s2q4" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="dq4" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                </table>
                              </DIV>
                              <DIV align="center">
                                <div align="center"></div>
                                <div align="center">
                                  <ASP:Button id="btnAltera4" runat="server" height="22px" text="Gravar" borderwidth="1px"></ASP:Button>
                                </div>
                              </DIV>
                            </ASP:Panel>
                            <ASP:Panel style="POSITION: relative" id="panSemi" runat="server" width="100%" visible="False" backcolor="White" font-size="X-Small" font-names="Verdana">
                              <P align="center"><font size="2" face="Verdana"><strong><font color="#0000ff"><font color="#000000" size="3">Semi Final
</font>
                                    </font>
                                  </strong>
                                </font>
                              </P>
                              <P align="center">
                                <table border="1" cellspacing="0" bordercolor="darkblue" cellpadding="0" width="100%" bgcolor="snow">
                                    <tr>
                                      <td><font size="2" face="Verdana"><strong>Dia Hr
</strong>
                                        </font></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><strong>Seleção
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>x
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><strong>Seleção
</strong>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana"><strong>Vencedor
</strong>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="Label24" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="Label23" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList20" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList19" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="Label22" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="RadioButtonList4" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="Label21" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="Label20" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList18" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList17" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="Label19" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="RadioButtonList3" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                </table>
                                <ASP:Button id="Button12" runat="server" height="22px" text="Gravar" borderwidth="1px"></ASP:Button>
                              </P>
                            </ASP:Panel>
                            <ASP:Panel style="POSITION: relative" id="panFinal" runat="server" width="100%" visible="False" backcolor="White" font-size="X-Small" font-names="Verdana">
                              <P align="center"><font face="Verdana"><strong><font color="#000000" size="3">Final 
</font>
                                  </strong>
                                </font>
                              </P>
                              <P align="center">
                                <table border="1" cellspacing="0" bordercolor="darkblue" cellpadding="0" width="100%" bgcolor="snow">
                                    <tr>
                                      <td><font size="2" face="Verdana"><strong>Dia Hr
</strong>
                                        </font></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><strong>Seleção
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>x
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana"><strong>G
</strong>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><strong>Seleção
</strong></font>
                                        </p></td>
                                      <td><font size="2" face="Verdana"><strong>Vencedor
</strong>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td colspan="7">
                                        <p align="center"><font face="Verdana"><strong>Decisão de 3º Lugar 
</strong>
                                          </font>
                                        </p></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="Label18" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="Label17" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList16" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList15" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7"></ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="Label16" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="RadioButtonList2" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td colspan="7">
                                        <p align="center"><font face="Verdana"><strong>Grande Final
</strong>
                                          </font>
                                        </p></td>
                                    </tr>
                                    <tr>
                                      <td><font size="2" face="Verdana">
                                          <p align="left">
                                            <ASP:Label id="Label15" runat="server">Label
</ASP:Label>
                                          </p>
                                        </font></td>
                                      <td>
                                        <p align="right"><font size="2" face="Verdana"><ASP:Label id="Label14" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList14" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4"></ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">x
</font>
                                        </p></td>
                                      <td>
                                        <p align="center"><font size="2" face="Verdana">
                                            <ASP:DropDownList id="DropDownList13" runat="server" autopostback="True">
                                              <ASP:ListItem value="0">0
</ASP:ListItem>
                                              <ASP:ListItem value="1">1
</ASP:ListItem>
                                              <ASP:ListItem value="2">2
</ASP:ListItem>
                                              <ASP:ListItem value="3">3
</ASP:ListItem>
                                              <ASP:ListItem value="4">4
</ASP:ListItem>
                                              <ASP:ListItem value="5">5
</ASP:ListItem>
                                              <ASP:ListItem value="6">6
</ASP:ListItem>
                                              <ASP:ListItem value="7">7
</ASP:ListItem>
                                              <ASP:ListItem value="8">8
</ASP:ListItem>
                                              <ASP:ListItem value="9">9
</ASP:ListItem>
                                              <ASP:ListItem value="10">10
</ASP:ListItem>
                                            </ASP:DropDownList>
                                          </font>
                                        </p></td>
                                      <td>
                                        <p align="left"><font size="2" face="Verdana"><ASP:Label id="Label13" runat="server">Label
</ASP:Label>
                                          </font>
                                        </p></td>
                                      <td><font size="2" face="Verdana">
                                          <ASP:RadioButtonList id="RadioButtonList1" runat="server" width="100%" height="28px" visible="False" cellpadding="0" font-size="XX-Small" font-names="Verdana" cellspacing="0">
                                            <ASP:ListItem value="1">Time1
</ASP:ListItem>
                                            <ASP:ListItem value="2">Time2
</ASP:ListItem>
                                          </ASP:RadioButtonList>
                                        </font></td>
                                    </tr>
                                </table>
                                <ASP:Button id="Button11" runat="server" height="22px" text="Gravar" borderwidth="1px"></ASP:Button>
                              </P>
                            </ASP:Panel>
                            <ASP:Panel style="POSITION: relative" id="panGrupo" runat="server" width="100%" height="57px" visible="False" backcolor="White">
                              <P align="center"><strong>Grupo <%=grupo%>




</strong><br>
                              </P>
                              <TABLE border="1" cellspacing="0" cellpadding="0" width="100%">
                                  <tr>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><strong>Dia Hr
</strong>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="right"><font size="2"><strong>Seleção
</strong>
                                        </font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2"><strong>G
</strong>
                                        </font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2"><strong>x
</strong>
                                        </font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2"><strong>G
</strong>
                                        </font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><strong>Seleção
</strong>
                                      </font></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><ASP:Label id="Label12" runat="server">Label
</ASP:Label><%=d1%>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="right"><font size="2"><%=t1j1%></font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <div align="center">
                                          <ASP:DropDownList id="DropDownList12" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </div>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2">x
</font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList11" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><%=t2j1%></font></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><ASP:Label id="Label11" runat="server">Label
</ASP:Label><%=d2%>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="right"><font size="2"><%=t1j2%></font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList10" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2">x
</font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList9" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><%=t2j2%></font></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><ASP:Label id="Label10" runat="server">Label
</ASP:Label><%=d3%>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="right"><font size="2"><%=t1j3%></font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList8" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2">x
</font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList7" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><%=t2j3%></font></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><ASP:Label id="Label9" runat="server">Label
</ASP:Label><%=d4%>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="right"><font size="2"><%=t1j4%></font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList6" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2">x
</font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList5" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><%=t2j4%></font></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><ASP:Label id="Label8" runat="server">Label
</ASP:Label><%=d5%>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="right"><font size="2"><%=t1j5%></font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList4" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2">x
</font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList3" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><%=t2j5%></font></td>
                                  </tr>
                                  <tr>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><ASP:Label id="Label7" runat="server" visible="False">Label
</ASP:Label><%=d6%>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="right"><font size="2"><%=t1j6%></font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <p align="center">
                                          <ASP:DropDownList id="DropDownList2" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1">1
</ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </p>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue">
                                      <p align="center"><font size="2">x
</font>
                                      </p></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2">
                                        <div align="center">
                                          <ASP:DropDownList id="DropDownList1" runat="server">
                                            <ASP:ListItem value="0">0
</ASP:ListItem>
                                            <ASP:ListItem value="1"></ASP:ListItem>
                                            <ASP:ListItem value="2">2
</ASP:ListItem>
                                            <ASP:ListItem value="3">3
</ASP:ListItem>
                                            <ASP:ListItem value="4">4
</ASP:ListItem>
                                            <ASP:ListItem value="5">5
</ASP:ListItem>
                                            <ASP:ListItem value="6">6
</ASP:ListItem>
                                            <ASP:ListItem value="7">7
</ASP:ListItem>
                                            <ASP:ListItem value="8">8
</ASP:ListItem>
                                            <ASP:ListItem value="9">9
</ASP:ListItem>
                                            <ASP:ListItem value="10">10
</ASP:ListItem>
                                          </ASP:DropDownList>
                                        </div>
                                      </font></td>
                                    <td bgcolor="snow" bordercolor="darkblue"><font size="2"><%=t2j6%></font></td>
                                  </tr>
                              </TABLE>
                              <DIV align="center">
                                <ASP:Button id="Button10" runat="server" text="Gravar" borderwidth="1px"></ASP:Button>&nbsp; 
</DIV>
                              <DIV align="center"><br>Classificação <br>
                              




</DIV><%=tabela_class%>
                            </ASP:Panel></td>
                        </tr>
                    </TABLE>
                  </ASP:Panel>
                </P></ajax:AjaxPanel>

     </form>
  <!-- #EndEditable --></td>
    <td bgcolor="#ffffff" width="20"><img alt="" src="images\spacer.gif" width="20" height="10"></td>
  </tr>
  <tr>
    <td bgcolor="#495e83" width="20">&nbsp;
</td>
    <td height="35" align="center" valign="middle" bgcolor="#495e83" class="footer">Copyright © 2007 www.bolao.fot.br - All Rights Reserved. Designed by <a href="http://bublitz.tripod.com/" target="_blank" class="footer">Bublitz.com
</a>














</td>
    <td bgcolor="#495e83" width="20">&nbsp;
</td>
  </tr>
</table>
<!-- #EndTemplate -->
</body></html>
