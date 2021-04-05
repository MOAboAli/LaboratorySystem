<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="InvoiceTests.aspx.cs" Inherits="Laboratory.Pages.Staff.Patients.InvoiceTests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
         <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Invoice  </h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <asp:Button ID="Buttongoback" runat="server" Text="GoBack Appointment"  CssClass="btn btn-success" OnClick="Buttongoback_Click"/>
            
                      <br />
                   <asp:Label ID="Labelid" runat="server" Text="0" Visible="false"></asp:Label>
                   <asp:Label ID="Labelstatus" runat="server" Text="" Visible="true"></asp:Label>
                      <br />
                  <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                         <asp:Label ID="Label4" runat="server" Text="Appointment No."></asp:Label>
                         <asp:Label ID="Labelappid" runat="server" Text=""></asp:Label>
                       </div>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                         <asp:Label ID="Label8" runat="server" Text="Appointment Date"></asp:Label>
                         <asp:Label ID="Labelappdate" runat="server" Text=""></asp:Label>
                       </div>                       
                  </div>
                      <br />
                  <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                         <asp:Label ID="Label1" runat="server" Text="Invoice No.:"></asp:Label>
                         <asp:Label ID="Labelinvoiceid" runat="server" Text=""></asp:Label>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                         <asp:Label ID="Label2" runat="server" Text="Date Of Invoice:"></asp:Label>
                         <asp:Label ID="Labelinvoicedate" runat="server" Text=""></asp:Label>
                       </div>
                  </div>
                      <br />
                  <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                         <asp:Label ID="Label3" runat="server" Text="Total Invoice:"></asp:Label>
                         <asp:Label ID="Labelinvoicetotal" runat="server" Text=""></asp:Label>
                       </div>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                         <asp:Label ID="Label5" runat="server" Text="Total Discounts:"></asp:Label>
                         <asp:Label ID="Labeldiscount" runat="server" Text=""></asp:Label>
                       </div>
                  </div>
                      <br />
                      <div class="row">
                       <div class="col-md-6 col-sm-6 col-xs-12">
                         <asp:Label ID="Label7" runat="server" Text="After Discount:"></asp:Label>
                         <asp:Label ID="Labelafterdiscount" runat="server" Text=""></asp:Label>
                       </div>
                       
                  </div>
                      <br />

                      <div class="row">
                         
                          <div class="col-md-12 col-sm-12 col-xs-12">
                              <center>
                                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Add Discount  </button>
                              </center>
                              </div>
                      </div>
                      <br />
                  </div>
                </div>
              </div>
         <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Invoice Detials <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content" style="overflow-x:auto;">
                      <asp:GridView ID="gridviewinvoicedetials" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                  <asp:TemplateField HeaderText="" >
                                                        <ItemTemplate>
                                                            <asp:Button Text="Discount" runat="server"  CssClass="btn btn-danger" CommandName='<%#Eval("ID") %>' OnClick="Buttondiscount_Click"  Visible="false"/>
                                                        </ItemTemplate>

                                                  
                                                    </asp:TemplateField> 
                                              
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
                  </div>
                </div>
              </div>
    </div>
    <div class="row">
         
          <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Discounts Detials <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <asp:GridView ID="gridviewdiscount" runat="server" CssClass="table table-striped table-bordered" BorderStyle="None" border="0" GridLines="None" ClientIDMode="Static"   >
                                             <Columns>
                                                  <asp:TemplateField HeaderText="" >
                                                        <ItemTemplate>
                                                            <asp:Button Text="Delete" runat="server" Visible="false" CssClass="btn btn-danger" CommandName='<%#Eval("ID") %>' OnClick="Buttondelete_Click" />
                                                        </ItemTemplate>

                                                  
                                                    </asp:TemplateField> 
                                              
                                                   
                                                 </Columns>
                             
                                        </asp:GridView>
                  </div>
                </div>
              </div>
          <div class="col-md-6 col-sm-6 col-xs-12">
                 <div class="x_panel">
                  <div class="x_title">
                    <h2>Paid <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    
                      <div class="col-md-12 col-sm-12 col-xs-12">
                          <center>
                     <asp:Button ID="Buttonpaid" runat="server" Text="Paid"  CssClass="btn btn-success"  OnClick="Buttonpaid_Click" Width="100px" />
                              <br />
                              <br />
                     <asp:Button ID="Buttonprint" runat="server" Text="Print"  CssClass="btn btn-success" OnClick="Buttonprint_Click"/>
            
                              </center>
                        </div>
                  </div>
                </div>
               </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
       <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" >
       <%--<asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
            <ContentTemplate>--%>
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Choose Test</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    
        <div class="row">
            Type:<asp:DropDownList ID="DropDownListdiscount" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
        </div>
          <br />
          <div class="row">
            Amount:<asp:TextBox ID="TextBoxamount" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
          <br />
           <div class="row">
            <asp:Button ID="Buttoninvoicediscount" runat="server" Text="Add Discount"  CssClass="btn btn-success" OnClick="Buttoninvoicediscount_Click"/>
            </div>
          <br />
      </div>
      <div class="modal-footer">
        <%--<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>--%>
          <%--<asp:Button ID="ButtonaddNote" runat="server" Text="Add" class="btn btn-primary" OnClick="addnote_Click"/>--%>
       
      </div>
    </div>
              <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
  </div>
</div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
