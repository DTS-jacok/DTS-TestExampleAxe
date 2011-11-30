package helpers;

import com.rational.test.ft.object.interfaces.BrowserTestObject;
import com.rational.test.ft.object.interfaces.GuiTestObject;
import com.rational.test.ft.object.interfaces.TestObject;
import com.rational.test.ft.script.RationalTestScript;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Variant;
import com.jacob.com.Dispatch;


public abstract class OdinPortalLib extends AxeMain
{
	 public static void MyEditSet(BrowserTestObject activeBrowser, GuiTestObject editField, String value)
     {
		 editField.click();
		 activeBrowser.inputChars(value);
     }
	 
	 public static String MyObjectExists(TestObject testObject)
     {
		 String value = new Boolean(testObject.exists()).toString();		 
		 value = value.substring(0, 1).toUpperCase() + value.substring(1).toLowerCase();
		 return value;
     }
	 
	 public static int MyValidateLength(String expected, String actual)
     {
		 logInfo(actual + " " + actual.length());
         String actualLength = Integer.toString(actual.length());      
         return Dispatch.call(axe, "StepValidateEqual", expected, actualLength).getInt();
     }
}
