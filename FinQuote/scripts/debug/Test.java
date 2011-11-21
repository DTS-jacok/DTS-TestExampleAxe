// Test
// C:/AXE_Projects/FinQuote/data/Tests.xml:Tests Test
package axe;
import ObjectMap.ObjectMap;
import resources.axe.TestHelper;
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

public class Test extends TestHelper{
 public static void testMain(Object[] args){
           ObjectMap map = new ObjectMap();         
           axeInit("C:\\AXE_Projects\\FinQuote\\FinQuote.tpj", "debug");


			Dispatch.call(axe, "TestBegin", "Test" ,"test", "C:/AXE_Projects/FinQuote/data/Tests.xml", "Tests", "C:/AXE_Projects/FinQuote/results/debug/results.xml","");
			try
			{
				Dispatch.call(axe, "BasestateBegin", "Fin.Home");
				browser = axeBrowserBasestate(Dispatch.call(axe, "GetRunCategoryOption", "WebSite", "Fin.Home").toString());
				Dispatch.call(axe, "BasestateEnd", 0, "", "");

// 
// Subtests:SetFinFields Test1
				Dispatch.call(axe, "SubtestBegin", "Test1", "", "Subtests", "SetFinFields");
				Dispatch.call(axe, "StepBegin", "[]FinQuoteHome", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome().find().unregister();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtPurPrice", "Set", "200000");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_txtPurPrice().setText("200000");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtValExtras", "Set", "1500");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_txtValExtras().setText("1500");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtDeposit", "Set", "2000");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_txtDeposit().setText("2000");
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtFinAmount", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", map.FinQuoteHome_txtFinAmount().getText());
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtFinAmount", "val.equal", "201140.00");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "201140.00", Dispatch.get(axe, "Value")));
				axeStepEnd();
				axeSubtestEnd();
// 
// Subtests:FinQuote id01
				Dispatch.call(axe, "SubtestBegin", "id01", "Clear the form", "Subtests", "FinQuote");
				Dispatch.call(axe, "StepBegin", "[]FinQuoteHome", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome().find().unregister();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "btnclearForm", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_btnclearForm().click();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "btncalculatebutton", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_btncalculatebutton().click();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "msgErrorwindow", "Exist", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_msgErrorwindow().exists();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "btnOkButton", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_btnOkButton().click();
				axeStepEnd();

				axeSubtestEnd();
// 
// Subtests:SetFinFields id02
				Dispatch.call(axe, "SubtestBegin", "id02", "set focus", "Subtests", "SetFinFields");
				Dispatch.call(axe, "StepBegin", "[]FinQuoteHome", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome().find().unregister();
				axeStepEnd();

				Dispatch.call(axe, "StepBegin", "txtValExtras", "Set", "");  Dispatch.put(axe, "ResultCode", 0);
				map.FinQuoteHome_txtValExtras().setText("");
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
