<%@ Page language="c#" Debug="true" Codebehind="recup_senha.pas" AutoEventWireup="false" Inherits="recup_senha.TWebForm2" %><html><head>
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
        <table cellspacing="2" cellpadding="2"
          width="100%" border="0" bgcolor="#ffffff">
          <tbody>
            <tr>
              <td style="WIDTH: 100px" colspan="3">
              <p align="left"><font face="Verdana"><strong>Re-envio de Senha</strong></font> 
                </p></td>
            </tr>
            <tr>
              <td style="WIDTH: 89px" valign="top">
                <p align="right"><font size="2"><font face="Verdana">E-mail</font>&nbsp; 
                  </font>
                </p></td>
              <td style="WIDTH: 372px" valign="top">
                <p align="left">
                  <asp:TextBox id="txtEmail" runat="server" columns="50"></asp:TextBox>
                </p></td>
              <td valign="top"><font
                  face="Verdana" size="2">&nbsp;
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                  font-names="Verdana" font-size="X-Small"
                  controltovalidate="txtEmail"
                  errormessage="O E-mail é obrigatório!"></asp:RequiredFieldValidator></font></td>
            </tr>
            <tr>
              <td style="WIDTH: 89px" valign="top">
                <p align="right"><font size="2"><font face="Verdana"></font>
                  </font>
                </p></td>
              <td style="WIDTH: 372px" valign="top">
                <p align="left"><font
                    face="Verdana" size="2">
                  <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server"
                    font-names="Verdana" font-size="X-Small"
                    controltovalidate="txtEmail"
                    errormessage="Email Inválido!!"
                    validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp; <asp:Label
                    id="labErro" runat="server"
                    font-names="Verdana" font-size="X-Small"
                    font-bold="True" forecolor="Red"
                    visible="False">E-mail não cadastrado!!</asp:Label></font>
                </p></td>
              <td><font face="Verdana" size="2">&nbsp;</font></td>
            </tr>
            <tr>
              <td style="WIDTH: 89px" valign="top">
                <p align="right"><font size="2"><font face="Verdana">
                                   </font>
                  </font>
                </p></td>
              <td style="WIDTH: 372px" valign="top">
                <p align="left"><font face="Verdana" size="2">Digite os caracteres da imagem abaixo:</font>
                  <ASP:TextBox id="txtCodigo" runat="server" columns="3" maxlength="3"></ASP:TextBox>
                </p>
				<p align="center"><img height="44" hspace="0" src="gerasenha.aspx" width="65" border="0"><br>
				<a href="javascript:location.reload()"><font face="Verdana" size="1">Clique aqui se você não conseguir visualizar a imagem</font></a><font face="Times New Roman">&nbsp;</font><font size="2">&nbsp;</font></p></td>
              <td valign="top"><font
                  face="Verdana" size="2">

                <p align="left"><asp:Label
                    id="labErroCodigo" runat="server"
                    font-names="Verdana" font-size="X-Small"
                    font-bold="True" forecolor="Red"
                    visible="False">Erro na entrada do código!!</asp:Label></p></font></td>
            </tr>
            <tr>
              <td style="WIDTH: 89px" valign="top"></td>
              <td style="WIDTH: 372px" valign="top"><font
                    face="Verdana" size="2">
                <p align="center">
                  <asp:Button id="btnGravar" runat="server" text="Enviar" width="100px" borderwidth="1px"></asp:Button><font face="Verdana"></font>
                </p></font></td>
              <td><font face="Verdana" size="2">&nbsp;</font></td>
            </tr>
          </tbody>
        </table>
     </form>
  <!-- #EndEditable --></td>
    <td bgcolor="#ffffff" width="20"><img alt="" src="images/spacer.gif" width="20" height="10"></td>
  </tr>
  <tr>
    <td bgcolor="#495e83" width="20">&nbsp;</td>
    <td height="35" align="center" valign="middle" bgcolor="#495e83" class="footer">Copyright 
      © 2007 www.bolao.fot.br - All Rights Reserved. Designed by <a href="http://bublitz.tripod.com/" target="_blank" class="footer">Bublitz.com</a></td>
    <td bgcolor="#495e83" width="20">&nbsp;</td>
  </tr>
</table>
<!-- #EndTemplate -->
</body></html>
