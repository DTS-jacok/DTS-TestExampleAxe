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
 


			Dispatch.call(axe, "TestBegin", "Test1" ,"Jaco Test Description logon", "C:/AXE_Projects/TestAxeProject/data/Tests.xml", "Tests", "C:/AXE_Projects/TestAxeProject/results/debug/results.xml","");
			try
			{
				Dispatch.call(axe, "BasestateBegin", "Home.siebel");
				browser = axeBrowserBasestate(Dispatch.call(axe, "GetRunCategoryOption", "WebSite", "Siebel.Login").toString());
				Dispatch.call(axe, "BasestateEnd", 0, "", "");

// 
// Subtests:sblLogin Login01
				Dispatch.call(axe, "SubtestBegin", "Login01", "Login with admin user", "Subtests", "sblLogin");
				Dispatch.call(axe, "StepBegin", "[]sblLogin", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLogin().find().unregister();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtUserName", "Set", "sadmin");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLogin_txtUserName().setText("sadmin");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtPassword", "Set", "sadmin");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLogin_txtPassword().setText("sadmin");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "imglogin", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLogin_imglogin().click();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "imglogin", "sleep(5)", "");  Dispatch.put(axe, "ResultCode", 0);
				sleep(5);
				axeStepEnd();

				axeSubtestEnd();
// 
// Subtests:sblLoginPageTabList doSel1
				Dispatch.call(axe, "SubtestBegin", "doSel1", "Marketing Calendar Screen", "Subtests", "sblLoginPageTabList");
				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "sleep(3)", "Marketing Calendar Screen");  Dispatch.put(axe, "ResultCode", 0);
				sleep(3);
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "Set2", "Marketing Calendar Screen");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLoginPageTabList().gotoScreen("Marketing Calendar Screen");
				axeStepEnd();

				axeSubtestEnd();
// 
// Subtests:sblLoginPageTabList doSel2
				Dispatch.call(axe, "SubtestBegin", "doSel2", "Marketing Plans Screen", "Subtests", "sblLoginPageTabList");
				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "Set(Marketing Plans Screen)", "");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLoginPageTabList().gotoScreen("Marketing Plans Screen");
				axeStepEnd();

				axeSubtestEnd();
// 
// Subtests:sblLoginPageTabList doSel3
				Dispatch.call(axe, "SubtestBegin", "doSel3", "Program Screen", "Subtests", "sblLoginPageTabList");
				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "sleep(3)", "Program Screen");  Dispatch.put(axe, "ResultCode", 0);
				sleep(3);
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "Set2", "Program Screen");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLoginPageTabList().gotoScreen("Program Screen");
				axeStepEnd();

				axeSubtestEnd();
// 
// Subtests:sblLoginPageTabList doSel4
				Dispatch.call(axe, "SubtestBegin", "doSel4", "Campaign Administration Screen", "Subtests", "sblLoginPageTabList");
				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "sleep(3)", "Campaign Administration Screen");  Dispatch.put(axe, "ResultCode", 0);
				sleep(3);
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "Set2", "Campaign Administration Screen");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLoginPageTabList().gotoScreen("Campaign Administration Screen");
				axeStepEnd();

				axeSubtestEnd();
// 
// Subtests:sblLoginPageTabList doSel5
				Dispatch.call(axe, "SubtestBegin", "doSel5", "Marketing Segment Screen", "Subtests", "sblLoginPageTabList");
				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "sleep(3)", "Marketing Segment Screen");  Dispatch.put(axe, "ResultCode", 0);
				sleep(3);
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "Set2", "Marketing Segment Screen");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLoginPageTabList().gotoScreen("Marketing Segment Screen");
				axeStepEnd();

				axeSubtestEnd();
// 
// Subtests:sblLoginPageTabList doSel6
				Dispatch.call(axe, "SubtestBegin", "doSel6", "Offer Screen", "Subtests", "sblLoginPageTabList");
				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "sleep(3)", "Offer Screen");  Dispatch.put(axe, "ResultCode", 0);
				sleep(3);
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "[]sblLoginPageTabList", "Set2", "Offer Screen");  Dispatch.put(axe, "ResultCode", 0);
				map.sblLoginPageTabList().gotoScreen("Offer Screen");
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
