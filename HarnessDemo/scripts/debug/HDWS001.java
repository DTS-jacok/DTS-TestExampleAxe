// HDWS001
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:Tests HDWS001
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Variant;
import com.jacob.com.Dispatch;
public class HDWS001
{
        public static void main(String[] args)
        {
            ActiveXComponent axe = new ActiveXComponent("OdinTechnology.Axe.Runtime.Test");
            ActiveXComponent harness = new ActiveXComponent("OdinTechnology.Axe.Harness.AxeHarnessAPI");
            Dispatch.call(axe, "InitSuite", "C:\\AXE_Projects\\HarnessDemo\\HarnessDemo.tpj", "debug");
            Dispatch.call(harness, "SetSettings", Dispatch.call(axe, "GetRunCategoryOptions", "AxeHarness"));
			Dispatch.call(axe, "TestBegin", "HDWS001" ,"Simple web service without template", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "Tests", "C:/AXE_Projects/HarnessDemo/results/debug/results.xml","");
			try
			{
// 
// C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml:Add lowNumbers
				Dispatch.call(axe, "SubtestBegin", "lowNumbers", "Add two numbers", "C:/AXE_Projects/HarnessDemo/data/WebServiceTests.xml", "Add");
				Dispatch.call(axe, "StepBegin", "[]AddService", "set", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInitialise", Dispatch.call(axe, "GetRunCategoryOption", "webservice", "HarnessDemo"),  "AddInt", "http://www.odin.co.uk/webservices", "", Dispatch.call(axe, "GetRunCategoryOptions", "namespace"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "username"), Dispatch.call(axe, "GetRunCategoryOptionProperty", "webservice", "HarnessDemo", "password"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "FirstNumber", "set", "2");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "FirstNumber", "2");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "SecondNumber", "set", "3");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsSetParameter", "SecondNumber", "3");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "[]AddService", "invoke", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.call(harness, "WsInvoke");
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Result", "get", "");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "Value", Dispatch.call(harness, "WsGetResponseNodeText", "//default:AddIntResult"));
				Dispatch.call(axe, "StepEnd", Dispatch.get(axe, "ResultCode"), "");

				Dispatch.call(axe, "StepBegin", "Result", "val", "5");  Dispatch.put(axe, "ResultCode", 0);
				Dispatch.put(axe, "ResultCode", Dispatch.call(axe, "StepValidateEqual", "5", Dispatch.get(axe, "Value")));
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
