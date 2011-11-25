<%@ WebService Language="C#" Class="HarnessDemo" %>

using System;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;

[WebService(Namespace="http://www.odin.co.uk/webservices", Description="Sample Web Services")]

public class HarnessDemo : System.Web.Services.WebService
{
	public struct UserDetails
	{
		public string Title;
		public string Name;
		public string Gender;
		public string DOB;
		public string Email;
        public bool MailingList;
	}	

	[WebMethod(Description="Get user account details")]
    public UserDetails GetUserDetails(string Id)
	{
        UserDetails user = new UserDetails();
		
		switch(Id)
		{
			case "j.smith@testing.com":
                user.Title = "Mr";
                user.Name = "John Smith";
                user.Gender = "Male";
                user.DOB = "03/12/1970";
                user.Email = Id;
                user.MailingList = false;	
				break;	
		}
        return user;
	}

	[WebMethod(Description="Register user")]
	public string Register(string title, string name, string gender, string DOB, string email, bool receiveInfo)
	{
        if (title == "" || name == "" || gender == "" || DOB == "" || email == "")
            return "Invalid input";
        else
            return name.Substring(0, 3) + DOB.Replace("/", "").Substring(0, 3);
	}

    [WebMethod(Description="Add two integers")]
    public int AddInt(int FirstNumber, int SecondNumber)
    {
        return FirstNumber + SecondNumber;
    }

}
