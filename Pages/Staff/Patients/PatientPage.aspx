<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="PatientPage.aspx.cs" Inherits="Laboratory.Pages.Staff.Patients.PatientPage" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Patient Main Information <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-9">
                               
                               <asp:Label ID="Labelid" runat="server" Text="0"></asp:Label>
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label2" runat="server" Text="NationalID"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                              <asp:TextBox ID="TextBoxNationalID" runat="server" CssClass="form-control"></asp:TextBox>
                           </div>
                       </div>
                   </div>
                      <br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label4" runat="server" Text="Full Name"></asp:Label>
                           </div>
                         
                           <div class="col-md-7 col-sm-7 col-xs-8">
                              <asp:TextBox ID="TextBoxfullname" runat="server" CssClass="form-control"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="TextBoxfullname" ValidationGroup="add"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label11" runat="server" Text="Gender"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                               <asp:DropDownList ID="DropDownListGender" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID" ></asp:DropDownList>
                           </div>
                       </div>
                   </div>
                      <br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label5" runat="server" Text="Mobile1"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                               
                               <asp:TextBox ID="TextBoxmobile1" runat="server" CssClass="form-control"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="TextBoxmobile1" ValidationGroup="add"></asp:RequiredFieldValidator>
                          
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label7" runat="server" Text="mobile2"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                              <asp:TextBox ID="TextBoxmobile2" runat="server" CssClass="form-control"></asp:TextBox>
                           </div>
                       </div>
                   </div>
                      <br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label6" runat="server" Text="BirthDate"></asp:Label>
                           </div>
                            <div class="col-md-7 col-sm-7 col-xs-8">
                               <div class='input-group date' id='myDatepicker'>
                                 <asp:TextBox ID="TextBoxbirthdate" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                  
                                     <span class="input-group-addon">
                               <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                                   
                        </div>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="TextBoxbirthdate" ValidationGroup="add"></asp:RequiredFieldValidator>
                        
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label8" runat="server" Text="City"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                               <asp:DropDownList ID="DropDownListcity" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownListcity_SelectedIndexChanged"></asp:DropDownList>
                           </div>
                       </div>
                   </div>
                      <br />
                   <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label9" runat="server" Text="Town"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                               <asp:DropDownList ID="DropDownListtown" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label10" runat="server" Text="Address"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                               <asp:TextBox ID="Textboxaddress" runat="server" CssClass="form-control"></asp:TextBox>
                           </div>
                       </div>
                   </div>
                      <br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                              
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-7">
                               
                               
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Button ID="Buttonsadd" runat="server" Text="ADD" CssClass="btn btn-success" OnClick="Buttonadd_Click" ValidationGroup="add" />
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-7">
                             
                           </div>
                       </div>
                   </div>
                      
                  </div>
                </div>
              </div>
    </div>

      <div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Patient Notes <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-md-6 col-sm-6 col-xs-12">
                          
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                              
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                                <button type = "button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add Notes</button>
                           </div>
                       </div>
                      </div>
                      <br />

                      <div class="row" style="overflow-x:auto;overflow-y:auto;">
                               <asp:GridView ID="gridviewnotes" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                   
                                              
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
                      </div>
                      <br />

                      </div>
                    </div>
             </div>
          </div>

      <div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Patient Medical History <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-md-6 col-sm-6 col-xs-12">
                          
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                              
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                                <button type = "button" class="btn btn-primary" data-toggle="modal" data-target="#ModalMedicalhistroy" data-whatever="@mdo">Add Medical History</button>
                           </div>
                       </div>
                      </div>
                      <br />

                      <div class="row" style="overflow-x:auto;overflow-y:auto;">
                               <asp:GridView ID="gridviewmedical" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                   
                                              
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
                      </div>
                      <br />

                      </div>
                    </div>
             </div>
          </div>

     <div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> Appointments<small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-md-6 col-sm-6 col-xs-12">
                          
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                              
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                               <asp:Button ID="Buttonnewapp" runat="server" Text="New Appointment "  class="btn btn-primary" OnClick="Buttonnewapp_Click"/>
                            </div>
                       </div>
                      </div>
                      <br />

                      <div class="row" style="overflow-x:auto;overflow-y:auto;">
                               <asp:GridView ID="gridviewappointment" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                   
                                               <asp:TemplateField HeaderText="" >
                                                        <ItemTemplate>
                                                            <asp:Button Text="Open" runat="server"  CssClass="btn btn-primary" CommandName='<%#Eval("ID") %>' OnClick="Buttonopentest_Click" />
                                                        </ItemTemplate>

                                                  
                                                    </asp:TemplateField>
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
                      </div>
                      <br />

                      </div>
                    </div>
             </div>
          </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
   
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Note</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Note:</label>

              <asp:TextBox ID="TextBoxnote" runat="server" CssClass="form-control" TextMode="MultiLine" Height="200px"></asp:TextBox>


            </div>
          <div class="form-group">
           
          </div>
  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <asp:Button ID="ButtonaddNote" runat="server" Text="Add" class="btn btn-primary" OnClick="addnote_Click"/>
        
      </div>
    </div>
  </div>
