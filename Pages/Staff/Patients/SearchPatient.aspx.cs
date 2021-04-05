using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratory.Pages.Staff.Patients
{
    public partial class SearchPatient : System.Web.UI.Page
    {
        DAL.LabDataContext DB = new DAL.LabDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
            }
            if(datatablebuttons.Rows.Count !=0)
            {
                
            }
        }

        protected void Buttonsearch_Click(object sender, EventArgs e)
        {
            if (TextBoxfullname.Text != "" || TextBoxmobile.Text != "")
            {
                if (TextBoxfullname.Text != "" && TextBoxmobile.Text != "")
                {
                    datatablebuttons.DataSource = DB.patients.Where(a => a.FullName.Contains(TextBoxfullname.Text) && (a.Mobile1.Contains(TextBoxmobile.Text) || a.Mobile2.Contains(TextBoxmobile.Text))
                ).Select(a => new { a.ID, a.FullName, a.Mobile1, a.Mobile2, a.NationalID, a.BirthDate });
                }
                else if (TextBoxfullname.Text != "")
                {
                    datatablebuttons.DataSource = DB.patients.Where(a => a.FullName.Contains(TextBoxfullname.Text)).Select(a => new { a.ID, a.FullName, a.Mobile1, a.Mobile2, a.NationalID, a.BirthDate });
                }
                else if (TextBoxmobile.Text != "")
                {
                    datatablebuttons.DataSource = DB.patients.Where(a => a.Mobile1.Contains(TextBoxmobile.Text) || a.Mobile2.Contains(TextBoxmobile.Text)
                ).Select(a => new { a.ID, a.FullName, a.Mobile1, a.Mobile2, a.NationalID, a.BirthDate });
                }


                datatablebuttons.DataBind();
                datatablebuttons.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            else
            {
                if (TextBoxID.Text != "")
                {
                    datatablebuttons.DataSource = DB.patients.Where(a => a.ID.Equals(TextBoxID.Text)).Select(a => new { a.ID, a.FullName, a.Mobile1, a.Mobile2, a.NationalID, a.BirthDate });
                    datatablebuttons.DataBind();
                    datatablebuttons.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

            }

        }

        protected void Buttonall_Click(object sender, EventArgs e)
        {
            gridbind();
        }

        protected void Buttonview_Click(object sender, EventArgs e)
        {
            Button b1 = (Button)sender;
            var data = b1.CommandName;
            Response.Redirect("PatientPage.aspx?N=" + data);

        }

        protected void Buttonnew_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientPage.aspx");
        }

        protected void gridbind()
        {
            datatablebuttons.DataSource = DB.patients.Select(a=> new {a.ID,a.FullName,a.Mobile1,a.Mobile2, a.NationalID, a.BirthDate });
            datatablebuttons.DataBind();
            datatablebuttons.HeaderRow.TableSection = TableRowSection.TableHeader;

        }
    }
}