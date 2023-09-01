<%@ Page language="c#" Debug="true" Codebehind="contato.pas" AutoEventWireup="false" Inherits="contato.TWebForm2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title></title>
  </head>

  <body> <!-- #include file = "topo.html" -->
     <form runat="server"><font face="Verdana"><font size="2">
          <table cellspacing="0" cellpadding="0" width="100%" border="1" bordercolor="#006600" bgcolor="#8fbc8f">
              <tr>
                <td>
                  <p align="right"><font size="2">Nome:</font></p></td>
                <td>
                  <ASP:TextBox id="TextBox1" runat="server" width="396px"></ASP:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                  font-names="Verdana" font-size="X-Small"
                  controltovalidate="TextBox1"
                  errormessage="O Nome é obrigatório!"></asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td>
                  <p align="right"><font size="2">Email:</font></p></td>
                <td>
                  <ASP:TextBox id="TextBox2" runat="server" width="396px"></ASP:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                  font-names="Verdana" font-size="X-Small"
                  controltovalidate="TextBox2"
                  errormessage="O Email é obrigatório!"></asp:RequiredFieldValidator><br>
                  <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" validationexpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" font-names="Verdana" font-size="X-Small" controltovalidate="TextBox2" errormessage="Email Inválido!!"></asp:RegularExpressionValidator></td>
              </tr>
              <tr>
                <td valign="top">
                  <p align="right"><font size="2">Mensagem:</font></p></td>
                <td valign="top">
                  <ASP:TextBox id="TextBox3" runat="server" textmode="MultiLine" width="397px" height="175px"></ASP:TextBox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                  font-names="Verdana" font-size="X-Small"
                  controltovalidate="TextBox3"
				  errormessage="A mensagem é obrigatória!"></asp:RequiredFieldValidator></td>
              </tr><tr>
                <td></td>
                <td>
                  <ASP:Button id="btnEnviar" runat="server" width="87px" text="Enviar"></ASP:Button>&nbsp;
                  <ASP:Button id="btnVoltar" runat="server" width="83px" text="Voltar"></ASP:Button></td>
              </tr>
          </table>
     </form></font></font>
  </body>
</html>
