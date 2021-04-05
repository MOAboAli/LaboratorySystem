<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Laboratory.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>The One And Only</title>
    <link href="<%= Page.ResolveUrl("~/Style/gentelella-master/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css")%>" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="<%= Page.ResolveUrl("~/Style/gentelella-master/gentelella-master/vendors/font-awesome/css/font-awesome.min.css")%>" rel="stylesheet"/>
    <!-- NProgress -->
    <link href="<%= Page.ResolveUrl("~/Style/gentelella-master/gentelella-master/vendors/nprogress/nprogress.css")%>" rel="stylesheet"/>
    <link href="<%= Page.ResolveUrl("~/Style/gentelella-master/gentelella-master/vendors/animate.css/animate.min.css")%>" rel="stylesheet"/>
    <link href="<%= Page.ResolveUrl("~/Style/gentelella-master/gentelella-master/build/css/custom.min.css")%>" rel="stylesheet"/>

      <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>--%>
    <script src="../../../../Style/ComingSoon/jquery-3.2.1.min.js"></script>
      
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <%--<script src="../../../../Style/ComingSoon/bootstrap.min.js"></script>--%>

    <style>
        .body {
        background-position:top left; 
        background-image: url(/Style/Images/lab.jpg);
        background-repeat: no-repeat;
        background-size: 110% ;
        }
          
       
        .login_content{
            text-shadow:none;
            
        }

        /*.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6{
            color:white;
        }*/
        .card {
            background-color:white;
              opacity: 0.9;
              filter: alpha(opacity=50); /* For IE8 and earlier */
              padding:10px;
               border-radius: 5px;
            }


        
    </style>

    <script >

        $(document).ready(function () {
            $('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
        });
        


        function closeForm() {
          document.getElementById("myForm").style.display = "none";
        }
    </script>


</head>
<body class="login body">
    <form id="form1" runat="server">
        <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>
            <br />   <br />
            <div class="col-lg-5 col-sm-12 col-xs-12">
                 
      <div class="login_wrapper">
       
        <div class="animate form login_form ">
        <div class="row card">
              <section class="login_content">
           
                  <h1>
                      &nbsp;</h1>
                  <h1>Login Form&nbsp;&nbsp;
                      </h1>
                  <div>
                      <asp:Label ID="Labelpageid" runat="server" Text="0" Visible="false"></asp:Label>
                      <asp:TextBox ID="TextBoxusername" runat="server" class="form-control" placeholder="Username" ></asp:TextBox>
                  </div>
                  <br />
                  <div>
                   
                      <asp:TextBox ID="TextBoxpassword" runat="server" class="form-control" placeholder="password" TextMode="Password"  ></asp:TextBox>

                  </div>
                  <br />
                  <div>
     
                      <asp:Button ID="Buttonlogin" runat="server" Text="Log in"  CssClass="btn btn-default submit" OnClick="Buttonlogin_Click"/>
                    
                        <asp:CheckBox ID="CheckBoxsave" runat="server" cssclass="js-switch" Text="Save my user"/>
                  </div>

                  <div class="clearfix"></div>
                  <br />
                  <div class="row">
                      <asp:Label ID="LabelStatus" runat="server" Text="" ForeColor="Red"></asp:Label>
                  </div>

                  <div class="separator">
              

                    <div class="clearfix"></div>
                    <br />

                    <div>
                       <h1> Mohamoud Labortory</h1>
                      <p>©2019 All Rights Reserved.  Privacy and Terms</p>
                    </div>
                  </div>
      
              </section>
            </div>
        </div>
    
   </div>
   </div>

           <%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
              Launch demo modal
            </button>--%>

    </div>

       



      

           <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



    </form>

   

</body>
</html>


