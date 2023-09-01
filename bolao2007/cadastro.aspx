<%@ Page Language="c#" Debug="true" Codebehind="cadastro.pas" AutoEventWireup="false" Inherits="cadastro.TWebForm2"%>

<%@ Register TagPrefix="ajax" Namespace="MagicAjax.UI.Controls" Assembly="MagicAjax" %><html>
  <head>
<title>Bolão 2007</title><!-- #BeginTemplate "/Templates/Bolao2007.dwt" --><!-- DW6 -->
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
    <td width="170" height="119" align="left" valign="middle" bgcolor="#ffffff" class="title">  <img src="images/ene5.logo-copam_170x110.gif" alt="LogoCopaAmerica2007" width="170" height="110" align="middle" class="title"></td>
    <td width="617" align="left" valign="top" bgcolor="#ffffff" class="title">
        <img src="images/topo.jpg" width="617" height="114">
    </td>
    <td align="right" width="115"><div align="left"><img src="images/cooper.JPG" width="97" height="95"></div></td>
  </tr>
  <tr> 
    <td height="35" colspan="3" valign="middle" bgcolor="#495e83">&nbsp; &nbsp; <a href="index.aspx" class="links">Página Inicial</a>
                  &nbsp; &nbsp; <a href="resultados.aspx" class="links">Resultados</a>
                  &nbsp; &nbsp; <a href="cadastro.aspx" class="links">Cadastrar</a>
                  &nbsp; &nbsp; <a href="#" class="links">Ranking Atual</a>
                  &nbsp; &nbsp; <a href="curiosidades.aspx" class="links">Curiosidades</a>
                  &nbsp; &nbsp; <a href="regulamento.aspx" class="links">Regulamento</a>
                  &nbsp; &nbsp; <a href="#" class="links">Contato</a>
    </td>
  </tr>
  <tr>
    <td height="1" colspan="2"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
    <td height="1"><img alt="" src="images/spacer.gif" width="1" height="1"></td>
  </tr>
  <tr background="images/links_bot_fill.gif">
    <td height="30" colspan="3"></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="5" bgcolor="#ffffff">
  <tr> 
    <td bgcolor="#ffffff" width="20"><img alt="" src="images/spacer.gif" width="20" height="10"></td>
        
    <td height="309" align="left" valign="top" bgcolor="#ffffff" class="text"> 
	  <!-- #BeginEditable "content" -->
	<form runat="server">
	  <p title=":: Cadastro ::">
		<ajax:AjaxPanel id="AjaxPanel1" style="POSITION: relative" runat="server" width="100%" height="20px">
		<table cellspacing="2" cellpadding="2"
		  width="780" border="0" bgcolor="#495e83">
		  <tbody>
			<tr>
			  <td style="WIDTH: 89px" colspan="3">
				<p align="center"><font face="Verdana" color="#ffffff"><strong>Cadastro</strong>
				  </font>
				</p></td>
			</tr>
			<tr>
			  <td colspan="3">
				<p align="center"><font face="Verdana" size="2" color="#ffffff">Digite os caracteres da imagem ao lado:</font>
				  <ASP:TextBox id="txtCodigo" runat="server" columns="3" maxlength="3"></ASP:TextBox>&nbsp; 
						  <ASP:Image id="Image1" runat="server" imageurl="gerasenha.aspx" width="65px" height="44px"></ASP:Image><br>
                    <asp:Label id="labErroCodigo" runat="server" font-size="X-Small" font-names="Verdana" visible="False" forecolor="Yellow" font-bold="True">Erro na entrada do código!!    </asp:Label>
				</p>                  <font color="#ffffff"></font>
                          <p align="center"></font>
				<a href="javascript:location.reload()" class="links"><font face="Verdana" size="1" color="#ffffff">Clique aqui se você não conseguir visualizar a imagem</font></a><font face="Times New Roman" color="#ffffff"></font></p>
			  </td>
			</tr>
			<tr>
			  <td style="WIDTH: 89px" valign="top">
				<p align="right"><font size="2"><font color="#ffffff"><font face="Verdana"><strong>*
									 </strong>Nome</font>&nbsp;
				  </font></font>
				</p></td>
			  <td style="WIDTH: 376px" valign="top">
				<p align="left">
				  <asp:TextBox id="txtNome" runat="server" columns="50" maxlength="50"></asp:TextBox>
					<font color="#ffffff"></font>
				</p></td>
			  <td valign="top">
				<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
				  font-names="Verdana" font-size="X-Small"
				  controltovalidate="txtNome"
				  errormessage="O Nome é obrigatório!" forecolor="Yellow"></asp:RequiredFieldValidator><font
				  face="Verdana" size="2" color="#ffffff">&nbsp;</font></td>
			</tr>
			<tr>
			  <td style="WIDTH: 89px" valign="top">
				<p align="right"><font size="2"><font face="Verdana" color="#ffffff">Apelido</font>
				  </font>
				</p></td>
			  <td style="WIDTH: 376px" valign="top">
				<p align="left">
				  <asp:TextBox id="txtApelido" runat="server" columns="25"></asp:TextBox><font
					face="Verdana" size="2" color="#ffffff"></font>
				</p></td>
			  <td><font face="Verdana" size="2" color="#ffffff">&nbsp;</font></td>
			</tr>
			<tr>
			  <td style="WIDTH: 89px" valign="top">
				<p align="right"><font size="2"><font face="Verdana"><font color="#ffffff"><strong>*
									 </strong>E-mail</font></font>
				  </font>
                </p></td>
              <td style="WIDTH: 376px" valign="top">
                <p align="left">
                  <asp:TextBox id="txtEmail" runat="server" columns="50"></asp:TextBox><br>
                  <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server"
                    font-names="Verdana" font-size="X-Small"
                    controltovalidate="txtEmail"
                    errormessage="E-mail Inválido!!"
                    validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" forecolor="Yellow"></asp:RegularExpressionValidator><font size="2" color="#ffffff">&nbsp;</font><asp:Label
                    id="labErro" runat="server"
					font-names="Verdana" font-size="X-Small"
                    font-bold="True" forecolor="Yellow"
                    visible="False">E-mail já cadastrado!!</asp:Label><font face="Verdana"></font>
                </p></td>
              <td valign="top">
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                  font-names="Verdana" font-size="X-Small"
                  controltovalidate="txtEmail"
                  errormessage="O E-mail é obrigatório!" forecolor="Yellow"></asp:RequiredFieldValidator><font
                  face="Verdana" size="2" color="#ffffff">&nbsp;</font></td>
            </tr>
            <tr>
              <td style="WIDTH: 89px" valign="top">
                <p align="right"><font size="2"><font face="Verdana" color="#ffffff">CPF</font>
                  </font>
                </p></td>
              <td style="WIDTH: 376px" valign="top">
                <p align="left"><font
                    face="Verdana" size="2">
                  <asp:TextBox id="txtCPF" runat="server" columns="11" width="118px"></asp:TextBox>
                      <font color="#ffffff"></font></font>
                </p></td>
              <td><font face="Verdana" size="2" color="#ffffff">&nbsp;</font></td>
            </tr>
            <tr>
              <td style="WIDTH: 89px">
                <p align="right"><font face="Verdana"
                  size="2"><font color="#ffffff">&nbsp;
                      <strong>*</strong></font></font></p></td>
              <td style="WIDTH: 376px">
                <asp:CheckBox id="chkOk" runat="server" font-names="Verdana"
                  text="Concordo com os Termos do Regulamento" font-size="X-Small" font-bold="True" forecolor="White"></asp:CheckBox><font
                  face="Verdana" size="2" color="#ffffff">&nbsp;</font></td>
              <td>
                <p align="left"><font face="Verdana" size="2" color="#ffffff"><a href="regulamento.aspx" class="links">Leia aqui o Regulamento</a></font></p></td>
            </tr>
				</tbody></table>
				  <P align="center">
				  <asp:Button id="btnGravar" runat="server" text="Gravar" width="100px" borderwidth="1px"></asp:Button>&nbsp;
				  <asp:Button id="btnCancelar" runat="server" text="Cancelar" width="100px"
					causesvalidation="False" borderwidth="1px"></asp:Button></P></ajax:AjaxPanel></p>
              <p></p>
              <p></p>
              <p></p>
			  </td>
			  <td valign="top">
                  <p align="left">&nbsp;
                  </p><font color="#ffffff"></font></td>
  </tr><tr>
			  <td><font face="Verdana" size="1" color="#ffffff"><strong>*
                                                 Obrigatórios</strong></font></td>
              <td>
                <p align="center">
                </p></td>
              <td></td>
            </tr>
</table>
    <p></p></form>
  <!-- #EndEditable --></td>
    <td bgcolor="#ffffff" width="20"><img alt="" src="images/spacer.gif" width="20" height="10"></td></tr>
  <tr>
    <td bgcolor="#495e83" width="20">&nbsp;</td>
    <td height="35" align="center" valign="middle" bgcolor="#495e83" class="footer">Copyright 
      © 2007 www.bolao.fot.br - All Rights Reserved. Designed by <a href="http://bublitz.tripod.com/" target="_blank" class="footer">Bublitz.com</a></td>
    <td bgcolor="#495e83" width="20">&nbsp;</td>
  </tr></tbody></table>
<!-- #EndTemplate -->
</body></html>
