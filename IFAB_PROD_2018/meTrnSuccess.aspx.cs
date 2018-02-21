using com.awl.MerchantToolKit;
using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;
using Microsoft.Reporting.WebForms;
using System.Net;

namespace RequestAndResponse
{

    public partial class meTrnSuccess : System.Web.UI.Page
    {

        //    static string constr = ConfigurationManager.ConnectionStrings["Advant"].ConnectionString;
        //    SqlConnection con = new SqlConnection(constr);
        //    SqlCommand cmd = new SqlCommand("ConfigEmailNew");
        //    SqlDataAdapter sda = new SqlDataAdapter();
        //    cmd.CommandType = CommandType.StoredProcedure;
        //                            cmd.Parameters.AddWithValue("Office","I" );
        //                            cmd.Parameters.AddWithValue("@Branchcode",BranchCode );
        //                            cmd.Parameters.AddWithValue("@Buyerid", Buyerid);
        //                            cmd.Connection = con;
        //                            sda.SelectCommand = cmd;
        //                            SqlDataReader rd = cmd.ExecuteReader();
        //                            while (rd.Read())
        //                            {
        //                                String result = rd["EmailHost"].ToString();
        //} 
        //production key
        string key = "ca80f5570517c2dd18263fa7b8a4657f";
        //demo key
        //string key = "6375b97b954b37f956966977e5753ee6";
   ResMsgDTO objResMsgDTO = new ResMsgDTO();
        //public static string Invoice_NO { get; set; }
        //public static string Invoice_Amount { get; set; }
        //public static string Amount_Paid { get; set; }
        //public static string Pay_Mode { get; set; }
        //public static string BranchCode { get; set; }
        //public static string UserName { get; set; }
        //public static string StudentCode { get; set; }
        //public static string AuctionDate { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
       
