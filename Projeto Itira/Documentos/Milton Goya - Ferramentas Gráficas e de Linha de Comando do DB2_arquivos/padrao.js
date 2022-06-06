// JavaScript Document
adEvento(window, 'load', initNavRapida);
XHR_Interesse = XMLHTTPRequest();	

function initNavRapida()
{
	if(gE('selectArticulista'))
	{
		adEvento(gE('selectArticulista'), 'change', mudaAutor);	
	}
	
	if(gE('secoesiMasters'))
	{
		adEvento(gE('secoesiMasters'), 'change', mudaSecao);	
	}
	
	if(gE('areasiMasters'))
	{
		adEvento(gE('areasiMasters'), 'change', mudaArea);	
	}
	
	if(gE('selectMeuMenu'))
	{
		adEvento(gE('selectMeuMenu'), 'change', mudaMeu);	
	}
	
	/* trocado para newsletter, Rafael, 21/07/2006 */
	if(gE('isInteresse'))
	{
		adEvento(gE('isInteresse'), 'click', setInteresse);
	}
	
	if(gE('imShop'))
	{
			widthAval = document.body.clientWidth
			if(widthAval>790+150)
				gE('imShop').style.display = 'block';
			else
				gE('imShop').style.display = 'none';
	}
	
	if(gE('divSky'))
	{
			widthAval = document.body.clientWidth
			if(widthAval>790+150)
				gE('divSky').style.display = 'block';
			else
				gE('divSky').style.display = 'none';
	}
	
	if(gE('barraLateral'))
	{
			widthAval = document.body.clientWidth
			if(widthAval>790+150)
				gE('barraLateral').style.display = 'block';
			else
				gE('barraLateral').style.display = 'none';
	}
	
}

/* trocado para newsletter, Rafael, 21/07/2006 */
function setInteresse()
{	
	if(gE('isInteresse').checked) check = 1;
	else check = 0;
	
	XHR_Interesse.open('get', '/ajax.php?r=12&rand='+Math.floor(Math.random()*100)+'&check='+check+'&codSecao='+gE('isInteresse').value, true);
	XHR_Interesse.onreadystatechange=responseInteresse;
	XHR_Interesse.send(null);
}

/* trocado para newsletter, Rafael, 21/07/2006 */
function responseInteresse()
{
	if(XHR_Interesse.readyState == 4)
	{
		if (XHR_Interesse.status == 200) 
		{
			eval(unescape(XHR_Interesse.responseText.replace(/\+/g," ")));
		}
	}
}
	

function mudaArea()
{
	window.location = gE('areasiMasters').value;	
}

function mudaMeu()
{
	window.location = gE('selectMeuMenu').value;	
}

function mudaAutor()
{
	window.location = "/autor/"+gE('selectArticulista').value;	
}


function mudaSecao()
{
	window.location = '/secao/'+gE('secoesiMasters').value;	
}


/****************************************************************************
* Flash Tag Write Object v1.5 - by Lucas Fererira - www.lucasferreira.com	*
* Info and Usage: www.lucasferreira.com/flashtag							*
* bugs/reports: contato@lucasferreira.com									*
****************************************************************************/

if(Browser == undefined){
	var Browser = {
		isIE: function(){ return (window.ActiveXObject && document.all && navigator.userAgent.toLowerCase().indexOf("msie") > -1  && navigator.userAgent.toLowerCase().indexOf("opera") == -1) ? true : false; }
	}
}

var Flash = function(movie, id, width, height, initParams){

	this.html = "";
	this.attributes = this.params = this.variables = null;
	
	this.variables = new Array();
	this.attributes = {
		"classid": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",
		"codebase": "http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab#version=7,0,0,0",
		"type": "application/x-shockwave-flash"
	}
	this.params = { "pluginurl": "http://www.macromedia.com/go/getflashplayer_br" };
	
	if(movie) {
		this.addAttribute("data", movie);
		this.addParameter("movie", movie);
	}
	
	if(id && id != null) this.addAttribute("id", id);
	if(width) this.addAttribute("width", width);
	if(height) this.addAttribute("height", height);
	
	if(initParams != undefined){
		for(var i in initParams){
			this.addParameter(i.toString(), initParams[i]);
		}
	}
	
}
Flash.version = "1.2b";
Flash.getObjectByExceptions = function(obj, excep){
	var tempObj = {};
	for(var i in obj){
		var inclui = true;
		for(var j=0; j<excep.length; j++)
			if(excep[j] == i.toString()) { inclui = false; break; };
		if(inclui) tempObj[i] = obj[i];
	}
	return tempObj;
}
Flash.prototype.addAttribute = function(prop, val){ this.attributes[prop] = val; }
Flash.prototype.addParameter = function(prop, val){ this.params[prop] = val; }
Flash.prototype.addVariable = function(prop, val){ this.variables.push([prop, val]); }
Flash.prototype.getFlashVars = function(){
	var tempString = new Array();
	
	for(var i=0; i<this.variables.length; i++)
		tempString.push(this.variables[i].join("="));
		
	return tempString.join("&");
}
Flash.prototype.toString = function(){
	
	this.params.flashVars = this.getFlashVars();
	if(Browser.isIE()){
		//IE
		this.html = "<ob" + "ject";
		var attr = Flash.getObjectByExceptions(this.attributes, ["type", "data"]);
		for(var i in attr) if(i.toString() != "extend") this.html += " " + i.toString() + " = \"" + attr[i] + "\"";
		this.html += "> ";
		var params = Flash.getObjectByExceptions(this.params, ["pluginurl", "extend"]);
		for(var i in params) if(i.toString() != "extend") this.html += "<param name=\"" + i.toString() + "\" value=\"" + params[i] + "\" /> ";
		this.html += " </obj" + "ect>";
	} else {
		//non-IE
		this.html = "<!--[if !IE]> <--> <obj" + "ect";
		var attr = Flash.getObjectByExceptions(this.attributes, ["classid", "codebase"]);
		for(var i in attr) if(i.toString() != "extend") this.html += " " + i.toString() + " = \"" + attr[i] + "\"";
		this.html += "> ";
		var params = Flash.getObjectByExceptions(this.params, ["extend"]);
		for(var i in params) if(i.toString() != "extend") this.html += "<param name=\"" + i.toString() + "\" value=\"" + params[i] + "\" /> ";
		this.html += " </obj" + "ect> <!--> <![endif]-->";
	}

	return this.html;
	
}
Flash.prototype.write = Flash.prototype.outIn = Flash.prototype.writeIn = function(w){
	if(typeof w == "string" && document.getElementById) var w = document.getElementById(w);
	if( w != undefined && w ) w.innerHTML = this.toString();
	else document.write( this.toString() );
}

//funções de automatização...
Flash.correctAll = function(){
	
	if(!/MSIE (5|6)/.test(navigator.userAgent) || !document.getElementsByTagName) return false;

	for (var i = 0, objects = document.getElementsByTagName("OBJECT");
			i < objects.length; (objects[i].outerHTML ? (objects[i].outerHTML = objects[i].outerHTML, objects[i].style.visibility = "visible") : null), i++);

}
Flash.automatic = function(r){
	
	if(r && window.attachEvent){
	
		for (var i = 0, objects = document.getElementsByTagName("OBJECT");
				i < objects.length; (objects[i].style.visibility = "hidden"), i++);
		
		window.attachEvent("onload", Flash.correctAll);
		window.attachEvent("onunload", function(){	window.detachEvent("onload", Flash.correctAll);	});
		
	} else {
		Flash.correctAll();
	}

}