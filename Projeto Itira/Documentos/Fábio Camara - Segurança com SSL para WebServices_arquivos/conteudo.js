// JavaScript Document
var strAnotacao;
var divLogin;
var divArtigos;
var ulArtigos;
var XHR = XMLHTTPRequest();
var XHR_Login = XMLHTTPRequest();
var XHR_Conteudo = XMLHTTPRequest();
var timerMeuMenu;
var exibirInteracaoConteudo;

function activeLinks()
{
	adEvento(gE('urlTodosArtigos'), 'change', todosArtigosMuda);
	
	if(gE('int_painel'))
	{
		ulLinks = gE('int_painel').getElementsByTagName('ul')[0].childNodes;

		z=0;
		for(i=0; i<ulLinks.length; i++)
		{
			if(ulLinks[i].nodeName == "LI")
			{
				if(ulLinks[i] && z==0) adEvento(ulLinks[i],'click',conteudoAvalie);
				if(ulLinks[1] && z==1) adEvento(ulLinks[i],'click',conteudoIndique);
				if(ulLinks[2] && z==2) adEvento(ulLinks[i],'click',conteudoPoste);
				if(ulLinks[3] && z==3) adEvento(ulLinks[i],'click',conteudoAnote);
				if(ulLinks[4] && z==4) adEvento(ulLinks[i],'click',conteudoFale);
				z++;
			}
		}
	}	
}

function todosArtigosMuda(e)
{
		window.location = gE('urlTodosArtigos').value;	
}


function conteudoFale(e)
{
		cont = gE('int_conteudo');
	if(cont)
	{
		while(cont.childNodes.length>1)
			cont.removeChild(cont.lastChild);
	}
	
	editH4 = gE('int_h4');
	if(editH4)
	{
		while(editH4.hasChildNodes()){ editH4.removeChild(editH4.firstChild); }
		editH4.appendChild(cTN("Fale com o autor do artigo"));
	}
	
	editSpan = cont.getElementsByTagName("span")[0];
	if(editSpan)
	{
		while(editSpan.hasChildNodes()){ editSpan.removeChild(editSpan.firstChild); }
		editSpan.appendChild(cTN("Escolha uma nota e classifique esta matéria"));
	}
	
	
	
	newP = cE("p","Voce pode entrar em contato com o "+gE('autorStrNome').value+" através do e-mail "+gE('autorStrEmail').value+" ou pelo formulário abaixo:");
	newP.appendChild(cE("br"));
	//Input do titulo
	newP.appendChild(cTN("Titulo:"));
	newInput = cE("input", Array("type=text","name=strTituloAutor","className=text_Fale"), "");
	newInput.name = "strTituloAutor";
	newInput.className = "text_Fale";
	newP.appendChild(newInput);
	//Fim do input do titulo
	
	newP.appendChild(cE("br"));
	newP.appendChild(cE("br"));
	
	//Textarea
	newP.appendChild(cTN("Mensagem:"));
	newInput = cE("textarea", Array("name=strMensagemAutor","className=textarea_Fale"), "");
	newInput.name = "strMensagemAutor";
	newInput.className = "textarea_Fale";
	newP.appendChild(newInput);
	//Fim do textarea
	
	cont.appendChild(newP);	
	
	if(gE('int_rodape'))
	{
		while(gE('int_rodape').hasChildNodes()){ gE('int_rodape').removeChild(gE('int_rodape').firstChild); }
		inputSubmit = cE('input', Array("type=submit","name=submitAutor","value=Enviar"), "");
		inputSubmit.name = "submitAutor";
		gE('int_rodape').appendChild(inputSubmit);
		
		clearSubmit = cE('input', Array("type=reset","name=reset","value=Limpar"), "");
		clearSubmit.name = "reset";
		gE('int_rodape').appendChild(clearSubmit);
	}
	
	if(e) return poin(e);
}

