function date1()
{
	var d=new Date();
	var weekday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
	var monthname=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

	return weekday[d.getDay()] + " " + d.getDate() + " " + monthname[d.getMonth()] + " " + d.getFullYear();
}

function old_date1()
{
	var d=new Date();
	var t;
	var weekday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
	var monthname=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

	t=d.getTime() - 100000000;
	d.setTime(t);
	return weekday[d.getDay()] + " " + d.getDate() + " " + monthname[d.getMonth()] + " " + d.getFullYear() + " " + d.getUTCHours() + ":" + d.getUTCMinutes() + ":" + d.getUTCSeconds();
}

function old_date2()
{
	var d=new Date();
	var t;
	var weekday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
	var monthname=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");

	t=d.getTime() - 6000000000
	d.setTime(t);
	return weekday[d.getDay()] + " " + d.getDate() + " " + monthname[d.getMonth()] + " " + d.getFullYear() + " " + d.getUTCHours() + ":" + d.getUTCMinutes() + ":" + d.getUTCSeconds();
}

function time1()
{
	var d=new Date();
	return d.getUTCHours() + ":" + d.getUTCMinutes() + ":" + d.getUTCSeconds();

}


function refno()
{
	return "ZX81";
}

function mkpasswd()
{
	var d=new Date();
	var weekday=new Array("su","mo","tu","we","th","fr","sa");
	return weekday[d.getDay()] + d.getUTCSeconds() + "zx";
}

function wait(seconds)
{
	var start = new Date();
	var end;
	
	do
	{
		end = new Date();
	}
	while((end.getUTCSeconds() - start.getUTCSeconds()) < seconds);	
}


function pause(numberMillis) 
{	
	var now = new Date();
        var exitTime = now.getTime() + numberMillis;
	window.alert("pause " + numberMillis);
        while (true)
	{
		now = new Date();
window.alert(now.getTime() + " " + exitTime);
		if (now.getTime() > exitTime)
 			return;
        }
}


function login(id, password)
{
//	clearTimeout();		// not valid in NS6
	var error = 0
	document.getElementById("TextBoxUserIdError").innerHTML = "";
	document.getElementById("TextBoxPasswordError").innerHTML = "";

	if(id == "")
	{
		document.getElementById("TextBoxUserIdError").innerHTML = "* User ID is required";
		error = 1;
	}
	if(password == "")
	{
		document.getElementById("TextBoxPasswordError").innerHTML = "* Password is required";
		error = 2;
	}

	if(error != 0)
	{
		return;
	}

	if(password.substr(0, 4) == "wait")
	{
		wait(password.substr(4));
	}
	if(password.substr(0, 5) == "pause")
	{
		pause(password.substr(5));
	}
	if(password.substr(0, 4) == "time")
	{
		setTimeout("window.location='index2.html'", password.substr(4));
		return;
	}
	if(password.substr(0, 5) == "alert")
	{
		window.alert("UserId: " + id);
	}
	
	if(id == "admin")
	{
		window.location.href = "index_admin.html";
	}
	else
	{
		window.location.href = "index2.html";
	}
}

function LoadXml(node,xmlFile, xslFile)
{
	var objXML;
	var objXSLT;
	var objxsltTemplate;
	var objxsltProcessor;
	var TransformResults;
	
	try
	{
		if (window.ActiveXObject)	// IE
		{
			objXML = new ActiveXObject("MSXML2.DOMDocument");
			objXML.async = false;
			objXML.validateOnParse = false;
		   
			objXSLT = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
			objXSLT.async = false;
			objXSLT.validateOnParse = false;
			
			//Load XML and XSLT documents
			objXML.load(xmlFile);
			objXSLT.load(xslFile);
			 
			objxsltTemplate = new ActiveXObject("MSXML2.XSLTemplate");
			objxsltTemplate.stylesheet = objXSLT;
			objxsltProcessor = objxsltTemplate.createProcessor();
			objxsltProcessor.input = objXML;
			
			objxsltProcessor.transform();
			
			TransformResults = objxsltProcessor.output;
			node.innerHTML = TransformResults;
		}
		else if (document.implementation && document.implementation.createDocument)
		{
			var xmlhttp = new window.XMLHttpRequest();
			xmlhttp.open("GET", xmlFile, false);
			xmlhttp.send(null);
			objXML = xmlhttp.responseXML.documentElement;
			
			xmlhttp = new window.XMLHttpRequest();
			xmlhttp.open("GET", xslFile, false);
			xmlhttp.send(null);
			objXSLT = xmlhttp.responseXML.documentElement;
			
			objxsltProcessor = new XSLTProcessor();
			objxsltProcessor.importStylesheet(objXSLT);
			
			TransformResults = objxsltProcessor.transformToDocument(objXML);
			node.innerHTML = new XMLSerializer().serializeToString(TransformResults);
		}
	}
	catch(e)
	{
		document.write("XSLT Error: " + e.message + "<br/>");
		//error handling
	}
}