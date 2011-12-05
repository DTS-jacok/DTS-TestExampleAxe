// Test2
// C:/AXE_Projects/TestHarnessAPI/data/Tests.xml:Tests Test2
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


public class Test2 extends Test2Helper

{

       public static void testMain(Object[] args)

       {

           objectmap map = new objectmap();         

           axeInit("C:\\AXE_Projects\\TestHarnessAPI\\TestHarnessAPI.tpj", "debug");
 


			Dispatch.call(axe, "TestBegin", "Test2" ,"Get a multi return from regions", "C:/AXE_Projects/TestHarnessAPI/data/Tests.xml", "Tests", "C:/AXE_Projects/TestHarnessAPI/results/debug/results.xml","");
			try
			{
// 
// C:/AXE_Projects/TestHarnessAPI/data/Tests.xml:regionsInfoByIana Test02
				Dispatch.call(axe, "SubtestBegin", "Test02", "Multi returns", "C:/AXE_Projects/TestHarnessAPI/data/Tests.xml", "regionsInfoByIana");
				Dispatch.call(axe, "StepBegin", "[]regionsInfoByIana", "load.file(regionsInfoByIana.xml)", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Data",  Dispatch.call(axe, "LoadFile", "regionsInfoByIana.xml").toString());
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]regionsInfoByIana", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInitialise", Dispatch.call(axe, "GetRunCategoryOption", "webservice", "MobileFish"),  "regionsInfoByIana", "http://www.mobilefish.com/services/web_service/countries.php", Dispatch.get(axe, "Data").toString(), Dispatch.call(axe, "GetRunCategoryOptions", "namespace"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "MobileFish", "username"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "MobileFish", "password"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ianacode", "Set", "za");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "ianacode", "za");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]regionsInfoByIana", "Invoke", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInvoke");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]regionsInfoByIana", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsResponse"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]regionsInfoByIana", "val.notequal", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateNotEqual", "", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "[]regionsInfoByIana", "get.nodecount", "");  Dispatch.put(axe, "ResultCode", 0);
				        try {
            BufferedWriter out = new BufferedWriter(new FileWriter("test.txt"));
            out.write(Dispatch.get(axe, "Value").toString());
            out.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    CustomLib n = new CustomLib();
    Dispatch.put(axe, "ResultCode", Dispatch.call(axe,"StepValidateNotEqual","",n.getTheCount()))          ;
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ListResponse", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//allregionslist"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ListResponse", "val.notequal", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateNotEqual", "", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "ListResponse", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//allregionslist"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ListResponse", "val.notequal", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateNotEqual", "", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "ListResponseItem_2", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//allregionslist/item[2]"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ListResponseItem_2", "val.notequal", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateNotEqual", "", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "ListResponseItem_2_Code", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//allregionslist/item[2]/ianacode"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ListResponseItem_2_Code", "val.notequal", "za1");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateNotEqual", "za1", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "ListResponseRegion", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//allregionslist/item/regionname"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ListResponseRegion", "val", "Eastern Cape");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "Eastern Cape", Dispatch.get(axe, "Value")));
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