function conteudoAnote(e)
{
	cont = gE('int_conteudo');
	if(cont)
	{
		while(cont.childNodes.length>1)
			cont.removeChild(cont.lastChild);
	}
	
	editH4 = gE('int_h4');
	if(editH4)
	{
		while(editH4.hasChildNodes()){ editH4.removeChild(editH4.firstChild); }
		editH4.appendChild(cTN("Suas anotaçoes sobre esta matéria"));
	}
	
	editSpan = cont.getElementsByTagName("span")[0];
	if(editSpan)
	{
		while(editSpan.hasChildNodes()){ editSpan.removeChild(editSpan.firstChild); }
		editSpan.appendChild(cTN("Escolha uma nota e classifique esta matéria"));
	}
	
	
	
	newP = cE("p","Grave suas anotaçoes particulares sobre essa matéria, e acesse sempre que desejar, a partir deste painel:");
	newP.appendChild(cE("br"));
	newP.appendChild(cE("br"));
	//Textarea
	newInput = cE("textarea", Array("name=strAnotacao,className=textarea_Anote"), "");
	newInput.name = "strAnotacao";
	newInput.className = "textarea_Anote";
	newP.appendChild(newInput);
	adEvento(newInput, 'focus', function() { if(newInput.value == "Faça suas anotaçoes e clique em Gravar") newInput.value = ""; } );
	strAnotacao = newInput;
	//Fim do textarea
	
	form = gE('formInteracao');
	if(form)
	{
		postString = "";
		postString = getForm(form);
		XHR.open('post', '/ajax.php?r=7&rand='+Math.floor(Math.random()*100), true);
		XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		XHR.onreadystatechange=responseGetAnotar;
		XHR.send(postString);
	}
	
	cont.appendChild(newP);	
	
	if(gE('int_rodape'))
	{
		while(gE('int_rodape').hasChildNodes()){ gE('int_rodape').removeChild(gE('int_rodape').firstChild); }
		inputSubmit = cE('input', Array("type=submit","name=submit","value=Gravar"), "");
		inputSubmit.name = "submit";
		gE('int_rodape').appendChild(inputSubmit);
		adEvento(inputSubmit, 'click', anotar);
		
		clearSubmit = cE('input', Array("type=reset","name=reset","value=Limpar"), "");
		clearSubmit.name = "reset";
		gE('int_rodape').appendChild(clearSubmit);
	}
	
	if(e) return poin(e);
}

function anotar(e)
{
	form = gE('formInteracao');
	postString = "";
	if(form)
	{
		
		postString = getForm(form, 1);
		XHR.open('post', '/ajax.php?r=6&rand='+Math.floor(Math.random()*100), true);
		XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		XHR.onreadystatechange=responseAnotar;
		XHR.send(postString);
	}
	if(e) return poin(e);	
}

function responseGetAnotar()
{
	if(XHR.readyState == 4)
	{
		if (XHR.status == 200) 
		{
			strResponse = unescape(XHR.responseText.replace(/\+/g," "));
			if(strResponse == "")	strAnotacao.value =	"Faça suas anotaçoes e clique em Gravar";
			else strAnotacao.value = strResponse;
		}
	}		
}

function responseAnotar()
{
	if(XHR.readyState == 4)
	{
		if (XHR.status == 200) 
		{
			
			eval(unescape(XHR.responseText.replace(/\+/g," ")));
		}
	}	
}

function conteudoPoste(e)
{
	cont = gE('int_conteudo');
	if(cont)
	{
		while(cont.childNodes.length>1)
			cont.removeChild(cont.lastChild);
	}
	
	editH4 = gE('int_h4');
	if(editH4)
	{
		while(editH4.hasChildNodes()){ editH4.removeChild(editH4.firstChild); }
		editH4.appendChild(cTN("Escreva um comentário sobre a matéria"));
	}
	
	editSpan = cont.getElementsByTagName("span")[0];
	if(editSpan)
	{
		while(editSpan.hasChildNodes()){ editSpan.removeChild(editSpan.firstChild); }
		editSpan.appendChild(cTN("Escolha uma nota e classifique esta matéria"));
	}
	
	
	
	newP = cE("p","Preencha os campos abaixo para postar seu comentário. Ele ficará visível para todos os leitores que acessarem a matéria:");
	newP.appendChild(cE("br"));
	
	//Input do titulo
	newP.appendChild(cTN("Titulo:"));
	newInput = cE("input", Array("type=text","name=strTitulo","className=text_Poste"), "");
	newInput.name = "strTitulo";
	newInput.className = "text_Poste";
	newP.appendChild(newInput);
	//Fim do input do titulo
	
	newP.appendChild(cE("br"));
	newP.appendChild(cE("br"));
	
	//Textarea
	newP.appendChild(cTN("Comentário: "));
	newInput = cE("textarea", Array("name=strComentario","className=textarea_Poste"), "");
	newInput.name = "strComentario";
	newInput.className = "textarea_Poste";
	newP.appendChild(newInput);
	//Fim do textarea
	
	cont.appendChild(newP);	
	
	if(gE('int_rodape'))
	{
		while(gE('int_rodape').hasChildNodes()){ gE('int_rodape').removeChild(gE('int_rodape').firstChild); }
		inputSubmit = cE('input', Array("type=submit","name=submit","value=Enviar"), "");
		inputSubmit.name = "submit";
		gE('int_rodape').appendChild(inputSubmit);
		adEvento(inputSubmit, 'click', comentar);
	}
	
	if(e) return poin(e);
}

