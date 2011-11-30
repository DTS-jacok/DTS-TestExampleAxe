[ ] // (c)2008-2009 Odin Technology Ltd. All rights reserved.
[ ] // OdinPortalLib
[ ] // Sample custom function library for Axe OdinPortal demo application
[ ] 
[-] int MyTextFieldSet(anytype textField, string text)
	[ ] textField.ClearText()
	[ ] textField.TypeKeys (text)
	[ ] return 0
	[ ] 
[-] string  MyElementExists(anytype element)
	[-] if element.Exists() == TRUE
		[ ] return "True"
	[-] else
		[ ] return "False"
[ ] 
[-] int MyValidateLength(string object, int expectedLength, string actualString)
	[ ] int result
	[-] if expectedLength == Len(actualString)
		[ ] result = 0
	[-] else
		[ ] result = 1
	[ ] return AxeStepValidateResult(object, Str(expectedLength), Str(Len(actualString)), result, FALSE)
