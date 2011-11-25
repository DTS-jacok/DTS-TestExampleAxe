// HDWS102
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:Tests HDWS102
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Variant;
import com.jacob.com.Dispatch;
public class HDWS102
{
        public static void main(String[] args)
        {
            ActiveXComponent axe = new ActiveXComponent("OdinTechnology.Axe.Runtime.Test");
            ActiveXComponent harness = new ActiveXComponent("OdinTechnology.Axe.Harness.AxeHarnessAPI");
            Dispatch.call(axe, "InitSuite", "C:\\AXE_Projects\\HarnessDemo\\HarnessDemo.tpj", "debug");
            Dispatch.call(harness, "SetSettings", Dispatch.call(axe, "GetRunCategoryOptions", "AxeHarness"));
			Dispatch.call(axe, "TestBegin", "HDWS102" ,"Simple web service with template", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "Tests", "C:/AXE_Projects/HarnessDemo/results/debug/results.xml","");
			try
			{
// 
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:Register newUser2
				Dispatch.call(axe, "SubtestBegin", "newUser2", "Register new user", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "Register");
				Dispatch.call(axe, "StepBegin", "[]Register", "load.file(Register.xml)", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Data",  Dispatch.call(axe, "LoadFile", "Register.xml").toString());
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "[]Register", "set", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInitialise", Dispatch.call(axe, "GetRunCategoryOption", "webservice", "HarnessDemo"),  "Register", "http://www.odin.co.uk/webservices", Dispatch.get(axe, "Data").toString(), Dispatch.call(axe, "GetRunCategoryOptions", "namespace"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "username"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "password"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Name", "set", "Belinda Green");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Name", "Belinda Green");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "DOB", "set", "03/08/1980");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "DOB", "03/08/1980");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Email", "set", "b.green@testing.com");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Email", "b.green@testing.com");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Gender", "set", "Female");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Gender", "Female");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Title", "set", "Mrs");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Title", "Mrs");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "MailingList", "set", "true");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "MailingList", "true");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "[]Register", "invoke", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInvoke");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Result", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:RegisterResult"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Result", "val", "Bel030");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "Bel030", Dispatch.get(axe, "Value")));
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
