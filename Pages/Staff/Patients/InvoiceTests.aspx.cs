using Laboratory.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratory.Pages.Staff.Patients
{
    public partial class InvoiceTests : System.Web.UI.Page
    {
        LabDataContext DB = new LabDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["A"] != "" && Request.QueryString["A"] != null)
                {
                    checkdata(Request.QueryString["A"].ToString());
                }
                else
                {

                }
            }
        }

        protected void checkdata(string idapp)
        {
            Buttoninvoicediscount.Enabled = true;
            Buttonpaid.Enabled = true;
            Labelid.Text = idapp;
            var data = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(idapp));
            if (data.Count() > 0)
            {
                var invoice = data.SingleOrDefault();
                if (invoice.Paid == false)
                {
                    var appointment = DB.AppointmentPatients.Where(a => a.ID.Equals(idapp)).SingleOrDefault();
                    var appointmentdetials = DB.AppointmentPatientDetials.Where(a => a.AppointmentID.Equals(appointment.ID));

                    foreach (var d in appointmentdetials)
                    {
                        var invoicedetialdata = DB.InvoiceDetials.Where(a => a.InvoiceID.Equals(invoice.ID) && a.AppointDetialsID.Equals(d.ID));
                        if (invoicedetialdata.Count() == 0)
                        {
                            var test = DB.Tests.Where(a => a.ID.Equals(d.TestID)).SingleOrDefault();
                            InvoiceDetial invd = new InvoiceDetial();
                            invd.AppointDetialsID = d.ID;
                            invd.Date = DateTime.Now;
                            invd.Discount = 0;
                            invd.DiscountPercentage = 0;
                            invd.InvoiceDetials = "InvoicebyTest";
                            invd.InvoiceID = invoice.ID;
                            if (d.IsDeleted == false)
                            {
                                invd.Price = test.Price;
                                invd.PriceAfterDiscount = test.Price;
                                invd.IsActive = true;
                            }
                            else
                            {
                                invd.Price = 0;
                                invd.PriceAfterDiscount = 0;
                                invd.IsActive = false;
                            }
                            invd.Rectime = DateTime.Now;
                            invd.UserID = Convert.ToInt32(Session["UserID"]);

                            DB.InvoiceDetials.InsertOnSubmit(invd);
                            DB.SubmitChanges();
                        }
                        else
                        {
                            var invd = invoicedetialdata.SingleOrDefault();
                            if (d.IsDeleted == true)

                            {

                                invd.IsActive = false;
                                invd.Note = "Delted on " + DateTime.Now;
                                invd.Note = invd.Note + "  by  " + Convert.ToInt32(Session["UserID"]);
                            }


                            DB.InvoiceDetials.DefaultIfEmpty(invd);
                            DB.SubmitChanges();

                        }
                    }
                }
                else
                {
                    Labelstatus.Text = "this invoice Already Paid, you can't edit";
                    Labelstatus.ForeColor= System.Drawing.Color.Red;
                    Buttoninvoicediscount.Enabled = false;
                    Buttonpaid.Enabled = false;
                }
            }
            else
            {
                var appointment = DB.AppointmentPatients.Where(a => a.ID.Equals(idapp)).SingleOrDefault();
                var appointmentdetials = DB.AppointmentPatientDetials.Where(a => a.AppointmentID.Equals(appointment.ID));

                decimal totalprice = 0;
                foreach (var d in appointmentdetials.Where(a=>a.IsDeleted.Equals(false)) )
                {
                    var test = DB.Tests.Where(a => a.ID.Equals(d.TestID)).SingleOrDefault();
                    totalprice = totalprice + Convert.ToDecimal(test.Price);
                }
                Invoice inv = new Invoice();
                inv.Active = true;
                inv.AppointmentID = appointment.ID;
                inv.InvoiceName = "InvoiceTests";
                inv.Paid = false;
                inv.Rectime = DateTime.Now;
                inv.TotalInvoice = totalprice;
                inv.TotalInvoiceAfterDiscount = totalprice;
                inv.UserID = Convert.ToInt32(Session["UserID"]);
                inv.Discount = 0;
                inv.Date = DateTime.Now;

                DB.Invoices.InsertOnSubmit(inv);
                DB.SubmitChanges();

                foreach (var d in appointmentdetials)
                {
                    var test = DB.Tests.Where(a => a.ID.Equals(d.TestID)).SingleOrDefault();
                    InvoiceDetial invd = new InvoiceDetial();
                    invd.AppointDetialsID = d.ID;
                    invd.Date = DateTime.Now;
                    invd.Discount = 0;
                    invd.DiscountPercentage = 0;
                    invd.InvoiceDetials = "InvoicebyTest";
                    invd.InvoiceID = inv.ID;
                    if (d.IsDeleted == false)
                    {
                        invd.Price = test.Price;
                        invd.PriceAfterDiscount = test.Price;
                        invd.IsActive = true;
                    }
                    else {
                        invd.Price = 0;
                        invd.PriceAfterDiscount = 0;
                        invd.IsActive = false;
                        invd.Rectime = DateTime.Now;
                        invd.UserID = Convert.ToInt32(Session["UserID"]);
                    }
                  

                    DB.InvoiceDetials.InsertOnSubmit(invd);
                    DB.SubmitChanges();

                }
            }

            databind();
        }

        protected void databind()
        {
            DropDownListdiscount.DataSource = DB.Discounts.Select(a => new {ID=a.ID,Name=a.DiscountName });
            DropDownListdiscount.DataBind();
            adjusttotal();
            var invoice = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(Labelid.Text)).SingleOrDefault();
            var appointment = DB.AppointmentPatients.Where(a => a.ID.Equals(invoice.ID)).SingleOrDefault();
            Labelinvoicedate.Text = invoice.Date.ToString();
            Labelinvoiceid.Text = invoice.ID.ToString();
            Labelinvoicetotal.Text = invoice.TotalInvoice.ToString();
            Labeldiscount.Text = invoice.Discount.ToString();
            Labelafterdiscount.Text = invoice.TotalInvoiceAfterDiscount.ToString();
            Labelappid.Text = appointment.ID.ToString();
            Labelappdate.Text = appointment.Date.ToString();

            gridbinddetials();
            gridbinddiscountbind();
        }

        protected void gridbinddetials()
        {
            var invoice = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(Labelid.Text)).SingleOrDefault();
            gridviewinvoicedetials.DataSource = from d in DB.InvoiceDetials.Where(a => a.IsActive.Equals(true) && a.InvoiceID.Equals(invoice.ID))
                                                join a in DB.AppointmentPatientDetials on d.AppointDetialsID equals a.ID
                                                join t in DB.Tests on a.TestID equals t.ID
                                                select (new {t.TestName,t.TestNameAR,TestPrice=t.Price,InvoicePrice=d.Price,ID=d.ID });
            gridviewinvoicedetials.DataBind();

        }
        protected void gridbinddiscountbind()
        {
            var invoice = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(Labelid.Text)).SingleOrDefault();
            gridviewdiscount.DataSource = from i in DB.InvoiceDiscounts.Where(a => a.IsActive.Equals(true) && a.InvoiceID.Equals(invoice.ID))
                                          join d in DB.Discounts on i.DiscountTypeID equals d.ID
                                          select (new
                                          {
                                              d.DiscountName,
                                              Type=d.type==true?"Amount":"Percentage",
                                              Amount=  d.Amount,
                                              AfterCal=i.DiscountAmount,
                                              i.ID
                                          });
                                                
            gridviewdiscount.DataBind();

        }
        protected void adjusttotal()
        {
            var invoice = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(Labelid.Text)).SingleOrDefault();
            var invoicedetialdata = DB.InvoiceDetials.Where(a => a.InvoiceID.Equals(invoice.ID) && a.IsActive.Equals(true));
            decimal price = 0;
            decimal afterdiscount = 0;
            foreach (var detials in invoicedetialdata)
            {
                price =Convert.ToDecimal( price + detials.Price);
                afterdiscount = Convert.ToDecimal(afterdiscount + detials.PriceAfterDiscount);

            }

            var discounts = DB.InvoiceDiscounts.Where(a => a.InvoiceID.Equals(invoice.ID) && a.InvoicedetialsID.Equals(0));
           foreach(var discount in discounts)
            {
                afterdiscount =Convert.ToDecimal( afterdiscount - discount.DiscountAmount);
            }
            invoice.TotalInvoice = price;
            invoice.TotalInvoiceAfterDiscount = afterdiscount;
            invoice.Discount = price - afterdiscount;
            DB.Invoices.DefaultIfEmpty(invoice);
            DB.SubmitChanges();

       }

        protected void Buttondiscount_Click(object sender, EventArgs e)
        {

        }

        protected void Buttondelete_Click(object sender, EventArgs e)
        {

        }

        protected void Buttoninvoicediscount_Click(object sender, EventArgs e)
        {
            var discount = DB.Discounts.Where(a => a.ID.Equals(DropDownListdiscount.SelectedValue)).SingleOrDefault();
            var invoice = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(Labelid.Text)).SingleOrDefault();
            decimal amount = 0;

            if (discount.type == true)
            {
                
                if (TextBoxamount.Text == "")
                {
                    amount =Convert.ToDecimal( discount.Amount);
                }
                else
                {
                    amount = Convert.ToDecimal(TextBoxamount.Text);
                }


            }
            else
            {
                decimal percentage = 0;
                if (TextBoxamount.Text == "")
                {
                    percentage = Convert.ToDecimal(discount.Amount);
                }
                else
                {
                    percentage = Convert.ToDecimal(TextBoxamount.Text);
                }

                amount = Convert.ToDecimal((invoice.TotalInvoice * percentage) / 100);
            }

            InvoiceDiscount invdis = new InvoiceDiscount();
            invdis.DiscountAmount = amount;
            invdis.DiscountTypeID = discount.ID;
            invdis.InvoicedetialsID = 0;
            invdis.InvoiceID = invoice.ID;
            invdis.IsActive = true;
            invdis.Rectime = DateTime.Now;
            invdis.UserID = Convert.ToInt32(Session["UserID"]);
            DB.InvoiceDiscounts.InsertOnSubmit(invdis);
            DB.SubmitChanges();

            databind();
        }

        protected void Buttonpaid_Click(object sender, EventArgs e)
        {
            var invoice = DB.Invoices.Where(a => a.Active.Equals(true) && a.AppointmentID.Equals(Labelid.Text)).SingleOrDefault();
            invoice.Paid = true;
            invoice.Note = "Paid by " + Session["UserID"].ToString() + "  on " + DateTime.Now;
            DB.Invoices.DefaultIfEmpty(invoice);
            DB.SubmitChanges();
            Labelstatus.Text = "this invoice Already Paid, you can't edit";
            Labelstatus.ForeColor = System.Drawing.Color.Red;
            Buttoninvoicediscount.Enabled = false;
            Buttonpaid.Enabled = false;
        }

        protected void Buttongoback_Click(object sender, EventArgs e)
        {
            Response.Redirect("AppointmentPage.aspx?A="+Labelid.Text);

        }

        protected void Buttonprint_Click(object sender, EventArgs e)
        {
            Response.Redirect("InvoicePrint.aspx?I=" + Labelid.Text);

        }
    }
}