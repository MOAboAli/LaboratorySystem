<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="AppointmentPage.aspx.cs" Inherits="Laboratory.Pages.Staff.Patients.AppointmentPage" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Appointment Main Information <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   <asp:Label ID="Labelid" runat="server" Text="0" Visible="false"></asp:Label>
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Label ID="Label1" runat="server" Text="Patient ID"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-9">
                               
                               <asp:Label ID="Labelidpatient" runat="server" Text="0"></asp:Label>
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label2" runat="server" Text="Patient Name"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                              <asp:TextBox ID="TextBoxPatientname" runat="server" CssClass="form-control"></asp:TextBox>
                           </div>
                       </div>
                   </div>
                      <br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Label ID="Label3" runat="server" Text="Appoinment Type"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-9">
                               
                                <asp:DropDownList ID="DropDownListAppoinmentType" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID" ></asp:DropDownList>
                       
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label5" runat="server" Text="Date"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                             <div class='input-group date' id='myDatepicker'>
                                 <asp:TextBox ID="TextBoxdate" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                   <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-calendar"></span>
                                     </span>
                               </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="TextBoxdate" ValidationGroup="add"></asp:RequiredFieldValidator>
                        
                           </div>
                       </div>
                   </div>
                      <br /><br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Label ID="Label4" runat="server" Text="Samples Take Later"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-9">
                               <asp:CheckBox ID="CheckBoxlater" runat="server" />
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label7" runat="server" Text="Date Later"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                              <div class='input-group date' id='myDatepicker2'>
                                 <asp:TextBox ID="TextBox1datelater" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                   <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-calendar"></span>
                                     </span>
                               </div>
                           </div>
                       </div>
                   </div>
                      <br />
                    <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Label ID="Label6" runat="server" Text="Address To Take"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-9">
                               <asp:TextBox ID="TextBoxaddres" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-4">
                               <asp:Label ID="Label8" runat="server" Text="Note"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-8">
                               <asp:TextBox ID="TextBoxNote" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="MultiLine" Height="100px"></asp:TextBox>
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
                    <h2>Patient Tests For this Appointment <small></small></h2>
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
                                <%--<button type = "button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add Test</button>--%>
                               <asp:Button ID="Buttonchoosetest" runat="server" Text="Choose Test" CssClass="btn btn-primary" OnClick="Buttonchoosetest_Click" />
                               <asp:Label ID="Labelstatusinvoice" runat="server" Text=""></asp:Label>
                           </div>
                       </div>
                      </div>
                      <br />

                      <div class="row" style="overflow-x:auto;overflow-y:auto;">
                               <asp:GridView ID="gridviewtestchoosen" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                  <asp:TemplateField HeaderText="" >
                                                        <ItemTemplate>
                                                            <asp:Button Text="Delete" runat="server"  CssClass="btn btn-danger" CommandName='<%#Eval("ID") %>' OnClick="Buttondeletetest_Click" />
                                                        </ItemTemplate>

                                                  
                                                    </asp:TemplateField> 
                                              
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
                      </div>
                      <br /> <br />
                      <div class="row">
                          <center>
                          <div class="col-md-12 col-sm-12 col-xs-12">
                              <asp:Button ID="Buttoninvoice" runat="server" Text="Go To Invoice" CssClass="btn btn-primary" OnClick="ButtonInvoice_Click" />
                          </div>
                           </center>
                      </div>

                      </div>
                    </div>
             </div>
          </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">

     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg" role="document" >
       <%--<asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
            <ContentTemplate>--%>
    <div class="modal-content" style="overflow-x:auto;overflow-y:auto;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Choose Test</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    
         <%-- <div class="form-group">
             
               <div class="col-md-6 col-sm-6 col-xs-6">
                    <asp:Label ID="Label9" runat="server" Text="Code"></asp:Label>

              <asp:TextBox ID="TextBoxtestCode" runat="server" CssClass="form-control" ></asp:TextBox>

               </div>
              <div class="col-md-6 col-sm-6 col-xs-6">
                   <asp:Label ID="Label10" runat="server" Text="Name"></asp:Label>

              <asp:TextBox ID="TextBoxtestname" runat="server" CssClass="form-control" ></asp:TextBox>

               </div>
            </div>
          <br /><br /> <br />
          <div class="form-group">
              <div class="col-md-6 col-sm-6 col-xs-6" >
                     <asp:Button ID="Buttonsearchtest" runat="server" Text="Search" CssClass="btn btn-success pull-right" OnClick="Buttonsearchtest_Click" ValidationGroup="Search" />
                          
               </div>
              <div class="col-md-6 col-sm-6 col-xs-6">
                   <asp:Button ID="ButtonLoadAll" runat="server" Text="Load ALL" CssClass="btn btn-primary" OnClick="ButtonLoadAll_Click" ValidationGroup="Load ALL Tests" />
              </div>
          </div>
  <br /><br /> <br />--%>
           <div class="form-group">
              <div class="col-md-12 col-sm-12 col-xs-6">
                    <asp:GridView ID="datatablebuttons" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                    <asp:TemplateField HeaderText="" >
                                                        <ItemTemplate>
                                                            <asp:Button Text="ADD" runat="server"  CssClass="btn btn-warning" CommandName='<%#Eval("ID") %>' OnClick="Buttonaddtest_Click" />
                                                        </ItemTemplate>

                                                  
                                                    </asp:TemplateField>
                                              
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
               </div>
          </div>
      </div>
      <div class="modal-footer">
        <%--<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>--%>
          <%--<asp:Button ID="ButtonaddNote" runat="server" Text="Add" class="btn btn-primary" OnClick="addnote_Click"/>--%>
        <asp:Button ID="ButtonaddClose" runat="server" Text="Close" class="btn btn-primary" OnClick="addclose_Click"/>
      </div>
    </div>
              <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
  </div>
</div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script>
         $('#myDatepicker').datetimepicker({
             //format: 'MM/DD/YYYY HH:MM:SS'
         });
         $('#myDatepicker2').datetimepicker({
             //format: 'MM/DD/YYYY HH:MM:SS'
         });

        $(document).ready(function() {
    
     

    $('#datatablebuttons thead tr').clone(true).appendTo( '#datatablebuttons thead' );
    $('#datatablebuttons thead tr:eq(1) th').each( function (i) {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
 
        $( 'input', this ).on( 'keyup change', function () {
            if ( table.column(i).search() !== this.value ) {
                table
                    .column(i)
                    .search( this.value )
                    .draw();
            }
        } );
    } );

       
    var table = $('#datatablebuttons').DataTable({
        buttons: [{extend: 'csv'}],
        orderCellsTop: true,
        fixedHeader: false,
        retrieve: true,
        destroy: true,
        searching: true
     });

   
} );
    </script>
   
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
