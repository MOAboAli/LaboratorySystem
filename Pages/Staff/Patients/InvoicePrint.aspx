<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoicePrint.aspx.cs" Inherits="Laboratory.Pages.Staff.Patients.InvoicePrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" href="images/favicon.ico" type="image/ico" />
    <title>InvoicePrint</title>
    
   

	
   <!-- <link href="<%= Page.ResolveUrl("~/Style/gentelella-master/gentelella-master/build/css/custom.min.css")%>" rel="stylesheet"/>-->
    
    <link href="/Style/gentelella-master/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!-- NProgress -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/nprogress/nprogress.css" rel="stylesheet"/>
    <!-- iCheck -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/iCheck/skins/flat/green.css" rel="stylesheet"/>
	<!-- bootstrap-progressbar -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet"/>
    <!-- JQVMap -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"/>
    <link href="/Style/gentelella-master/gentelella-master/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet"/>
    <link href="/Style/gentelella-master/gentelella-master/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print"/>
    <!-- bootstrap-wysiwyg -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet"/>
    <!-- Select2 -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/select2/dist/css/select2.min.css" rel="stylesheet" />
    <!-- Switchery -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/switchery/dist/switchery.min.css" rel="stylesheet"/>
    <!-- starrr -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/starrr/dist/starrr.css" rel="stylesheet"/>
    <link href="/Style/gentelella-master/gentelella-master/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"/>
    <!-- bootstrap-datetimepicker -->
    <link href="/Style/gentelella-master/gentelella-master/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet"/>
    <link href="/Style/gentelella-master/gentelella-master/vendors/google-code-prettify/prettify.min.css" rel="stylesheet"/>
    
  

    <link href="/Style/gentelella-master/gentelella-master/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet"/>
    <link href="/Style/gentelella-master/gentelella-master/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print"/>
    <!-- Custom Theme Style -->
    <link href="/Style/ComingSoon/animate.css" rel="stylesheet" type="text/css"/>

     <link href="/Style/ComingSoon/util.css" rel="stylesheet" type="text/css"/>
    
    <link href="/Style/ComingSoon/main.css" rel="stylesheet" type="text/css"/>

	
    <link href="/Style/gentelella-master/gentelella-master/build/css/custom.min.css" rel="stylesheet"/>


    <style>

        @media print{
            .container{
                width:100%;
            }
        }

        body{
            background-color:white;
        }
    </style>
    
    

     <script src="/Style/gentelella-master/gentelella-master/vendors/moment/min/moment.min.js"></script>
            
       
   
    <script src="/Style/gentelella-master/gentelella-master/vendors/jquery/dist/jquery.min.js"></script>
      <script src="/Style/gentelella-master/gentelella-master/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
      <div class="row">
          <%--<div class="col-sm-1 "></div>--%>
              <div class="col-md-12">
                <div class="">
                  <div class="x_title">
                    <h2>  <small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                     
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <section class="content invoice">
                      <!-- title row -->
                      <div class="row">
                        <div class="col-xs-12 invoice-header">
                          <h1>
                                          <i class="fa fa-globe"></i> Invoice.
                                          <small class="pull-right">Date: <asp:Label ID="Labeldate" runat="server" Text=""></asp:Label></small>
                                      </h1>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- info row -->
                      <div class="row invoice-info">
                        <div class="col-sm-6 invoice-col">
                          From
                          <address>
                                          <strong>Lab</strong>
                                          <br/>Main Street ,AlKatmayah
                                          <br/>New Cairo,Cairo
                                          <br/>Phone: 00000
                                          <br/>Email:test@test.com
                                      </address>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6 invoice-col">
                          To
                          <address>
                                          <strong><asp:Label ID="LabelClientname" runat="server" Text=""></asp:Label></strong>
                                          <br/><asp:Label ID="Labeladdress1" runat="server" Text=""></asp:Label>
                                          <br/><asp:Label ID="Labeladdress2" runat="server" Text=""></asp:Label>
                                          <br/>Phone: <asp:Label ID="Labelphone" runat="server" Text=""></asp:Label>
                                          <br/>ID: <asp:Label ID="LabelID" runat="server" Text=""></asp:Label>
                                      </address>
                        </div>
                        <!-- /.col -->
                        
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <!-- Table row -->
                      <div class="row">
                        <div class="col-xs-12 ">
                             <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered"></asp:GridView>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <div class="row">
                        <!-- accepted payments column -->
                        <div class="col-xs-6">
                          <div class="">
                          <b>Invoice #<asp:Label ID="LabelinvoiceId" runat="server" Text=""></asp:Label></b>
                          
                          <br/>
                          <b>Invoice Date:</b> <asp:Label ID="Labelpaiddate" runat="server" Text=""></asp:Label>
                          <br/>
                          
                        </div>
                         
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-6">
                          <p class="lead">Amount </p>
                          <div class="table-responsive">
                            <table class="table">
                              <tbody>
                               <tr>
                                  <th>TotalBeforeDiscount:</th>
                                  <td> <asp:Label ID="Labelbeforediscount" runat="server" Text=""></asp:Label></td>
                                </tr>
                                   <tr>
                                  <th>Discount:</th>
                                  <td> <asp:Label ID="Labeldiscount" runat="server" Text=""></asp:Label></td>
                                </tr>
                               <tr>
                                  <th>Total:</th>
                                  <td> <asp:Label ID="Labelafterdiscount" runat="server" Text=""></asp:Label></td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <!-- this row will not appear when printing -->
                      
                    </section>
                  </div>
                </div>
              </div>
           <%--<div class="col-sm-1 no-print"></div>--%>
            </div>
    </form>
</body>
</html>