function comentar(e)
{
	form = gE('formInteracao');
	postString = "";
	if(form)
	{
		
		postString = getForm(form,1);
		XHR.open('post', '/ajax.php?r=5&rand='+Math.floor(Math.random()*100), true);
		XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		XHR.onreadystatechange=responseComentar;
		XHR.send(postString);
	}
	return poin(e);	
}

function responseComentar()
{
	if(XHR.readyState == 4)
	{
		if (XHR.status == 200) 
		{
			strResponse = unescape(XHR.responseText.replace(/\+/g," "));
			eval(strResponse);
			
			if(envio)
			{
				gE('formInteracao').reset();
			}

			if(arrComentarios.length >= 1)
			{
				ulComent = gE('comentarios').getElementsByTagName('ul')[1];
				if(!ulComent)
				{
					divMeio = gE('comentarios').getElementsByTagName('div')[0];
					ulComent = cE("ul","className=comentarios","");
					divMeio.appendChild(ulComent);
				}
				
				if(ulComent)
				{
					while(ulComent.hasChildNodes()){ ulComent.removeChild(ulComent.firstChild); }
												
					for(i=0; i<arrComentarios.length; i++)
					{
						newLi = cE("li", "");
						newSpan0 = cE("span", "className=titulo", arrComentarios[i][0]);
						newSpan1 = cE("span", "className=nome", "Publicado por "+arrComentarios[i][1]+", "+arrComentarios[i][3]);
						newSpan2 = cE("span", "className=mensagem", arrComentarios[i][2]);
						newLi.appendChild(newSpan0);
						newLi.appendChild(newSpan1);
						newLi.appendChild(newSpan2);
						ulComent.appendChild(newLi);
					}
				}
			}
		}
	}	
}

function conteudoIndique(e)
{
	cont = gE('int_conteudo');
	if(cont)
	{
		while(cont.childNodes.length>1)
			cont.removeChild(cont.lastChild);
	}
	
	editH4 = gE('int_h4');
	if(editH4)
	{
		while(editH4.hasChildNodes()){ editH4.removeChild(editH4.firstChild); }
		editH4.appendChild(cTN("Indique esta matéria a um amigo"));
	}
	
	editSpan = cont.getElementsByTagName("span")[0];
	if(editSpan)
	{
		while(editSpan.hasChildNodes()){ editSpan.removeChild(editSpan.firstChild); }
		editSpan.appendChild(cTN("Escolha uma nota e classifique esta matéria"));
	}
	
	
	
	newP = cE("p","Preencha os campos abaixo e indique esta matéria a um amigo.");
	newP.appendChild(cE("br"));
	//Input do nome
	newP.appendChild(cTN("Nome do amigo: "));
	newInput = cE("input", Array("type=text","name=strNomeAmigo","className=text_Indique"), "");
	newInput.name = "strNomeAmigo";
	newInput.className = "text_Indique";
	newP.appendChild(newInput);
	//Fim do input do nome
	
	newP.appendChild(cE("br"));
	newP.appendChild(cE("br"));
	
	//Input do email
	newP.appendChild(cTN("E-mail do amigo: "));
	newInput = cE("input", Array("type=text","name=strEmailAmigo","className=text_Indique"), "");
	newInput.name = "strEmailAmigo";
	newInput.className = "text_Indique";
	newP.appendChild(newInput);
	//Fim do input do email
	
	newP.appendChild(cE("br"));
	newP.appendChild(cE("br"));
	
	//Textarea
	newP.appendChild(cTN("Comentário: "));
	//newP.appendChild(cE("br"));
	newInput = cE("textarea", Array("name=strComentarioAmigo","className=textarea_Indique"), "");
	newInput.name = "strComentarioAmigo";
	newInput.className = "textarea_Indique";
	newP.appendChild(newInput);
	//Fim do textarea
	
	cont.appendChild(newP);	
	
	if(gE('int_rodape'))
	{
		while(gE('int_rodape').hasChildNodes()){ gE('int_rodape').removeChild(gE('int_rodape').firstChild); }
		inputSubmit = cE('input', Array("type=submit","name=submitAmigo","value=Enviar"), "");
		inputSubmit.name = "submitAmigo";
		gE('int_rodape').appendChild(inputSubmit);
	}
	
	if(e) return poin(e);
}

