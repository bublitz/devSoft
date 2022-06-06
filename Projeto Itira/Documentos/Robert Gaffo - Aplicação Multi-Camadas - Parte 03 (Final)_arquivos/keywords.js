// JavaScript Document
adEvento(window, 'load', initKeywords);
var XHR = XMLHTTPRequest();
var layerKeyword = false;
var arrPalavras = false;
var aTextNodes = new Array;
var jnc = 0;

function initKeywords()
{
		XHR.open('get', '/ajax.php?r=16&rand='+Math.floor(Math.random()*100), true);
		XHR.onreadystatechange=mudaPalavras;
		XHR.send(null);
}

function getTextNodes(oNode) { 
  for (var inc=0; inc < oNode.childNodes.length; inc++) {
	if (oNode.childNodes[inc].nodeType == 1) { 
      getTextNodes(oNode.childNodes[inc])
    } else if (oNode.childNodes[inc].nodeType == 3) {
      aTextNodes[jnc] = oNode.childNodes[inc];
      jnc++
    }
  }

  return aTextNodes;
}

function mudaPalavras()
{
	if(XHR.readyState == 4)
	{
		if (XHR.status == 200) 
		{
			strResponse = unescape(XHR.responseText.replace(/\+/g," "));
			eval(strResponse);
			if(gE('strConteudo')) arrTN = getTextNodes(gE('strConteudo'));
			else arrTN = getTextNodes(gE('contserv'));
			
			for(w=0; w<arrPalavras.length; w++)
			{
				//alert("Procurando por: "+arrPalavras[w][0]);
				for(j=0; j<arrTN.length && arrPalavras[w][3] == false; j++)
				{
					str = arrTN[j].nodeValue;
					er = new RegExp();
					er.compile(" "+arrPalavras[w][0]+" ","i");
					rER = er.exec(str);
					if( rER != null && arrTN[j].parentNode.nodeName != "A")
					{
						arrTN[j].nodeValue = str.substring(0, rER.index+1);
						//alert(arrTN[j].nodeValue);
						tmp = cE('a',Array("href=javascript:;","className=keyword"),rER[0].replace(/^\s+|\s+$/g, ''));
						//alert(rER[0].replace(/^\s+|\s+$/g, ''));
						insertAfter(arrTN[j], tmp);
						tmp.ind = w;
						adEvento(tmp, 'click', showKeyword);
						insertAfter( tmp, cTN(str.substr(rER.index+arrPalavras[w][0].length+1)));						
						//alert(str.substr(rER.index+arrPalavras[w][0].length+1));
						arrPalavras[w][3] = true;
					}
				}
			}
		}
	}
}

function showKeyword(e)
{
	objKeyword = getSrc(e);
	removeLayerKeyword();
	layerKeyword = cE('div',Array('id=layerKeyword'),'');
	layerKeyword.appendChild(cE('h3','"'+arrPalavras[objKeyword.ind][0]+'"'));
	layerKeyword.appendChild(layerP = cE('p','Conheça a '));
	layerP.appendChild(cE('a',Array('href=http://www.imasters.com.br/keyword/'+arrPalavras[objKeyword.ind][2]+'/secao/'),'seção exclusiva'));
	layerP.appendChild(cTN(' de '+arrPalavras[objKeyword.ind][1]+' do iMasters ou faça uma pesquisa por '));
	layerP.appendChild(cE('a',Array('href=http://www.imasters.com.br/keyword/'+arrPalavras[objKeyword.ind][2]+'/wiki/'),arrPalavras[objKeyword.ind][0]));
	layerP.appendChild(cTN(' no Wikipedia.'));
	objKeyword.parentNode.appendChild(layerKeyword);
	cursor = getPosition(e);
	layerKeyword.style.left = (cursor.x-10)+"px";
	layerKeyword.style.top = (cursor.y-10)+"px";
	setTimeout("addRemoveClick();",10);
	}

function addRemoveClick()
{
	adEvento(document, 'click', removeLayerKeyword  );		
}

function removeLayerKeyword()
{
	if(layerKeyword != false)
	{
		layerKeyword.parentNode.removeChild(layerKeyword); layerKeyword = false;
		remEventos(document, 'click', removeLayerKeyword);
	}
}