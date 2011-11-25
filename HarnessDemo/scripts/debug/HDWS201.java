// HDWS201
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:Tests HDWS201
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Variant;
import com.jacob.com.Dispatch;
public class HDWS201
{
        public static void main(String[] args)
        {
            ActiveXComponent axe = new ActiveXComponent("OdinTechnology.Axe.Runtime.Test");
            ActiveXComponent harness = new ActiveXComponent("OdinTechnology.Axe.Harness.AxeHarnessAPI");
            Dispatch.call(axe, "InitSuite", "C:\\AXE_Projects\\HarnessDemo\\HarnessDemo.tpj", "debug");
            Dispatch.call(harness, "SetSettings", Dispatch.call(axe, "GetRunCategoryOptions", "AxeHarness"));
			Dispatch.call(axe, "TestBegin", "HDWS201" ,"Web service with multiple values in response", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "Tests", "C:/AXE_Projects/HarnessDemo/results/debug/results.xml","");
			try
			{
// 
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:GetUserDetails checkDetails
				Dispatch.call(axe, "SubtestBegin", "checkDetails", "Validate all user details", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "GetUserDetails");
				Dispatch.call(axe, "StepBegin", "[]GetUserDetails", "set", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInitialise", Dispatch.call(axe, "GetRunCategoryOption", "webservice", "HarnessDemo"),  "GetUserDetails", "http://www.odin.co.uk/webservices", "", Dispatch.call(axe, "GetRunCategoryOptions", "namespace"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "username"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "password"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Id", "set", "j.smith@testing.com");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "Id", "j.smith@testing.com");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "[]GetUserDetails", "invoke", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInvoke");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Email", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:Email"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Email", "val", "j.smith@testing.com");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "j.smith@testing.com", Dispatch.get(axe, "Value")));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");
				Dispatch.call(axe, "StepBegin", "DOB", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:DOB"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "DOB", "val", "03/12/1970");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "03/12/1970", Dispatch.get(axe, "Value")));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");
				Dispatch.call(axe, "StepBegin", "Gender", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:Gender"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Gender", "val", "Male");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "Male", Dispatch.get(axe, "Value")));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");
				Dispatch.call(axe, "StepBegin", "MailingList", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:MailingList"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "MailingList", "val", "false");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "false", Dispatch.get(axe, "Value")));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");
				Dispatch.call(axe, "StepBegin", "Name", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:Name"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Name", "val", "John Smith");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "John Smith", Dispatch.get(axe, "Value")));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");
				Dispatch.call(axe, "StepBegin", "Title", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:Title"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Title", "val", "Mr");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "Mr", Dispatch.get(axe, "Value")));
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
