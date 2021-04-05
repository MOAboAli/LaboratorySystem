using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Laboratory.DAL;

namespace Laboratory.Pages.Staff.Patients
{
    public partial class AppointmentPage : System.Web.UI.Page
    {
        LabDataContext DB = new LabDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropdownlist();
                if (Request.QueryString["N"] != "" && Request.QueryString["N"] != null)
                {
                    var patient = DB.patients.Where(a => a.ID.Equals(Request.QueryString["N"])).SingleOrDefault();
                    Labelidpatient.Text = patient.ID.ToString();
                    TextBoxPatientname.Text = patient.FullName;
                    TextBoxdate.Text = Convert.ToString(DateTime.Now);
                    TextBoxaddres.Text = "In Lab";
                    TextBox1datelater.Text = Convert.ToString(DateTime.Now);
                    Buttonsadd.Text = "ADD";
                    Buttonchoosetest.Enabled = false;
                    Buttoninvoice.Enabled = false;

                }
                else if (Request.QueryString["A"] != "" && Request.QueryString["A"] != null)
                {
                    var app = DB.AppointmentPatients.Where(a => a.ID.Equals(Request.QueryString["A"])).SingleOrDefault();
                    Labelid.Text = app.ID.ToString();
                    var patient = DB.patients.Where(a => a.ID.Equals(app.PatientID)).SingleOrDefault();
                    Labelidpatient.Text = patient.ID.ToString();
                    TextBoxPatientname.Text = patient.FullName;
                    databind();
                    Buttonsadd.Text = "Edit";
                    gridviewtestchoosenbind();
                }
                else
                {
                    Response.Redirect("SearchPatient.aspx");
                }
            }
        }

        protected void databind()
        {
            var app = DB.AppointmentPatients.Where(a => a.ID.Equals(Request.QueryString["A"])).SingleOrDefault();
            var data = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(app.ID));
            if (data.Count() > 0)
            {
                var invoice = data.SingleOrDefault();
                if (invoice.Paid == true) {
                    Labelstatusinvoice.Text = "this invoice Already Paid, you can't edit";
                    Labelstatusinvoice.ForeColor = System.Drawing.Color.Red;
                    Buttonchoosetest.Enabled = false;

                }
             }

                    TextBoxdate.Text = Convert.ToString(app.Date);
            TextBoxaddres.Text = app.Address;
            TextBox1datelater.Text = Convert.ToString(app.DateToTakeSample);
            DropDownListAppoinmentType.SelectedValue = app.AppointmentType.ToString();
            CheckBoxlater.Checked = Convert.ToBoolean(app.SampleTakeLater);
        }


        protected void Buttonadd_Click(object sender, EventArgs e)
        {
            if (Labelid.Text == "0")
            {
                AppointmentPatient data = new AppointmentPatient();
                data.Address = TextBoxaddres.Text;
                data.AppointmentType = Convert.ToInt16(DropDownListAppoinmentType.SelectedValue);
                data.Date = Convert.ToDateTime(TextBoxdate.Text);
                data.DateToTakeSample = Convert.ToDateTime(TextBox1datelater.Text);
                data.SampleTakeLater = CheckBoxlater.Checked;
                data.Rectime = DateTime.Now;
                data.UserID = Convert.ToInt32(Session["UserID"]);
                data.PatientID = Convert.ToInt32(Labelidpatient.Text);
                DB.AppointmentPatients.InsertOnSubmit(data);
                DB.SubmitChanges();
                Buttonchoosetest.Enabled = true;
                Buttoninvoice.Enabled = true;
                Labelid.Text = data.ID.ToString();
                Response.Redirect("AppointmentPage.aspx?A=" + data.ID);
            }
            else
            {
                var data = DB.AppointmentPatients.Where(a => a.ID.Equals(Labelid.Text)).SingleOrDefault();

                data.Address = TextBoxaddres.Text;
                data.AppointmentType = Convert.ToInt16(DropDownListAppoinmentType.SelectedValue);
                data.Date = Convert.ToDateTime(TextBoxdate.Text);
                data.DateToTakeSample = Convert.ToDateTime(TextBox1datelater.Text);
                data.SampleTakeLater = CheckBoxlater.Checked;
                data.LastUpdatedate = DateTime.Now;
                data.LastUpdateUser = Convert.ToInt32(Session["UserID"]);

                DB.AppointmentPatients.DefaultIfEmpty(data);
                DB.SubmitChanges();
                Buttonchoosetest.Enabled = true;
                Buttoninvoice.Enabled = true;
            }
        }

        public void dropdownlist()
        {
            DropDownListAppoinmentType.DataSource = DB.AppointmentTypes.Select(a => new { a.ID, Name = a.AppointmentTypes });
            DropDownListAppoinmentType.DataBind();
        }

        public void gridbindtest()
        {
            datatablebuttons.Visible = true;
            datatablebuttons.DataSource = from t in DB.Tests
                                          join ty in DB.TestsTypes on t.TestType equals ty.ID
                                          select (new { t.TestCode, t.TestName, t.TestNameAR, ty.Type, t.TestRequiremnts, t.Price, t.TestInternalCode, t.ID });
            datatablebuttons.DataBind();
            datatablebuttons.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void Buttonaddtest_Click(object sender, EventArgs e)
        {
            datatablebuttons.DataSource = null;
            datatablebuttons.DataBind();
            datatablebuttons.Visible = false;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "exampleModal", "$('#exampleModal').modal('hide');", true);
            //upModal.Update();

            Button b1 = (Button)sender;
            var data2 = b1.CommandName;

            AppointmentPatientDetial data = new AppointmentPatientDetial();
            data.AppointmentID = Convert.ToInt32(Labelid.Text);
            data.DateTakeSample = Convert.ToDateTime(TextBox1datelater.Text);
            data.IsDeleted = false;
            data.Note = TextBoxNote.Text;
            data.Paid = false;
            data.Rectime = DateTime.Now;
            data.SampleTakeLater = CheckBoxlater.Checked;
            data.TestID = Convert.ToInt32(data2);
            data.UserID = Convert.ToInt32(Session["UserID"]);

            DB.AppointmentPatientDetials.InsertOnSubmit(data);
            DB.SubmitChanges();

            gridviewtestchoosenbind();
            //upModal.Update();
        }

        public void gridviewtestchoosenbind()
        {
            gridviewtestchoosen.DataSource = from d in DB.AppointmentPatientDetials.Where(a => a.AppointmentID.Equals(Labelid.Text) && a.IsDeleted.Equals(false))
                                             join t in DB.Tests on d.TestID equals t.ID
                                             select (new { d.ID, t.TestCode, t.TestName, t.TestNameAR, t.TestRequiremnts, t.Price, d.DateTakeSample, d.SampleTakeLater, d.Paid });
            gridviewtestchoosen.DataBind();
        }

        protected void Buttondeletetest_Click(object sender, EventArgs e)
        {
            Button b1 = (Button)sender;
            var data2 = b1.CommandName;

            var data = DB.AppointmentPatientDetials.Where(a => a.ID.Equals(data2)).SingleOrDefault();
            data.IsDeleted = true;
            data.LastUpdatedate = DateTime.Now;
            data.LastUpdateUser = Convert.ToInt32(Session["UserID"]);

            DB.AppointmentPatientDetials.DefaultIfEmpty(data);
            DB.SubmitChanges();

            gridviewtestchoosenbind();


        }
        protected void addclose_Click(object sender, EventArgs e)
        {
            datatablebuttons.DataSource = null;
            datatablebuttons.DataBind();
            datatablebuttons.Visible = false;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "exampleModal", "$('#exampleModal').modal('hide');", true);
            //upModal.Update();
        }
        protected void Buttonchoosetest_Click(object sender, EventArgs e)
        {
            gridbindtest();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "exampleModal", "$('#exampleModal').modal();", true);
            // upModal.Update();
        }


        protected void ButtonInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("InvoiceTests.aspx?A="+Labelid.Text);
        }
    }
}