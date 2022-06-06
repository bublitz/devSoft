// JavaScript Document
if(gE('int_painel')) gE('int_painel').style.display = 'none';
if(gE('barra'))
{
	if(gE('formInteracao').codUsuario.value == 0 || gE('formInteracao').codUsuario.value == "")
	{
		adEvento(gE('barra'),'click', janelaLogin);
		adEvento(gE('fechar'),'click',escondeInteracao);
		iLinks = gE('ilinks');
		arriLinksA = iLinks.getElementsByTagName('a');
		for(i=0; i<arriLinksA.length; i++)
		{
				adEvento(arriLinksA[i],'click', janelaLogin);
		}
	}
	else
	{
		adEvento(gE('barra'),'click',exibirInteracao);
		adEvento(gE('fechar'),'click',escondeInteracao);
		iLinks = gE('ilinks');
		arriLinksA = iLinks.getElementsByTagName('a');
		for(i=0; i<arriLinksA.length; i++)
		{
				adEvento(arriLinksA[i],'click', exibirInteracao);
		}
	}
}

activeLinks();
