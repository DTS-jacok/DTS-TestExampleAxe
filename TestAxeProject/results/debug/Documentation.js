//############################# AXE DOCUMENTATION ########################################################################## 
//#
//#	Copyright:	(c)Copyright 2004-2009 Odin Technology Ltd. All Rights Reserved.
//#	Version:	v2.0rev1
//#	Contact:	www.odintech.com
//#
//##########################################################################################################################
function SelectSingleNode(xmlDoc, elementPath)
    {
        if(window.ActiveXObject)
        {
            return xmlDoc.selectSingleNode(elementPath).text;
        }
        else
        {
           var xpe = new XPathEvaluator();
           var nsResolver = xpe.createNSResolver( xmlDoc.ownerDocument == null ? xmlDoc.documentElement : xmlDoc.ownerDocument.documentElement);
           var results = xpe.evaluate(elementPath,xmlDoc,nsResolver,XPathResult.FIRST_ORDERED_NODE_TYPE, null);
           return results.singleNodeValue.textContent; 
        }
    }
	
function isNull(val){return(val==null);}	
	
function applyXSLT(typeParam,xmlFile,enableback,manualview)
	{
	    var objXML;
	    var objXSLT;
	    var objxsltTemplate;
	    var objxsltProcessor;
		var TransformResults;
	    var title;
		var tmpStr;
		var tmpValue;
		var querystring;
		
		try
		{ 
			if(!isNull(location.search))
			{
				if(location.search.length > 1) 
				{	
					querystring = location.search;
					//alert(querystring);
					querystring = querystring.substring(1,querystring.length)
					for(var i=0;i<querystring.split("&").length;i++)
					{
						tmpStr = querystring.split("&")[i].split("=")[0];
						tmpValue = querystring.split("&")[i].split("=")[1];
						switch(tmpStr)
						{
							case "testid":
								xmlFile = "tests/" + tmpValue + ".xml";
								typeParam = "Test";
								break;
							default: 
								
						}
					}
				}	
			}
			if(window.ActiveXObject)
			{
				objXML = new ActiveXObject("MSXML2.DOMDocument");
				objXML.async = false;
				objXML.validateOnParse = false;
			   
				objXSLT = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
				objXSLT.async = false;
				objXSLT.validateOnParse = false;
				
				//Load XML and XSLT documents
				objXML.load(xmlFile);
					
				objXSLT.load("Documentation.xsl");
				 
				objxsltTemplate = new ActiveXObject("MSXML2.XSLTemplate");
				objxsltTemplate.stylesheet = objXSLT;
				objxsltProcessor = objxsltTemplate.createProcessor();
				objxsltProcessor.input = objXML;
				objxsltProcessor.addParameter("type",typeParam);
				objxsltProcessor.addParameter("manualview",manualview);
				
				objxsltProcessor.transform();
				
				TransformResults = objxsltProcessor.output;
			}
			else if (document.implementation && document.implementation.createDocument)
			{
				
				var xmlhttp = new window.XMLHttpRequest();
				xmlhttp.open("GET", xmlFile, false);
				xmlhttp.send(null);
				objXML = xmlhttp.responseXML.documentElement;
			
				xmlhttp = new window.XMLHttpRequest();
				xmlhttp.open("GET", "Documentation.xsl", false);
				xmlhttp.send(null);
				objXSLT = xmlhttp.responseXML.documentElement;
				
				objxsltProcessor = new XSLTProcessor();
				objxsltProcessor.importStylesheet(objXSLT);
				
				objxsltProcessor.setParameter(null,"type",typeParam);
				objxsltProcessor.setParameter(null,"manualview",manualview);
				
				TransformResults = objxsltProcessor.transformToDocument(objXML);
				
			}
			
			if(typeParam=="Summary")
				title = SelectSingleNode(objXML,"/testsuite/name") + " - Documentation Index";
			else
				title = "Test: " + SelectSingleNode(objXML,"/test/id") + " - Documentation";
		}
		catch(e)
		{
			document.write("XSLT Error: " + e.message + "<br/>");
			//error handling
		}

		if(enableback==true)
		{
			document.open();
			document.write('<html><head><script type="text/javascript" src="Documentation.js"></script><link type="text/css" rel="stylesheet" href="axe.css"/></head><body class="main"><div id="resultdiv">');
			if(window.ActiveXObject)
			{
				document.write(TransformResults);
			}
			else if (document.implementation && document.implementation.createDocument)
			{
				//alert(new XMLSerializer().serializeToString(TransformResults.firstChild));
				document.write(new XMLSerializer().serializeToString(TransformResults.firstChild));
			}
			document.write("</div></body></html>");
			document.title = title;	
			document.close();
		}
		else
		{
			document.title = title;	
			if(window.ActiveXObject)
			{
				resultdiv.innerHTML = TransformResults;
			}
			else if (document.implementation && document.implementation.createDocument)
			{
				//alert(new XMLSerializer().serializeToString(TransformResults.firstChild));
				document.getElementById("resultdiv").innerHTML = new XMLSerializer().serializeToString(TransformResults.firstChild)
			}
		}

	}

