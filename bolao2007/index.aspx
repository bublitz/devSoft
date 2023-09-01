<%@ Page language="c#" Debug="true" Codebehind="index.pas" AutoEventWireup="false" Inherits="index.TWebForm1" %>
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
	   <table width="95%" border="0" align="center">
	   <tr><td width="60%" valign="top">
        <p class="title" align="center">Bolão Copa do Mundo 2010 
</p>
        <p class="text" align="center">Participantes cadastrados: <strong><%=participantes%></strong>&nbsp; &nbsp; &nbsp; Tabelas vendidas: <strong><%=tabelas%></strong>





</p>
		<p class="title" align="center">Prêmio para o 1º colocado:&nbsp; <strong><%=p1%></strong><br>Prêmio para o 2º colocado:&nbsp;<strong><%=p2%></strong>
		  <br>Prêmio para o 3º colocado:&nbsp;<strong><%=p3%></strong>
		  <br>Prêmio para o 4º colocado:&nbsp;<strong><%=p4%>
		  </strong><br>Prêmio para o 5º colocado:&nbsp;<strong><%=p5%></strong>
		<br><br>Prêmio especial para a 1ª Fase:&nbsp;<strong><%=pf1%></strong>





</p>
        <p class="text" align="center">Posição atualizada em <strong><%=data_hora%></strong>&nbsp;(horário de Brasília) <br><br>Já fomos visitados
<script language="JavaScript" src="http://www.itmnetworks.com.br/scripts/counter/counter.asp?pagina=bolao.fot.brindex.aspx&amp;estilo=amini&amp;tamanho=8"></script>
 vezes. 
</p>
        </td>
		 <td width="40%" rowspan="2" valign="top" class="text">
                      <ajax:AjaxPanel id="AjaxPanel1" style="POSITION: relative" runat="server" height="68px" width="100%">
                        <P class="subtitle">
                          <ASP:Panel style="POSITION: relative" id="panLogin" runat="server" width="100%" height="210px" borderstyle="Double" backcolor="#495E83">
                            <P class="subtitle" align="center"><font color="#ffffff">Usuários cadastrados
</font>
                            </P>
                            <P class="text" align="left"><font color="#ffff66">Login (<em>E-mail
</em>): 
</font>
                              <ASP:TextBox id="txtLogin" runat="server" font-size="XX-Small"></ASP:TextBox><br>
                              <ASP:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" forecolor="SkyBlue" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" controltovalidate="txtLogin" errormessage="Email inválido!!"></ASP:RegularExpressionValidator>
                              <ASP:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" forecolor="SkyBlue" controltovalidate="txtLogin" errormessage="Email é obrigatório!!"></ASP:RequiredFieldValidator><br>
                              <font color="#ffff66">Senha:
</font>
                              <ASP:TextBox id="txtSenha" runat="server" font-size="XX-Small" textmode="Password"></ASP:TextBox><br>
                              <ASP:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" forecolor="SkyBlue" controltovalidate="txtSenha" errormessage="Senha é obrigatória!!"></ASP:RequiredFieldValidator><br>
                              <ASP:Button id="btnLogin" runat="server" borderwidth="1px" text="Acessar"></ASP:Button>&nbsp;&nbsp; <br>
                            
</P>
                            <ASP:Label id="labMens" runat="server" forecolor="White"></ASP:Label><BR>
                            <P class="text" align="center"><font color="#000000" size="2"><a href="recup_senha.aspx">Esqueci a senha
</a>
                              </font>
                            </P>
                          </ASP:Panel>
                          <div align="center">
                            <ASP:Panel style="POSITION: relative" id="panAcesso" runat="server" width="100%" height="210px" borderstyle="Double" backcolor="#495E83" forecolor="ActiveBorder" visible="False">
                              <P class="text" align="center"><font color="#ffff66"><strong>Olá, <%=nome_joga%>.
</strong>
                                </font>
                              </P>
                              <P class="text" align="center"><a class="links" href="apostas.aspx"><font color="#000000">Clique aqui para acessar seus Prognósticos
</font>
                                </a>
                              </P>
                              <P class="text" align="center"><a class="links" href="nova_tabela.aspx"><font color="#000000">Clique aqui para adicionar uma Nova Tabela
</font>
                                </a>
                              </P>
                              <P class="text" align="center">
                                <ASP:Button id="btnSair" runat="server" borderwidth="1px" text="Sair"></ASP:Button>
                              </P>
                            </ASP:Panel>
                          </div>
                      </ajax:AjaxPanel>
		   </td>
	   </tr>
	   <tr align="middle" valign="center">
	     <td align="center" valign="top" class="text"><p><img src="images\pbfblogo.jpg" width="102" height="47">&nbsp;&nbsp; <img src="images\borland_delphi_powered.gif" width="106" height="51">





</p></td>
	     </tr>
	   </table>
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