function conteudoAvalie(e)
{
	cont = gE('int_conteudo');
	if(cont)
	{
		while(cont.childNodes.length>1){ cont.removeChild(cont.lastChild); }
	}
	
	editH4 = gE('int_h4');
	if(editH4)
	{
		while(editH4.hasChildNodes()){ editH4.removeChild(editH4.firstChild); }
		editH4.appendChild(cTN("Avalie esta matéria"));
	}
	
	editSpan = cont.getElementsByTagName("span")[0];
	if(editSpan)
	{
		while(editSpan.hasChildNodes()){ editSpan.removeChild(editSpan.firstChild); }
		editSpan.appendChild(cTN("Escolha uma nota e classifique esta matéria"));
	}
	
	
	cont.appendChild(cE("p","Avalie esta matéria de acordo com as opçoes abaixo. Desta forma voce cria um ranking com suas matérias favoritas e ajuda o iMasters a avaliar o seu conteúdo."));
	for(i=5; i>=1; i--)
	{
		try 
		{ 
			if(gE('numNota').value==i) { cont.appendChild(document.createElement("<input type=radio name=avalie checked=checked value="+i+" />")); }
			else { cont.appendChild(document.createElement("<input type=radio name=avalie value="+i+" />")); }
		}
		catch(e)
		{
			if(gE('numNota').value==i) { tmpArr = Array("type=radio","name=avalie","value="+i,"checked=checked"); }
			else { tmpArr = Array("type=radio","name=avalie","value="+i); }
			cont.appendChild(cE("input", tmpArr, ""));
		}
		
		cont.appendChild(cTN(" "));		
		cont.appendChild(cE("img", Array("src=http://static.imasters.com.br/img/conteudo/n_"+i+"_0.gif","alt="+i), ""));
		
		switch(i)
		{
			case 1: cont.appendChild(cE("span","className=n", " (ruim)")); break;
			case 2: cont.appendChild(cE("span","className=n", " (regular)")); break;
			case 3: cont.appendChild(cE("span","className=n", " (bom)")); break;
			case 4: cont.appendChild(cE("span","className=n", " (muito bom)")); break;
			case 5: cont.appendChild(cE("span","className=n", " (excelente)")); break;
		}
		if(i!=1) cont.appendChild(cE("br"));
	}
	

	if(gE('int_rodape'))
	{
		while(gE('int_rodape').hasChildNodes()){ gE('int_rodape').removeChild(gE('int_rodape').firstChild); }
		inputSubmit = cE('input', Array("type=submit","name=submit","value=Votar"), "");

		inputSubmit.name = "submit";
		gE('int_rodape').appendChild(inputSubmit);
		adEvento(inputSubmit, 'click', avaliar);
	}

	
	if(e) return poin(e);
}

function avaliar(e)
{
	form = gE('formInteracao');
	postString = "";
	if(form)
	{
		for(i=0; i<form.avalie.length; i++)
		{
			if(form.avalie[i].checked) postString += "avalie="+form.avalie[i].value+"&";
		}
		
		postString += "codConteudo="+form.codConteudo.value+"&";
		XHR.open('post', '/ajax.php?r=4&rand='+Math.floor(Math.random()*100), true);
		XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		XHR.onreadystatechange=responseAvaliar;
		XHR.send(postString);
	}
	return poin(e);	
}

function responseAvaliar()
{
	if(XHR.readyState == 4)
	{
		if (XHR.status == 200) 
		{
			eval(unescape(XHR.responseText.replace(/\+/g," ")));
		}
	}	
}

function escondeInteracao(e)
{
	gE('barra').style.display = 'block';
	gE('int_painel').style.display = 'none';
	return false;
}

function exibirInteracao(e)
{
	if(e)
	{
		aTarget = getSrc(e);
		exibirInteracaoConteudo = aTarget.className;
	}

	gE('barra').style.display = 'none';
	gE('int_painel').style.display = 'block';	
	if(exibirInteracaoConteudo!="")
	{
		switch(exibirInteracaoConteudo)
		{
			case "fale": conteudoFale(); break;
			case "indique": conteudoIndique(); break;
			case "comente": conteudoPoste(); break;
		}
	}
	if(e) return poin(e);
}

