
// Absolute Form Processor XE V1.0 : Form Validation System
// Copyright(c)2000 - 2003 XIGLA SOFTWARE
// http://www.xigla.com

function cancelsubmit(msg,element){
	alert(msg);
	element.focus();
	return false
}



function isNumeric(what){
    if (what.search(/^[-+]?\d+(\.\d+)?$/) != -1)
        return true;
    else
        return false;
}

function isInteger(what){
	if (what.search(/^[-+]?[1-9]\d*.?[0]*$/) != -1)
        return true;
    else
        return false;
}


function isEmail(what) {
	// Works
    if (what.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
        return true;
    else
        return false;
}

function isAlphanumeric(what){
	// ANY alphanumeric string with spaces, commas, dashes.
    if (what.search(/^[a-zA-Z0-9\s.\-]+$/) != -1)
        return true;
    else
        return false;
}

function isAlphabetic(what){
    if (what.search(/^[a-zA-Z\s]+$/) != -1)
        return true;
    else
        return false;
}

function noSpaces(what){
    if (what.search(/\s/) != -1)
        return false;
    else
        return true;
}

function isCC(what){
    if (what.search(/^((4\d{3})|(5[1-5]\d{2})|(6011))-?\d{4}-?\d{4}-?\d{4}|3[4,7]\d{13}$/) != -1)
        return true;
    else
        return false;
}


function xlaAFPvalidate(xlaAFPform){
if (xlaAFPform.email){if (!isEmail(xlaAFPform.email.value)){return cancelsubmit('Field \'email\' does not contain a valid e-mail address.',xlaAFPform.email)}}

}

