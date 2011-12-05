// Test4
// C:/AXE_Projects/TestHarnessAPI/data/Tests.xml:Tests Test4
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


public class Test4 extends Test4Helper

{

       public static void testMain(Object[] args)

       {

           objectmap map = new objectmap();         

           axeInit("C:\\AXE_Projects\\TestHarnessAPI\\TestHarnessAPI.tpj", "debug");
 


			Dispatch.call(axe, "TestBegin", "Test4" ,"Try Database", "C:/AXE_Projects/TestHarnessAPI/data/Tests.xml", "Tests", "C:/AXE_Projects/TestHarnessAPI/results/debug/results.xml","");
			try
			{
// 
// C:/AXE_Projects/TestHarnessAPI/data/Tests.xml:SQLUser Test01
				Dispatch.call(axe, "SubtestBegin", "Test01", "", "C:/AXE_Projects/TestHarnessAPI/data/Tests.xml", "SQLUser");
				Dispatch.call(axe, "StepBegin", "[]SQLUser", "set", "select * from accounts where Id in (1,2)");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "DbInitialiseQuery", Dispatch.call(axe, "GetRunCategoryOption", "connection", "MySqlLocal"),  Dispatch.call(axe, "GetRunCategoryOptionProperty", "connection", "MySqlLocal", "provider"), "select * from accounts where Id in (1,2)", "System.Data.DataSet");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]SQLUser", "Invoke", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "DbInvoke");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "Surname", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value",  Dispatch.call(harness, "DbGetResultNodeText", "//Surname", false));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "Surname", "val", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "", Dispatch.get(axe, "Value")));
				axeStepEnd();
				Dispatch.call(axe, "StepBegin", "ReturnValue", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value",  Dispatch.call(harness, "DbGetResult"));
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "ReturnValue", "val", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "", Dispatch.get(axe, "Value")));
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