            try
            {
                if (!IsPostBack)
                {
                    if (Request.Form["merchantResponse"] != null)
                    {
                         
        string merchantResponse = Request.Form["merchantResponse"];
                        AWLMEAPI transact = new AWLMEAPI();
                        objResMsgDTO = transact.parseTrnResMsg(merchantResponse, key);

                        txtAdd1.Text = objResMsgDTO.AddField1;
                        txtAdd2.Text = objResMsgDTO.AddField2;
                        txtAdd3.Text = objResMsgDTO.AddField3;
                        txtAdd4.Text = objResMsgDTO.AddField4;
                        txtAdd5.Text = objResMsgDTO.AddField5;
                        txtAdd6.Text = objResMsgDTO.AddField6;
                        txtAdd7.Text = objResMsgDTO.AddField7;
                        txtAdd8.Text = objResMsgDTO.AddField8;
                        txtAdd9.Text = objResMsgDTO.AddField9;
                        txtZcode.Text = objResMsgDTO.AuthZCode;
                        txtTransRefNo.Text = objResMsgDTO.PgMeTrnRefNo;

                        txtAmount.Text = (objResMsgDTO.TrnAmt);
                        txtDateTime.Text = objResMsgDTO.TrnReqDate;
                        txtRRN.Text = objResMsgDTO.Rrn;
                        txtOrderId.Text = objResMsgDTO.OrderId;
                        txtStatus.Text = objResMsgDTO.StatusCode;
                        txtDescription.Text = objResMsgDTO.StatusDesc;
                        txtResponseCode.Text = objResMsgDTO.ResponseCode;
                        string constr = ConfigurationManager.ConnectionStrings["Advant"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            SqlCommand cmd1 = new SqlCommand("Proc_InsertInvoice");
                            cmd1.CommandType = CommandType.StoredProcedure;
                            String Buyerid = Session["Buyerid"].ToString();
                            var Invoice_NO = Session["Invoice_NO"].ToString();
                            var Invoice_Amount = Session["Invoice_Amount"].ToString();
                            var BranchCode = Session["BranchCode"].ToString();
                            var Amount_Paid = Session["Amount_Paid"].ToString();
                            var UTR_NO = objResMsgDTO.PgMeTrnRefNo;
                            var UserName = Session["Username"].ToString();
                            var StudentCode = Session["StudentCode"].ToString();
                            var Pay_Mode = "debit card";
                            var Transactiondate = objResMsgDTO.TrnReqDate;
                            var AuctionDate = Session["AuctionDate"].ToString();
                            cmd1.Parameters.AddWithValue("@Buyer_id", Buyerid);
                            cmd1.Parameters.AddWithValue("@Invoice_NO", Invoice_NO);
                            cmd1.Parameters.AddWithValue("@Invoice_Amount", Invoice_Amount);
                            cmd1.Parameters.AddWithValue("@Amount_Paid", (Convert.ToDouble(Amount_Paid) / 100).ToString());
                            cmd1.Parameters.AddWithValue("@UTR_NO", UTR_NO);
                            cmd1.Parameters.AddWithValue("@Pay_Mode", Pay_Mode);
                            cmd1.Parameters.AddWithValue("@BranchCode", BranchCode);
                            cmd1.Parameters.AddWithValue("@UserCode", UserName);
                            cmd1.Parameters.AddWithValue("@Emp_Code", StudentCode);
                            cmd1.Parameters.AddWithValue("@TransactionDate", Transactiondate);
                            cmd1.Parameters.AddWithValue("@AuctionDate", AuctionDate);
                            cmd1.Connection = con;
                            con.Open();
                            cmd1.ExecuteNonQuery();
                            // display receipt
                            lbl_buyername.Text = Session["BuyerName"].ToString();
                            lbl_Invoiceno.Text = Invoice_NO;
                            lbl_Invoicedate.Text = Convert.ToDateTime(AuctionDate).ToString("dd-MMM-yyyy");
                            lbl_Amountreceived.Text = (Convert.ToDouble(Amount_Paid) / 100).ToString();
                            lbl_utr.Text = UTR_NO;
                            //lbl_paymode.Text = Pay_Mode;
                            lbl_paymentdate.Text = Convert.ToDateTime(Transactiondate).ToString("dd-MMM-yyyy");
                            SqlCommand cmd = new SqlCommand("ConfigEmailNew");
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("Office","I" );
                                cmd.Parameters.AddWithValue("@Branchcode",BranchCode );
                                cmd.Parameters.AddWithValue("@Buyerid", Buyerid);
                                cmd.Connection = con;
                                sda.SelectCommand = cmd;
                                SqlDataReader rd = cmd.ExecuteReader();
                                while (rd.Read())
                                {
                                    String result = rd["EmailHost"].ToString();
                                    String EmailPort = rd["EmailPort"].ToString();
                                    String EmailUserName = rd["EmailUserName"].ToString();
                                    String EmailPassword = rd["EmailPassword"].ToString();
                                    String EmailBody = rd["EmailBody"].ToString();
                                    String ToEmail = rd["ToEmail"].ToString();
                                    String TimeforSMS = rd["TimeforSMS"].ToString();
                                    String SMSStr1 = rd["SMS_String1"].ToString();
                                    String ToPhone = rd["ToPhone"].ToString();
                                    String SMSStr2 = rd["SMS_String2"].ToString();
                                    String SMSStr3 = rd["SMS_String3"].ToString();
                                    String SMSData ="Ifab Payment Receipt: "+ Environment.NewLine + "Invoice/Cash Bill No:" + lbl_Invoiceno.Text + Environment.NewLine + "Amount Received(INR):" + lbl_Amountreceived.Text + Environment.NewLine + "UTR No:" + lbl_utr.Text + Environment.NewLine + "Payment Date:" + lbl_paymentdate.Text;
                                    MailMessage mail = new MailMessage();
                                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                                    mail.From = new MailAddress(EmailUserName);
                                    mail.To.Add(ToEmail);
                                    mail.Subject = "Ifab Payment Receipt";
                                    mail.Body = "Invoice/Cash Bill No:"+lbl_Invoiceno.Text + Environment.NewLine + "Amount Received(INR):" + lbl_Amountreceived.Text + Environment.NewLine +"UTR No:" +lbl_utr.Text+ Environment.NewLine +"Payment Date:" +lbl_paymentdate.Text;
                                    SmtpServer.Port = Convert.ToInt16(EmailPort);
                                    SmtpServer.Credentials = new System.Net.NetworkCredential(EmailUserName, EmailPassword);
                                    SmtpServer.EnableSsl = true;
                                    String smsURL = SMSStr1 + ToPhone + SMSStr2 + SMSData + SMSStr3;
                                    WebRequest request = HttpWebRequest.Create(smsURL);
                                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                                    Stream s = (Stream)response.GetResponseStream();
                                    StreamReader readStream = new StreamReader(s);
                                    string dataString = readStream.ReadToEnd();
                                    response.Close();
                                    s.Close();
                                    readStream.Close();
                                    try
                                    {
                                        SmtpServer.Send(mail);
                                      
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.WriteLine("Exception caught in CreateTestMessage2(): {0}",
                                                    ex.ToString());
                                    }
                                }
                            }

                        }
                    }
                    else
                    {
                        //lblMessage.ForeColor = System.Drawing.Color.Red;
                        //lblMessage.Text = "No Data Can be Displayed......Session is Null";
                    }
                }
            }
            catch (Exception ex)
            {
                ClsLogging.writefileE("Error:" + ex.Message, ClsLogging.LogType.Worldline);
                ClsLogging.writefileE("Trace:" + ex.StackTrace, ClsLogging.LogType.Worldline);
                //lblMessage.ForeColor = System.Drawing.Color.Red;
                //lblMessage.Text = "There Was Some Error Processing.....Please Check The Data you have Entered";
            }
        }
    }
}