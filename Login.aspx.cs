using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Laboratory
{
    public partial class Login : System.Web.UI.Page
    {
        Laboratory.DAL.LabDataContext DB = new DAL.LabDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["ref"] == "logout")
                {
                    Session["UserID"] = "";
                    Session["UserName"] = "";
                    

                }
                else if (Request.QueryString["P"] != "" && Request.QueryString["P"] != null)
                {
                    Labelpageid.Text=Request.QueryString["P"];
                }
            }
           

        }

        protected void Buttonlogin_Click(object sender, EventArgs e)
        {
            LabelStatus.Text = "";
            var user = DB.Users.Where(a => a.UserName.Equals(TextBoxusername.Text) && a.Password.Equals(TextBoxpassword.Text));
            if(user.Count() >0)
            {
                var user1 = user.SingleOrDefault();
                Session.Add("UserID",user1.ID);
                Session.Add("UserName", user1.UserName);
                if (Labelpageid.Text == "0")
                {
                    Response.Redirect("~/Pages/Main/DashBoard.aspx");
                }
                else
                {
                    var pages1 = DB.Pages.Where(a => a.ID.Equals(Labelpageid.Text) && a.Active.Equals(true)).SingleOrDefault();
                    Response.Redirect("~" + pages1.PageURL);
                }

            }
            else
            {
                LabelStatus.Text = "UserName or Password is wrong, Please Try Again";
            }

        }
    }
}