function janelaLogin(e)
{
	aTarget = getSrc(e);
	exibirInteracaoConteudo = aTarget.className;
	
	if(e.stopPropagation) e.stopPropagation();
	
	if(divLogin){  gE('interacao').removeChild(divLogin); divLogin = false; }
	
	divLogin = cE('div', Array("id=janelaLogin"),"");
	divLogin.appendChild(cTN("Efetue o login para utilizar os recursos"));
	
	
	formLogin = cE('form', Array("name=formLogin","method=post","id=formLogin","enctype=multipart/form-data"),"");
	formLogin.name = "formLogin";
	
	newInputEmail = cE("input",Array("type=text","name=strEmail","id=strEmail","className=text","value=seu e-mail"), "");
	newInputSenha = cE("input",Array("type=password","name=strSenha","id=strSenha","className=password","value=senha"), "");
	newInputSubmit = cE("input",Array("type=submit","name=submit","id=submit","value=Entrar","className=submit"), "");
	newFechar = cE("a", Array("className=fechar","href=javascript:;"), "");
	
	formLogin.appendChild(newInputEmail);
	formLogin.appendChild(newInputSenha);
	formLogin.appendChild(newInputSubmit);
	divLogin.appendChild(formLogin);
	divLogin.appendChild(cTN("Clique aqui para se "));
	divLogin.appendChild(cE("a",Array("href=/cadastro"), "cadastrar"));
	divLogin.appendChild(cTN(" gratuitamente."));
	divLogin.appendChild(newFechar);
				
	adEvento(newInputEmail, 'focus', function() { if(newInputEmail.value=="seu e-mail") newInputEmail.value = ""; });
	adEvento(newInputSenha, 'focus', function() { if(newInputSenha.value=="senha") newInputSenha.value = ""; });
	adEvento(newFechar, 'click', fechaJanelaLogin);
	adEvento(newInputSubmit, 'click', login);
	gE('interacao').appendChild(divLogin);
	divLogin.style.position = "absolute";
	cursor = getPosition(e);
	divLogin.style.left = (cursor.x-10)+"px";
	divLogin.style.top = (cursor.y-10)+"px";
	if(e) return poin(e);
}

function fechaJanelaLogin()
{
	if(divLogin)
	{
		gE('interacao').removeChild(divLogin);
		divLogin = false;
	}
}

function login(e)
{
	postString = getForm(formLogin);
	XHR_Login.open('post', '/meu/index.php?rand='+Math.floor(Math.random()*100), true);
	XHR_Login.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR_Login.onreadystatechange=responseLogin;
	XHR_Login.send(postString);
	return poin(e);
}

function responseLogin()
{
	if(XHR_Login.readyState == 4)
	{
		if (XHR_Login.status == 200) 
		{
			strMsg = "";
			codUsuario = "";
			eval(unescape(XHR_Login.responseText.replace(/\+/g," ")));
			
			if(strMsg != "") { alert(strMsg); }
			else
			{
				if(codUsuario != 0 && codUsuario != "")
				{
					gE('formInteracao').codUsuario.value = codUsuario;
					if(strongNome = gE('strNome'))
					{
						strongNome.appendChild(cTN(strUserNome+" "+strSobrenome));	
					}
					remEventos(gE('barra'), 'click');
					adEvento(gE('barra'),'click',exibirInteracao);
					
					iLinks = gE('ilinks');
					arriLinksA = iLinks.getElementsByTagName('a');
					for(i=0; i<arriLinksA.length; i++)
					{
							adEvento(arriLinksA[i],'click', exibirInteracao);
					}
					
					exibirInteracao();
					fechaJanelaLogin();
					
					menuLogin = cE('div',Array('id=login'), "Voce está logado como ");
					menuLogin.appendChild(cE('strong',strUserNome));
					menuLogin.appendChild(cTN(". Navegue pelo menu abaixo!"));
					formMenuLogin = cE('form', Array(action="http://meu.imasters.com.br"), "");
					selectMeuMenu = cE('select',"id=selectMeuMenu","");
					for(i=0; i<arrMeuMenu.length; i++)
					{
						selectMeuMenu.appendChild(cE('option',Array("label="+arrMeuMenu[i][0],"value="+arrMeuMenu[i][1]),arrMeuMenu[i][0]));
					}
					newP = cE('p',"");
					newP.appendChild(selectMeuMenu);
					adEvento(selectMeuMenu, 'change', mudaMeu);	
					formMenuLogin.appendChild(newP);
					menuLogin.appendChild(formMenuLogin);
					gE('nav').insertBefore(menuLogin, gE('nav').firstChild);
					
					activeLinks();
				}
			}
		}
	}
}