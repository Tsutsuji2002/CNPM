using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FindingJobWeb.Models
{
    public class ContactMessage
    {
        FJWebDataContext db = new FJWebDataContext();

        public int iID { get; set; }
        public string sName { get; set; }
        public string sEmail { get; set; }
        public string sSubject { get; set; }
        public string sMessage { get; set; }

        public ContactMessage(int ID)
        {
            iID = ID;
            Contact cm = db.Contacts.Single(n => n.ContactID == iID);
            sName = cm.Name;
            sEmail = cm.Email;
            sSubject = cm.Subject;
            sMessage = cm.Message;
        }

    }
}