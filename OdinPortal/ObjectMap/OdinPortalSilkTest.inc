[ ] const wMainWindow = Home
[ ] 
[-] window BrowserChild Home
	[ ]  tag "Odin Portal"
	[ ] parent Browser
	[ ] 
	[ ]  // The URL of this page
	[ ]  const sLocation = SYS_GetRegistryValue (HKEY_LOCAL_MACHINE, "Software\Odin Technology\Axe", "AXEDIR") + "samples/OdinPortal/html/index.html"
	[ ] 
	[ ]  // The login user name
	[ ]  // const sUserName = ?
	[ ] 
	[ ]  // The login password
	[ ]  // const sPassword = ?
	[ ] 
	[ ]  // The size of the browser window
	[ ]  // const POINT BrowserSize = {600, 400}
	[ ] 
	[ ]  // Sets the browser font settings to the default
	[ ]  // const bDefaultFont = TRUE
	[ ] 
	[-] HtmlLink MenuAccountDetails
		[ ] tag "~/Account Details"
	[-] HtmlLink MenuLogin
		[ ] tag "~/Login"
	[-] HtmlLink MenuRegister
		[ ] tag "~/Register"
	[-] HtmlLink MenuLinks
		[ ] tag "~/Links"
	[-] HtmlLink MenuLogout
		[ ] tag "~/Logout"
	[-] HtmlLink MenuUserDetails
		[ ] tag "~/User Details"
	[-] HtmlColumn Role
		[ ] tag "~/$role"
[-] window BrowserChild Login
	[ ] tag "Odin Portal - Login"
	[ ] parent Browser
	[-] HtmlTextField UserID
		[ ] tag "~/$TextBoxUserId"
	[-] HtmlText UserIDError
		[ ] tag "~/^Login[2]"
	[-] HtmlTextField Password
		[ ] tag "~/$TextBoxPassword"
	[-] HtmlPushButton Login
		[ ] tag "~/[HtmlPushButton]Login"
	[-] HtmlLink MenuHome
		[ ] tag "~/Home"
	[-] HtmlLink MenuRegister
		[ ] tag "~/Register"
[-] window BrowserChild Register
	[ ] tag "Odin Portal - Register"
	[ ] parent Browser
	[-] HtmlLink MenuHome
		[-] multitag "Home"
			[ ] "#1"
	[-] HtmlLink MenuLogin
		[-] multitag "Login"
			[ ] "#2"
	[-] HtmlPopupList Title
		[ ] tag "~/$title"
	[-] HtmlTextField Name
		[ ] tag "~/$TextBoxName"
	[-] HtmlRadioList Gender
		[ ] tag "~/$Sex"
	[-] HtmlRadioButton Male
		[-] Click()
			[ ] Register.Gender.Select("#1")
		[-] BOOLEAN GetIsSelected()
			[-] if(Register.Gender.GetSelIndex() == 1)
				[ ] return TRUE
			[-] else
				[ ] return FALSE
				[ ] 
	[-] HtmlRadioButton Female
		[-] Click()
			[ ] Register.Gender.Select("#2")
		[-] BOOLEAN GetIsSelected()
			[-] if(Register.Gender.GetSelIndex() == 2)
				[ ] return TRUE
			[-] else
				[ ] return FALSE
		[ ] 
	[-] HtmlTextField DOB
		[ ] tag "~/$DOB"
	[-] HtmlTextField Email
		[ ] tag "~/$email"
	[-] HtmlCheckBox MailingList
		[ ] tag "~/$MailingList"
	[-] HtmlLink Register
		[ ] tag "~/[HtmlLink]Register"
	[ ] 
[-] window BrowserChild RegisterSuccess
	[ ] tag "Odin Portal - Register Success"
	[ ] parent Browser
	[-] HtmlLink MenuHome
		[-] multitag "Home"
			[ ] "#1"
	[-] HtmlLink MenuLogin
		[-] multitag "Login"
			[ ] "#2"
	[-] HtmlText Password
		[ ] tag "~/[HtmlText]^Congratulations!"
	[ ] 
[-] window BrowserChild Logout
	[ ] tag "Odin Portal - Logout"
	[ ] parent Browser
	[ ] 
[-] window BrowserChild AccountDetails
	[ ] tag "Odin Portal - Account Details"
	[ ] parent Browser
	[-] HtmlHeading OdinPortal
		[ ] tag "Odin Portal"
	[-] HtmlLink MenuHome
		[ ] tag "#1"
	[-] HtmlLink MenuLinks
		[ ] tag "#2"
	[-] HtmlLink MenuLogout
		[-] multitag "Logout"
			[ ] "#3"
	[-] HtmlTable Details
		[ ] tag "~/[HtmlTable]$AccountDetails"
		[-] HtmlColumn Title
			[ ] tag "#2"
			[-] HtmlText Name
				[ ] tag "#1"
			[-] HtmlText Gender
				[ ] tag "#2"
			[-] HtmlText DOB
				[ ] tag "#3"
			[-] HtmlText Email
				[ ] tag "#4"
	[ ] 
[-] window BrowserChild UserDetails
	[ ] tag "Odin Portal - Users"
	[ ] parent Browser
	[-] HtmlLink MenuHome
		[-] multitag "Home"
			[ ] "#1"
	[-] HtmlLink MenuLogout
		[-] multitag "Logout"
			[ ] "#2"
	[-] HtmlTable UserTable
		[-] multitag "Users"
			[ ] "$Users"
		[-] HtmlColumn UserId
			[ ] tag "UserId"
		[-] HtmlColumn Title
			[ ] tag "Title"
		[-] HtmlColumn Name
			[ ] tag "Name"
		[-] HtmlColumn Gender
			[ ] tag "Gender"
		[-] HtmlColumn DateOfBirth
			[ ] tag "Date Of Birth"
	[-] HtmlText Total
		[ ] tag "~/[HtmlText]^Users"
		[-] STRING GetText()
			[ ] return GetField(derived::GetText(), " ", 3)
	[ ] 
[-] window BrowserChild Links
	[ ] tag "Odin Portal - Links"
	[ ] parent Browser
	[-] HtmlLink MenuHome
		[-] multitag "Home"
			[ ] "#1"
	[-] HtmlLink MenuAccountDetails
		[-] multitag "Account Details"
			[ ] "#3"
	[-] HtmlLink MenuLogout
		[-] multitag "Logout"
			[ ] "#6"
	[-] HtmlLink AddNewLink
		[-] multitag "Add a new link"
			[ ] "#7"
