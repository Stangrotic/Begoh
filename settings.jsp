<%-- 
    Document   : home
    Created on : 17 Jun, 2014, 11:30:43 AM
    Author     : neo
--%>

<%@page import="pojos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link href="dist/css/bootstrap.min.css">
  <!-- Bootstrap theme -->
    <link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dist/css/theme.css" rel="stylesheet">
        <%@taglib prefix="s" uri="/struts-tags" %>
        <meta charset="utf-8">
        <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,600' rel='stylesheet' type='text/css'>
        <title>jQuery UI Example Page</title>
        <link href="css/start/jquery-ui-1.10.4.custom.css" rel="stylesheet">
        <link type="text/css" href="css/settings.css" rel="stylesheet" />
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui-1.10.4.custom.js"></script>

        <script>
          
    $(function() {
          $("#cancel").click(function(){
         window.location="index.jsp";   
        });
        $("#overlay").hide();
        
      
              $(".ui-dialog-titlebar").hide();

            });
        </script>
        <style>

            .demoHeaders {
                margin-top: 2em;
            }

            #icons {
                margin: 0;
                padding: 0;
            }
            #icons li {
                margin: 2px;
                position: relative;
                padding: 4px 0;
                cursor: pointer;
                float: left;
                list-style: none;
            }
            #icons span.ui-icon {
                float: left;
                z-index: 9;
                margin: 0 4px;
            }
            .fakewindowcontain .ui-widget-overlay {
                position: absolute;

            }
            .info .ui-widget-header {
                background: #1D3BFF;
                // height: 50px;
                padding-top: 16px;
                padding-bottom: 16px;
                color: white;
                text-align: center;
                font-family: 'Open Sans', sans-serif;
                font-style: normal;
                font-weight:  700;
            }
    .btn-file {
    position: relative;
    overflow: hidden;
    }
    .btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 999px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
    }
        </style>
    </head>
    <body class="background-image">
        <jsp:include page="menu.jsp" />
        <div id="overlay"></div>
            
       
        
        <%--logo
        <div class="header" >
            <div class="logo"><img src="images/logo.png" width="50" height="50"></div>
                
        </div>
         logo ends--%>



    
       
        <!-- ui-dialog -->
        
        <%-- settings--%>
         <%
                if(session.getAttribute("name")==null)
                {
                    %>
                    <jsp:forward page="index.jsp"/>
                    
                    <%
                }
                else
                {
                   User user = (User)session.getAttribute("User");
                   
                   %>
                   <input type="hidden" id="spass" value="<%=(user.getPass())%>"/>
                   <div class="settings"></div>
                   <div class="settingsTop">
                       <div style="margin-left: 30px;float: left;width: 400px;height: 290px;border-right: 1px solid gray;">
                           <form method="post"   action="update"  enctype="multipart/form-data">
                           <table border="0" style="text-align: left;">
                                   <tr>
                                       <td><img  id="imgprvw" src="upload/<%=(user.getImgName())%>" class="img-circle" style="width:130px;height: 130px;"/><br></td>
                                       <td></td>
                                   </tr>
                                   <tr>
                                       <td>
                                            <span class="btn btn-default btn-file">
                                               Browse <input type="file" onchange="showimagepreview(this,this.value)" id="ppic" name="ppic" style="width:92px;overflow: hidden;"/>
                                            </span>
                                            </td>
                                       <td></td>
                                   </tr>
                                   <tr>
                                       <td>First Name</td>
                                       <td><input class="form-control" type="text" name="fname" value="<%=(user.getName())%>"/></td>
                                   </tr>
                                   <tr>
                                       <td>Last Name</td>
                                       <td><input class="form-control" type="text" name="lname" value="<%=(user.getLname())%>"/></td>
                                   </tr>
                                   <tr>
                                       <td>Email</td>
                                       <td><%=(user.getEmail())%></td>
                                   </tr>
                                   <tr>
                                       <td>Address</td>
                                       <td><textarea class="form-control" type="text" name="address" ><%=(user.getAddress())%></textarea>
                                   </tr>
                                   <tr style="margin-top: 2%;" >
                                       <td><input type="hidden" name="flag" value="update"/></td>
                                       <td style="float:left;margin-top: 10px;"><input type="submit" class="btn btn-sm btn-primary" value="save" /> <input type="button" id="cancel" name="Cancel" style="margin-left: 0%;"  class="btn btn-sm btn-primary" value="Cancel" >
                                       
                                           <input type="button" id="cancel" onclick="profile('<%=(user.getEmail())%>');" name="Cancel" style="margin-left: 0%;"  class="btn btn-sm btn-primary" value="Profile" ></td>
                                   </tr>
                           </table>

                           </form>
                             
                  </div>
                  <%--password div --%>
                  <div style="float: left;width: 380px;height: 290px;margin-left: 10px;">
                      <p id="viewPane" style="cursor: pointer;">Change Password</p>
                      <div id="target" style="display:none;">
                              <form method="post"  onsubmit="return change();" action="change"  enctype="multipart/form-data">
                          <table border="0">
                                  <tr>
                                      <td>Current Password</td>
                                      <td><input type="password" class="form-control" id="oldpass"/></td>
                                  </tr>
                                  <tr>
                                      <td>New Password</td>
                                      <td><input type="password" class="form-control" name="newPass" id="newPass"/></td>
                                  </tr>
                                  <tr>
                                      <td>Repeat Password</td>
                                      <td><input type="password"  class="form-control" id="cpass"/></td>
                                  </tr>
                                
                                  <tr >
                                      <td><input type="hidden"  name="flag" value="change"/></td>
                                      <td><br><input type="submit" value="change" class="btn btn-sm btn-primary" id="change" style="cursor: pointer;" /></td>
                                  </tr>
                          </table>

                      </form>
                           
                           
                      </div>
                       <div id="pResp" style="float: left;margin-left: 20%;width:300px;height: 30px;margin-top: 3%;">
                  <s:if test="hasActionMessages()">
   
                      <div style="float: left;text-decoration: none;margin-left: 10px;margin-top: 100px;"> <img src='images/tick.png' width='20' height='20' /> <s:actionmessage/></div>
   
</s:if>
                      </div>
                  
                  </div>
                 
                   </div>
                   <%
                   
                }
                
                %>
                
                <%--end--%>
        
        
        
        
        
        
       
        <jsp:include page="contact.jsp"/>
    </body>
