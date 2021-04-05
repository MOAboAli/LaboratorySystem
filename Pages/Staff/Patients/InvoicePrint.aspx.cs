using Laboratory.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratory.Pages.Staff.Patients
{
    public partial class InvoicePrint : System.Web.UI.Page
    {
        LabDataContext DB = new LabDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["I"] != "" && Request.QueryString["I"] != null)
            {
                getdata(Request.QueryString["I"].ToString());
            }
            else
            {
                LabelClientname.Text = "No ID";
                LabelClientname.ForeColor = System.Drawing.Color.Red;

            }
        }

        protected void getdata(string id)
        {
            var data = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(id));
            if (data.Count() > 0)
            {
                var invoice = data.SingleOrDefault();
                if (invoice.Paid == true)
                {
                     var appointment = DB.AppointmentPatients.Where(a => a.ID.Equals(id)).SingleOrDefault();
                    Labelpaiddate.Text = invoice.Date.ToString();
                    LabelinvoiceId.Text = invoice.ID.ToString();
                    Labelbeforediscount.Text = invoice.TotalInvoice.ToString();
                    Labeldiscount.Text = invoice.Discount.ToString();
                    Labelafterdiscount.Text = invoice.TotalInvoiceAfterDiscount.ToString();

                   
                    gridbinddetials(id);

                    var patient = DB.patients.Where(a => a.ID.Equals(appointment.PatientID)).SingleOrDefault();
                    var address = patient.Address.Split(' ');
                    int count = 0;
                    foreach(var address1 in address)
                    {
                        count++;
                        if (count < address.Count() / 2)
                        {
                            Labeladdress1.Text = Labeladdress1.Text +" "+address1;
                        }
                        else
                        {
                            Labeladdress2.Text = Labeladdress2.Text + " " + address1;
                        }

                        
                    }

                    LabelClientname.Text = patient.FullName;
                    Labeldate.Text = DateTime.Now.ToString();
                    LabelID.Text = patient.ID.ToString();
                    Labelphone.Text = patient.Mobile1;
                    
                }
                else
                {
                    LabelClientname.Text = "Invoice Not Paid";
                    LabelClientname.ForeColor = System.Drawing.Color.Red;

                }
            }
        }

        protected void gridbinddetials(string id )
        {
            var invoice = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(id)).SingleOrDefault();
            GridView1.DataSource = from d in DB.InvoiceDetials.Where(a => a.IsActive.Equals(true) && a.InvoiceID.Equals(invoice.ID))
                                                join a in DB.AppointmentPatientDetials on d.AppointDetialsID equals a.ID
                                                join t in DB.Tests on a.TestID equals t.ID
                                                select (new { t.TestName, t.TestNameAR, TestPrice = t.Price, InvoicePrice = d.Price, ID = d.ID });
            GridView1.DataBind();

        }

      
    }
}