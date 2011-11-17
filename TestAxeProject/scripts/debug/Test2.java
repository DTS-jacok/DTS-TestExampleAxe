// Test2
// C:/AXE_Projects/TestAxeProject/data/Tests.xml:Login Test2
package axe;
import ObjectMap.ObjectMap;
import resources.axe.Test2Helper;
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

public class Test2 extends Test2Helper

{

       public static void testMain(Object[] args)

       {

           ObjectMap map = new ObjectMap();         

           axeInit("C:\\AXE_Projects\\TestAxeProject\\TestAxeProject.tpj", "debug");
 


			Dispatch.call(axe, "TestBegin", "Test2" ,"", "C:/AXE_Projects/TestAxeProject/data/Tests.xml", "Login", "C:/AXE_Projects/TestAxeProject/results/debug/results.xml","");
			try
			{
				Dispatch.call(axe, "BasestateBegin", "Google.Home");
				browser = axeBrowserBasestate(Dispatch.call(axe, "GetRunCategoryOption", "WebSite", "Google.Home").toString());
				Dispatch.call(axe, "BasestateEnd", 0, "", "");

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
