using com.awl.MerchantToolKit;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;
using System.Windows.Forms;

public partial class Sendmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void a_Click(object sender, EventArgs e)
    {
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        mail.From = new MailAddress("flowerauctionbangalore@gmail.com");
        mail.To.Add("rkrohitkumar214@gmail.com");
        mail.Subject = "Test Mail";
        mail.Body = "This is for testing SMTP mail from GMAIL";

        SmtpServer.Port = 587;
        SmtpServer.Credentials = new System.Net.NetworkCredential("flowerauctionbangalore@gmail.com", "flower@123");
        SmtpServer.EnableSsl = true;

        SmtpServer.Send(mail);
        MessageBox.Show("mail Send");

    }
}