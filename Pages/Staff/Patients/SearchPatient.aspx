<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="SearchPatient.aspx.cs" Inherits="Laboratory.Pages.Staff.Patients.SearchPatient"  MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Search <small>Patient</small></h2>
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
                          <div class="col-md-9 col-sm-9 col-xs-0">

                          </div>
                           <div class="col-md-3 col-sm-3 col-xs-12">
                                 <asp:Button ID="Buttonnew" runat="server" Text="New Patient" CssClass="btn btn-block" OnClick="Buttonnew_Click" />
                          </div>
                      </div>
                    <br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Label ID="Label1" runat="server" Text="Mobile"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-7">
                               
                               <asp:TextBox ID="TextBoxmobile" runat="server" CssClass="form-control"></asp:TextBox>
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Label ID="Label2" runat="server" Text="FullName"></asp:Label>
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-7">
                              <asp:TextBox ID="TextBoxfullname" runat="server" CssClass="form-control"></asp:TextBox>
                           </div>
                       </div>
                   </div>
                      <br />
                   <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                              <asp:Label ID="Label3" runat="server" Text="ID"></asp:Label>
                           
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-7">
                               
                                <asp:TextBox ID="TextBoxID" runat="server" CssClass="form-control"></asp:TextBox>
                          
                           </div>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <div class="col-md-3 col-sm-3 col-xs-3">
                               <asp:Button ID="Buttonsearch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="Buttonsearch_Click" />
                           </div>
                           <div class="col-md-7 col-sm-7 col-xs-7">
                              <asp:Button ID="Buttonall" runat="server" Text="Load All Patients" CssClass="btn btn-primary" OnClick="Buttonall_Click" />
                          
                           </div>
                       </div>
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
                    <h2>Show <small>Data</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content" style="overflow-x:auto;">
               <asp:GridView ID="datatablebuttons" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                    <asp:TemplateField HeaderText="" >
                                                        <ItemTemplate>
                                                            <asp:Button Text="View" runat="server"  CssClass="btn btn-warning" CommandName='<%#Eval("ID") %>' OnClick="Buttonview_Click" />
                                                        </ItemTemplate>

                                                  
                                                    </asp:TemplateField>
                                              
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
                  </div>
                </div>
              </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script>
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
        fixedHeader: true,
        retrieve: true,
        destroy: true,
        searching: true
     });

   
} );
    </script>
</asp:Content>
