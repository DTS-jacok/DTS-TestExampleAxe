// Test1
// C:/AXE_Projects/TestHarnessAPI/data/Tests.xml:Tests Test1
package axe;
import objectmap.objectmap;
import resources.axe.*;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Variant;
import com.jacob.com.Dispatch;
import com.rational.test.ft.*;
import com.rational.test.ft.object.interfaces.*;
import com.rational.test.ft.object.interfaces.SAP.*;
import com.rational.test.ft.object.interfaces.WPF.*;
import com.rational.test.ft.object.interfaces.dojo.*;
import com.rational.test.ft.object.interfaces.siebel.*;
import com.rational.test.ft.object.interfaces.flex.*;
import com.rational.test.ft.object.interfaces.generichtmlsubdomain.*;
import com.rational.test.ft.script.*;
import com.rational.test.ft.value.*;
import com.rational.test.ft.vp.*;
import com.ibm.rational.test.ft.object.interfaces.sapwebportal.*;

import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.*;
import java.io.File;
import helpers.CustomLib;
import java.io.BufferedWriter;
import java.io.FileWriter;


public class Test1 extends Test1Helper

{

       public static void testMain(Object[] args)

       {

           objectmap map = new objectmap();         

           axeInit("C:\\AXE_Projects\\TestHarnessAPI\\TestHarnessAPI.tpj", "debug");
 


			Dispatch.call(axe, "TestBegin", "Test1" ,"Get Country code details", "C:/AXE_Projects/TestHarnessAPI/data/Tests.xml", "Tests", "C:/AXE_Projects/TestHarnessAPI/results/debug/results.xml","");
			try
			{
// 
// C:/AXE_Projects/TestHarnessAPI/data/Tests.xml:countryInfoByIana Test01
				Dispatch.call(axe, "SubtestBegin", "Test01", "Get country details", "C:/AXE_Projects/TestHarnessAPI/data/Tests.xml", "countryInfoByIana");
				Dispatch.call(axe, "StepBegin", "[]countryInfoByIana", "load.file(countryInfoByIana.xml)", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Data",  Dispatch.call(axe, "LoadFile", "countryInfoByIana.xml").toString());
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]countryInfoByIana", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInitialise", Dispatch.call(axe, "GetRunCategoryOption", "webservice", "MobileFish"),  "countryInfoByIana", "http://www.mobilefish.com/services/web_service/countries.php", Dispatch.get(axe, "Data").toString(), Dispatch.call(axe, "GetRunCategoryOptions", "namespace"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "MobileFish", "username"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "MobileFish", "password"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ianacode", "Set", "za");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "ianacode", "za");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]countryInfoByIana", "Invoke", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInvoke");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]countryInfoByIana", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsResponse"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]countryInfoByIana", "val.notequal", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateNotEqual", "", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "ianacodeResponse", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//ianacode"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ianacodeResponse", "val", "za");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "za", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "countrynameResponse", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//countryname"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "countrynameResponse", "val", "South Africa");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "South Africa", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "latitudeResponse", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//latitude"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "latitudeResponse", "val", "-30.559483");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "-30.559483", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "longitudeResponse", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//longitude"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "longitudeResponse", "val", "22.937506");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "22.937506", Dispatch.get(axe, "Value")));
				axeStepEnd();
				axeSubtestEnd();
// 
// 
            }
            catch(Exception ex)
            {
                axeTestAbort(ex.getMessage());          
                return;
            }
            Dispatch.call(axe, "TestEnd");
            unregisterAll();
        }
}
