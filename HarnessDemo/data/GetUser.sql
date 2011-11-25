select Email, Format(DOB, 'dd/mm/yyyy') as DateOfBirth, Title, Name, Gender, MailingList from User where Email = '%UserID%'