</div>

      <div class="modal fade" id="ModalMedicalhistroy" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="labelmedical">Medical History</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    
          <div class="form-group">
           <label>Meical Type</label>
              <asp:DropDownList ID="DropDownListmedicaltype" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
          </div>

           <div class="form-group">
           <label>Name</label>
              <asp:TextBox ID="TextBoxmedicalname" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="TextBoxmedicalname" ValidationGroup="medical"></asp:RequiredFieldValidator>
                         </div>

          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Decription:</label>

              <asp:TextBox ID="TextBoxdesc" runat="server" CssClass="form-control" TextMode="MultiLine" Height="200px"></asp:TextBox>


            </div>
          <div class="form-group">
           <label>Start Date</label>
             
                <div class='input-group date' id='startDatepicker'>
                                 <asp:TextBox ID="TextBoxstartdate" runat="server" CssClass="form-control"></asp:TextBox> 
                                     <span class="input-group-addon">
                               <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                                   
                        </div>
          </div>
           <div class="form-group">
           <label>End Date</label>
               <div class='input-group date' id='EndDatepicker'>
                                 <asp:TextBox ID="TextBoxenddate" runat="server" CssClass="form-control"></asp:TextBox>
              
                                     <span class="input-group-addon">
                               <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                                   
                        </div>
          </div>
  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <asp:Button ID="Buttonmedical" runat="server" Text="Add" class="btn btn-primary" OnClick="addmedicalhistory_Click" ValidationGroup="medical"/>
        
      </div>
    </div>
  </div>
</div>
   </asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script>
         $('#myDatepicker').datetimepicker({
             format: 'MM/DD/YYYY'
         });
         $('#startDatepicker').datetimepicker({
             format: 'MM/DD/YYYY'
         });
         $('#EndDatepicker').datetimepicker({
             format: 'MM/DD/YYYY'
         });

         
         $('#gridviewnotes thead tr').clone(true).appendTo('#gridviewnotes thead');
         $('#gridviewnotes thead tr:eq(1) th').each(function (i) {
             var title = $(this).text();
             $(this).html('<input type="text" placeholder="Search ' + title + '" />');

             $('input', this).on('keyup change', function () {
                 if (table.column(i).search() !== this.value) {
                     table
                         .column(i)
                         .search(this.value)
                         .draw();
                 }
             });
         });


         var table = $('#gridviewnotes').DataTable({
             buttons: [{ extend: 'csv' }],
             orderCellsTop: true,
             fixedHeader: true,
             retrieve: true,
             destroy: true,
             searching: true
         });

         $('#gridviewmedical thead tr').clone(true).appendTo('#gridviewmedical thead');
         $('#gridviewmedical thead tr:eq(1) th').each(function (i) {
             var title = $(this).text();
             $(this).html('<input type="text" placeholder="Search ' + title + '" />');

             $('input', this).on('keyup change', function () {
                 if (table.column(i).search() !== this.value) {
                     table
                         .column(i)
                         .search(this.value)
                         .draw();
                 }
             });
         });


         var table = $('#gridviewmedical').DataTable({
             buttons: [{ extend: 'csv' }],
             orderCellsTop: true,
             fixedHeader: true,
             retrieve: true,
             destroy: true,
             searching: true
         });

         $('#gridviewappointment thead tr').clone(true).appendTo('#gridviewappointment thead');
         $('#gridviewappointment thead tr:eq(1) th').each(function (i) {
             var title = $(this).text();
             $(this).html('<input type="text" placeholder="Search ' + title + '" />');

             $('input', this).on('keyup change', function () {
                 if (table.column(i).search() !== this.value) {
                     table
                         .column(i)
                         .search(this.value)
                         .draw();
                 }
             });
         });


         var table = $('#gridviewappointment').DataTable({
             buttons: [{ extend: 'csv' }],
             orderCellsTop: true,
             fixedHeader: true,
             retrieve: true,
             destroy: true,
             searching: true
         });
         </script>
</asp:Content>
