
//############################# AXE RESULTS ################################################################################ 
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
			xmlDoc.setProperty("SelectionLanguage","XPath");
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

function gotoTest(runid,testindex)
{
	if(window.ActiveXObject)
    {
		applyXSLT('Test',runid,testindex,'','y',false,true);
    }
    else
    {
		window.location = "index.html?runid=" + runid + "&testindex=" + testindex;
	}
}

function applyXSLT(typeParam,runidParam,tindexParam,stidParam,rmcall,failonly,enableback)
	{
	    var objXML;
	    var objXSLT;
	    var objxsltTemplate;
	    var objxsltProcessor;
		var TransformResults;
	    var title;
		var querystring;
		var tmpStr;
		var tmpValue;
		var tmpTestID;
		var tmpRunID;

		var QS_query = false;
		var QS_runid = "";
		var QS_testid = "";
		var QS_testindex = "";
		var QS_subtestid = "";

		try
		{ 
			// Parse Query string for type, runid,testid,textindex,subtestid
			if(!isNull(location.search))
			{
				if(location.search.length > 1) 
				{	
					QS_query=true;
					querystring = location.search;
					//alert(querystring);
					querystring = querystring.substring(1,querystring.length)
					for(var i=0;i<querystring.split("&").length;i++)
					{
						tmpStr = querystring.split("&")[i].split("=")[0];
						tmpValue = querystring.split("&")[i].split("=")[1];
						switch(tmpStr)
						{
							case "runid":
								QS_runid = tmpValue;
								break;
							case "testid":
								QS_testid = tmpValue;
								break;
							case "testindex":
								QS_testindex = tmpValue;
								break;
							case "subtestid":
								QS_subtestid = tmpValue;
								break;
							default: 
								
						}
					}
				}	
			}
			
			//Load XML
			if(window.ActiveXObject)
			{
				objXML = new ActiveXObject("MSXML2.DOMDocument");
				objXML.async = false;
				objXML.validateOnParse = false;
		   
				objXSLT = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
				objXSLT.async = false;
				objXSLT.validateOnParse = false;
				
				objXML.load("results.xml");
			}
			else if (document.implementation && document.implementation.createDocument)
			{
				
				var xmlhttp = new window.XMLHttpRequest();
				xmlhttp.open("GET", "results.xml", false);
				xmlhttp.send(null);
				objXML = xmlhttp.responseXML.documentElement;	
			}
			
			//Check for Query String Call and amend parameters to XSLT
			if(QS_query)
			{
				//Check for TestIndex and Runid passed
				if(QS_testindex != "" && QS_runid != "")
				{
					runidParam = QS_runid;
					tindexParam = QS_testindex;
					typeParam = "Test";
					//For title
					tmpTestID = SelectSingleNode(objXML,"/testsuite/build/run[name='" + runidParam + "']/test[index='" + tindexParam + "']/id");
					tmpRunID = runidParam;
				}
				//Check for TestID and RunID passed
				if(QS_testid!="" && QS_runid != "")
				{	
					//Select the first test of this run with the id passed
					tindexParam = SelectSingleNode(objXML,"/testsuite/build/run[name='" + QS_runid + "']/test[id='"+ QS_testid + "'][last()]/index");
					runidParam = QS_runid;
					typeParam = "Test";
					//For title
					tmpTestID = QS_testid;
					tmpRunID = runidParam;
				}
				//Check for TestID with no run id (Use run-master)
				if(QS_testid!="" && QS_runid == "")
				{
					tindexParam = SelectSingleNode(objXML,"/testsuite/build/run_master/test[id='"+ QS_testid + "']/test_index");
					runidParam = SelectSingleNode(objXML,"/testsuite/build/run_master/test[id='"+ QS_testid + "']/run");
					typeParam = "Test";
					//For title
					tmpTestID = QS_testid;
					tmpRunID = runidParam;	
				}
				
			}	
			
			//Set parameters and run transform
			if(window.ActiveXObject)
			{
				objXSLT.load("results.xsl");
			
				objxsltTemplate = new ActiveXObject("MSXML2.XSLTemplate");
				objxsltTemplate.stylesheet = objXSLT;
				objxsltProcessor = objxsltTemplate.createProcessor();
				
				objxsltProcessor.input = objXML;
				objxsltProcessor.addParameter("type",typeParam);
				objxsltProcessor.addParameter("runid",runidParam);
				objxsltProcessor.addParameter("testindex",tindexParam);
				objxsltProcessor.addParameter("subtestid",stidParam);
				objxsltProcessor.addParameter("rmcall",rmcall);
				objxsltProcessor.addParameter("failonly",failonly);
				
				objxsltProcessor.transform();
				
				TransformResults = objxsltProcessor.output;
			}
			else if (document.implementation && document.implementation.createDocument)
			{
				xmlhttp = new window.XMLHttpRequest();
				xmlhttp.open("GET", "results.xsl", false);
				xmlhttp.send(null);
				objXSLT = xmlhttp.responseXML.documentElement;
				
				objxsltProcessor = new XSLTProcessor();
				objxsltProcessor.importStylesheet(objXSLT);
				
				objxsltProcessor.setParameter(null,"type",typeParam);
				objxsltProcessor.setParameter(null,"runid",runidParam);
				objxsltProcessor.setParameter(null,"testindex",tindexParam);
				objxsltProcessor.setParameter(null,"subtestid",stidParam);
				objxsltProcessor.setParameter(null,"rmcall",rmcall);
				objxsltProcessor.setParameter(null,"failonly",failonly);
				
				TransformResults = objxsltProcessor.transformToDocument(objXML);
			}
			
			//Create the Title For a Test 
			title = "Axe Results - " + SelectSingleNode(objXML,"/testsuite/name") + " (" + SelectSingleNode(objXML,"/testsuite/build/name") + ")";
			if(typeParam == "Test")
			{
				if(!QS_query)
				{
					tmpTestID = SelectSingleNode(objXML,"/testsuite/build/run[name='" + runidParam + "']/test[index='" + tindexParam + "']/id");
					tmpRunID = runidParam;
				}
				title = title + " - Run: " + tmpRunID + " - Test: " + tmpTestID;
			}	
			
		}
		catch(e)
		{
			document.write("XSLT Error: " + e.message + "<br/>");
			//error handling
		}

		document.title = title;	
		
		if(window.ActiveXObject)
		{
			if(enableback==true)
			{
				document.open();
				document.write('<html><head><script type="text/javascript" src="Results.js"></script><link type="text/css" rel="stylesheet" href="axe.css"/></head><body class="main"><div id="resultdiv">');
				document.write(TransformResults);
				document.write("</div></body></html>");
				document.title = title;	
				document.close();	

			}
			else
			{
				resultdiv.innerHTML = TransformResults;
			}
		}
		else if (document.implementation && document.implementation.createDocument)
		{	
			document.getElementById("resultdiv").innerHTML = new XMLSerializer().serializeToString(TransformResults.firstChild)
		}

	}

