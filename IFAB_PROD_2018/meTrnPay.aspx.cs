using System;

namespace RequestAndResponse
{
    public partial class meTrnPay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ltrPostData.Text = "<input type=\"hidden\" name=\"merchantRequest\" id=\"merchantRequest\" value=\"" + Session["Message"] + "\"     />		<input type=\"hidden\" name=\"MID\" id=\"MID\" value=" + Session["MID"] + " /> ";
            }
        }
    }
}