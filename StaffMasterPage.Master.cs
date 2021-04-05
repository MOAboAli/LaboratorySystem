using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratory
{
    public partial class StaffMasterPage : System.Web.UI.MasterPage
    {
        Laboratory.DAL.LabDataContext DB = new DAL.LabDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CheckPage();
            }
        }


        protected void CheckPage()
        {
            string Pagename = "";
            string raw1 = System.IO.Path.GetFileName(this.Page.Request.RawUrl);
          
            
                if (raw1.Contains("?"))
                {
                    Pagename = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
                }
                else
                {
                    Pagename = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
                }


            var pages1 = DB.Pages.Where(a => a.PageName.Equals(Pagename) && a.Active.Equals(true));
            if (Session["UserID"] != "" && Session["UserID"] != null)
            {
                if (pages1.Count() > 0)
                {
                    var auth = DB.PageUsers.Where(a => a.Active.Equals(true) && a.UserID.Equals(Session["UserID"]) && a.PageID.Equals(pages1.SingleOrDefault().ID));
                    if (auth.Count() > 0)
                    {
                        Labeltextpage.Text = pages1.SingleOrDefault().PageText;
                    }
                    else
                    {
                        var exp = new Exception();
                        throw new System.Exception("You Are Not Authroizaed for this page", exp);
                    }
                }
                else
                {
                    var exp = new Exception();
                    throw new System.Exception("Requested Page Not Found", exp);
                }



                LeftMenuRepeater.DataSource = from m in DB.Modules.Where(m => m.Active.Equals(true) && m.Isshow.Equals(true))
                                              join u in DB.ModuleUsers.Where(u => u.Active.Equals(true) && u.UserID.Equals(Session["UserID"])) on m.ID equals u.ModuleID
                                              select (new { SubModuleId = m.ID, SubModuleName = m.ModuleName });
                LeftMenuRepeater.DataBind();
            }
            else
            {
                Response.Redirect("/Login.aspx?P=" +pages1.SingleOrDefault().ID);
            }

            
        }

        public void ItemBound(object sender, RepeaterItemEventArgs args)
        {



            //int submoduleID = (int)(Eval("SubModuleId"));
            //Label label1 = (Label) (rep.FindControl("Label1"));


            if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
            {
                string customerId = (args.Item.FindControl("hfCustomerId") as HiddenField).Value;

                Repeater childRepeater = (Repeater)args.Item.FindControl("InsideMenuRepeater");
                
                
                    var page1 = from m in DB.Pages.Where(m => m.Active.Equals(true) && m.ModuleID.Equals(customerId) && m.Show.Equals(true))
                                join u in DB.PageUsers.Where(u => u.Active.Equals(true) && u.UserID.Equals(Session["UserID"])) on m.ID equals u.PageID
                                select (new { DisplayName = m.PageText, PageURL = m.PageURL });
                childRepeater.DataSource = page1;
                
                
                    

                childRepeater.DataBind();
            }
        }


    }
}