</html>
<script>
    function delAccount()
    {
        window.location = "delAccount";
    }
function profile(email)
{
    window.location = "getProfile?email="+email;
}
    function showimagepreview(input,name) {
               //document.getElementById("imgName").value=name;
 // document.getElementById("h1").style.display="block";
   //alert("hai");
if (input.files && input.files[0]) {
var filerdr = new FileReader();
filerdr.onload = function(e) {
$('#imgprvw').attr('src', e.target.result);
};
filerdr.readAsDataURL(input.files[0]);
}
}
$(function(){
    $("#viewPane").click(function(){
       $("#target").slideToggle(); 
                
    });


$("#change").click(function(){
      var old = document.getElementById("oldpass").value;
      var npass = document.getElementById("newPass").value;
      var cpass = document.getElementById("cpass").value;
      var pass = document.getElementById("spass").value;
    //  alert(old+"new"+pass);
      if(old===null || old==="")
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/> Enter Current Password");
         $("#pResp").fadeIn(5000);
            return false;
      }
      else if(pass!==old)
      {
          document.getElementById("oldpass").value="";
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/>Please Enter Correct Password");
         $("#pResp").fadeIn(5000);
         return false;
      }
      else if(npass===null || npass==="")
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/> Enter New Password");
         $("#pResp").fadeIn(5000);
            return false;
      }
      else if(cpass===null || cpass==="")
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/> Confirm Password");
      $("#pResp").fadeIn(5000);
            return false;
        }
      else if(cpass!==npass)
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/>New Password do not match");
      $("#pResp").fadeIn(5000);
            return false;
        }
      
      
     
    });
    
//password change function ends
$("#updateUser").click(function(){
      var old = document.getElementById("oldpass").value;
      var npass = document.getElementById("npass").value;
      var cpass = document.getElementById("cpass").value;
      var pass = document.getElementById("pass").value;
      if(old===null || old==="")
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/> Enter Current Password");
         return false;
      }
      else if(pass!==old)
      {
          document.getElementById("oldpass").value="";
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/>Please Enter Correct Password");
         return false;
      }
      else if(npass===null || npass==="")
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/> Enter New Password");
         return false;
      }
      else if(cpass===null || cpass==="")
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/> Confirm Password");
      return false;
        }
      else if(cpass!==npass)
      {
         $("#pResp").html("<img src='images/error.png' width='20' height='20'/>New Password do not match");
      return false;
        }
      
      
     return true;
    });


});
</script>

</script>
