using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Laboratory.DAL;

namespace Laboratory.Pages.Staff.Patients
{
    public partial class PatientPage : System.Web.UI.Page
    {
        DAL.LabDataContext DB = new DAL.LabDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dropdownlist();
                if (Request.QueryString["N"] != "" && Request.QueryString["N"] != null)
                {
                    getdata(Convert.ToInt32(Request.QueryString["N"]));
                }
                if (Labelid.Text !="0")
                {
                    gridbind();
                }
                else
                {
                    ButtonaddNote.Enabled = false;
                    Buttonmedical.Enabled = false;
                    Buttonnewapp.Enabled = false;
                }
            }
        }

        protected void getdata(int id)
        {
            var data = DB.patients.Where(a => a.ID.Equals(id)).SingleOrDefault();
            Labelid.Text = data.ID.ToString();
            TextBoxNationalID.Text = data.NationalID;
            TextBoxfullname.Text = data.FullName;
            DropDownListGender.SelectedValue = data.Gender.ToString();
            Textboxaddress.Text = data.Address;
            TextBoxbirthdate.Text = data.BirthDate.ToString();
            TextBoxmobile1.Text = data.Mobile1;
            TextBoxmobile2.Text = data.Mobile2;
            DropDownListcity.SelectedValue = data.City.ToString();
            DropDownListtown.SelectedValue = data.Town.ToString();
        }


        protected void Buttonadd_Click(object sender, EventArgs e)
        {
            if(Labelid.Text=="0")
            {
                patient data = new patient();
                data.NationalID=TextBoxNationalID.Text ;
                data.FullName=TextBoxfullname.Text ;
                data.Gender=Convert.ToByte( DropDownListGender.SelectedValue );
                data.Address=Textboxaddress.Text ;
                data.BirthDate=Convert.ToDateTime( TextBoxbirthdate.Text );
                data.Mobile1=TextBoxmobile1.Text ;
                data.Mobile2=TextBoxmobile2.Text  ;
                data.City=Convert.ToInt32( DropDownListcity.SelectedValue );
                data.Town=Convert.ToInt32( DropDownListtown.SelectedValue);
                data.UserID = Convert.ToInt32(Session["UserID"]);
                data.Rectime = DateTime.Now;
                DB.patients.InsertOnSubmit(data);
                DB.SubmitChanges();

                Response.Redirect("PatientPage.aspx?N=" + data.ID);
            }
            else
            {
                var data = DB.patients.Where(a => a.ID.Equals(Labelid.Text)).SingleOrDefault();
                data.NationalID = TextBoxNationalID.Text;
                data.FullName = TextBoxfullname.Text;
                data.Gender = Convert.ToByte(DropDownListGender.SelectedValue);
                data.Address = Textboxaddress.Text;
                data.BirthDate = Convert.ToDateTime(TextBoxbirthdate.Text);
                data.Mobile1 = TextBoxmobile1.Text;
                data.Mobile2 = TextBoxmobile2.Text;
                data.City = Convert.ToInt32(DropDownListcity.SelectedValue);
                data.Town = Convert.ToInt32(DropDownListtown.SelectedValue);
                data.LastModfiyUserID = Convert.ToInt32(Session["UserID"]) ;
                data.LastModfyRectime = DateTime.Now;
                
                DB.patients.DefaultIfEmpty(data);
                DB.SubmitChanges();
                Response.Redirect("PatientPage.aspx?N=" + data.ID);
            }
        }
        protected void addnote_Click(object sender, EventArgs e)
        {
            PatientNote Note = new PatientNote();
            Note.PatientID = Convert.ToInt32(Labelid.Text);
            Note.Note = TextBoxnote.Text;
            Note.Rectime = DateTime.Now;
            Note.UserID= Convert.ToInt32(Session["UserID"]);
            DB.PatientNotes.InsertOnSubmit(Note);
            DB.SubmitChanges();
            gridbindnote();
        }

        protected void addmedicalhistory_Click(object sender, EventArgs e)
        {
            MedicalHistory Note = new MedicalHistory();
            Note.PatientID = Convert.ToInt32(Labelid.Text);
            Note.Rectime = DateTime.Now;
            Note.UserID = Convert.ToInt32(Session["UserID"]);
            Note.MedicalHistoryTypeID = Convert.ToInt32(DropDownListmedicaltype.SelectedValue);
            Note.Name = TextBoxmedicalname.Text;
            Note.StartDate = Convert.ToDateTime(TextBoxstartdate.Text);
            if(TextBoxenddate.Text !="")
            {
                Note.EndDate = Convert.ToDateTime(TextBoxenddate.Text);
            }

            DB.MedicalHistories.InsertOnSubmit(Note);
            DB.SubmitChanges();
            gridbindmedicalhistory();
        }

        protected void dropdownlist()
        {
            DropDownListGender.DataSource = DB.Genders.Select(a => new {Name=a.Gender1 ,ID=a.ID});
            DropDownListGender.DataBind();

            DropDownListcity.DataSource = DB.Cities.Select(a => new { Name = a.City1, ID = a.ID });
            DropDownListcity.DataBind();

            DropDownListmedicaltype.DataSource = DB.MedicalHistoryTypes.Select(a => new { Name = a.TypeName, ID = a.ID });
            DropDownListmedicaltype.DataBind();
            towndropdownlist();
        }

        protected void towndropdownlist()
        {
            DropDownListtown.DataSource = DB.Towns.Where(a=>a.CityID.Equals(DropDownListcity.SelectedValue)).Select(a => new { Name = a.Town1, ID = a.ID });
            DropDownListtown.DataBind();
        }

        protected void DropDownListcity_SelectedIndexChanged(object sender, EventArgs e)
        {
            towndropdownlist();


        }


        protected void gridbind()
        {
            gridbindappoinment();
            gridbindmedicalhistory();
            gridbindnote();
        }

        protected void gridbindnote()
        {
            gridviewnotes.DataSource = DB.PatientNotes.Where(a => a.PatientID.Equals(Labelid.Text)).Select(a => new {a.Note,a.Rectime,User =DB.Users.Where(f=>f.UserID.Equals(a.UserID)).SingleOrDefault().UserName });
            gridviewnotes.DataBind();
        }

        protected void gridbindmedicalhistory()
        {
            gridviewmedical.DataSource = DB.MedicalHistories.Where(a => a.PatientID.Equals(Labelid.Text)).Select(a => new
            {
                Type=DB.MedicalHistoryTypes.Where(f=>f.ID.Equals(a.MedicalHistoryTypeID)).SingleOrDefault().TypeName,
                a.Name,
                a.Description,
                a.StartDate,
                a.EndDate,
                a.Rectime,
                User = DB.Users.Where(f => f.UserID.Equals(a.UserID)).SingleOrDefault().UserName
            });
            gridviewmedical.DataBind();
        }

        protected void gridbindappoinment()
        {
            gridviewappointment.DataSource = DB.AppointmentPatients.Where(a => a.PatientID.Equals(Labelid.Text)).Select(a => new {a.Date, Type = DB.AppointmentTypes.Where(f => f.ID.Equals(a.AppointmentType)).SingleOrDefault().AppointmentTypes,  User = DB.Users.Where(f => f.UserID.Equals(a.UserID)).SingleOrDefault().UserName,a.SampleTakeLater, a.Rectime, a.ID }).OrderByDescending(a=>a.Date);
            gridviewappointment.DataBind();
        }

        protected void Buttonopentest_Click(object sender, EventArgs e)
        {
            Button b1 = (Button)sender;
            var data2 = b1.CommandName;
            Response.Redirect("AppointmentPage.aspx?A=" + data2);
        }
        protected void Buttonnewapp_Click(object sender, EventArgs e)
        {
            Response.Redirect("AppointmentPage.aspx?N="+Labelid.Text);
        }
    }
}