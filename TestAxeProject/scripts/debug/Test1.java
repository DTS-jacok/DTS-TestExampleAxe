// Test1
// C:/AXE_Projects/TestAxeProject/data/Tests.xml:Tests Test1
package axe;
import ObjectMap.ObjectMap;
import resources.axe.Test1Helper;
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

public class Test1 extends Test1Helper

{

       public static void testMain(Object[] args)

       {

           ObjectMap map = new ObjectMap();         

           axeInit("C:\\AXE_Projects\\TestAxeProject\\TestAxeProject.tpj", "debug");
 


			Dispatch.call(axe, "TestBegin", "Test1" ,"My Test Description logon", "C:/AXE_Projects/TestAxeProject/data/Tests.xml", "Tests", "C:/AXE_Projects/TestAxeProject/results/debug/results.xml","");
			try
			{
				Dispatch.call(axe, "BasestateBegin", "Home.siebel");
				browser = axeBrowserBasestate(Dispatch.call(axe, "GetRunCategoryOption", "WebSite", "Siebel.Login").toString());
				Dispatch.call(axe, "BasestateEnd", 0, "", "");

// 
// Subtests:Login Login01
				Dispatch.call(axe, "SubtestBegin", "Login01", "Login with admin user", "Subtests", "Login");
				Dispatch.call(axe, "StepBegin", "[]Login", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.Login().find().unregister();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtUserName", "Set", "sadmin");  Dispatch.put(axe, "ResultCode", 0);
				map.Login_txtUserName().setText("sadmin");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtPassword", "Set", "sadmin");  Dispatch.put(axe, "ResultCode", 0);
				map.Login_txtPassword().setText("sadmin");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "imglogin", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.Login_imglogin().click();
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
