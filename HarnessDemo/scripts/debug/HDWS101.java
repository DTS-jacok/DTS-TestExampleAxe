// HDWS101
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:Tests HDWS101
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Variant;
import com.jacob.com.Dispatch;
public class HDWS101
{
        public static void main(String[] args)
        {
            ActiveXComponent axe = new ActiveXComponent("OdinTechnology.Axe.Runtime.Test");
            ActiveXComponent harness = new ActiveXComponent("OdinTechnology.Axe.Harness.AxeHarnessAPI");
            Dispatch.call(axe, "InitSuite", "C:\\AXE_Projects\\HarnessDemo\\HarnessDemo.tpj", "debug");
            Dispatch.call(harness, "SetSettings", Dispatch.call(axe, "GetRunCategoryOptions", "AxeHarness"));
			Dispatch.call(axe, "TestBegin", "HDWS101" ,"Simple web service with template", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "Tests", "C:/AXE_Projects/HarnessDemo/results/debug/results.xml","");
			try
			{
// 
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:Register newUser1
				Dispatch.call(axe, "SubtestBegin", "newUser1", "Register new user", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "Register");
				Dispatch.call(axe, "StepBegin", "[]Register", "load.file(Register.xml)", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Data",  Dispatch.call(axe, "LoadFile", "Register.xml").toString());
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "[]Register", "set", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInitialise", Dispatch.call(axe, "GetRunCategoryOption", "webservice", "HarnessDemo"),  "Register", "http://www.odin.co.uk/webservices", Dispatch.get(axe, "Data").toString(), Dispatch.call(axe, "GetRunCategoryOptions", "namespace"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "username"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "password"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Name", "set", "Fred Jones");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Name", "Fred Jones");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "DOB", "set", "15/07/1972");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "DOB", "15/07/1972");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Email", "set", "fjones@test.com");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Email", "fjones@test.com");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Gender", "set", "Male");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Gender", "Male");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Title", "set", "Mr");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Title", "Mr");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "MailingList", "set", "false");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "MailingList", "false");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "[]Register", "invoke", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInvoke");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Result", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:RegisterResult"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Result", "val", "Fre150");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "Fre150", Dispatch.get(axe, "Value")));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");
				Dispatch.call(axe, "SubtestEnd");
// 
// 
            }
            catch(Exception ex)
            {
                Dispatch.call(axe, "StepInfo", ex.getMessage());
                Dispatch.call(axe, "TestAbort");
                return;
            }
            Dispatch.call(axe, "TestEnd");
        }
}
