<%-- 
    Document   : home
    Created on : 17 Jun, 2014, 11:30:43 AM
    Author     : neo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"
      href="dist/css/bootstrap.min.css">
  <!-- Bootstrap theme -->
    <link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dist/css/theme.css" rel="stylesheet">

<script src="dist/js/bootstrap.min.js"></script>
        <%@taglib prefix="s" uri="/struts-tags" %>
        <meta charset="utf-8">
        <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,600' rel='stylesheet' type='text/css'>
        <title>jQuery UI Example Page</title>
        <link href="css/start/jquery-ui-1.10.4.custom.css" rel="stylesheet">
        <link type="text/css" href="css/text.css" rel="stylesheet" />
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui-1.10.4.custom.js"></script>

        <script>
    $(function() {
        
         var loginPos = $('#dialog');     
                //login
         loginPos.dialog({
                  autoOpen: false,
                 modal: true,
                  width: 470,
                  height:370,
                  show: {effect: 'clip', duration: 500},
                 hide: {effect: 'clip', duration: 500},
                  title: false
                  
                 });
                 $("#lclose").click(function() {
                    loginPos.dialog('close');
                });
                
                
                 // Link to open the dialog
                $("#dialog-link").click(function(event) {
                 loginPos.dialog('open');  

                });
        //login ends 
        $("#cancel").click(function(){
         window.location="index.jsp";   
        });
        $("#overlay").hide();
        $("#logon").click(function(){
            var email = document.getElementById("email").value;
                var pass = document.getElementById("pass").value;  
                if(email===null || email==="")
                {
                    $('#result').hide();
                   $('#result').html('<img src="images/error.png" width="20" height="20"/> Enter your mail-id'); 
                   $('#result').slideDown('slow');
                }
                else if(pass===null || pass==="")
                {
                    $('#result').hide();
                   $('#result').html('<img src="images/error.png" width="20" height="20"/> Enter your password'); 
                   $('#result').slideDown('slow');
                    
                }
                else{
  $.post("login",{email:""+email+"",pass:""+pass+""},function(data){
        
         //    
            if(data==="success")
            {
                window.location="index.jsp";
            }
            else
            {
           $('#result').html(data);
            }
      
        });
    }  
        });
          $( document ).tooltip();
  

        
        $(".ui-dialog-titlebar").hide();
           

                // Hover states on the static widgets

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
        <div id="overlay"></div>
        <jsp:include page="menu.jsp" />    
       
        
        <%--logo
        <div class="header" >
            <div class="logo"><img src="images/logo.png" width="50" height="50"></div>
                
        </div>
         logo ends--%>



    
       
        <!-- ui-dialog -->
        <div id="dialog" class="loginPos">
            <div class="dialogTitles">welcome to BEGOH
                <img src="neo/cross.png" title="Close" id='lclose' style='float:right;margin-right: 10px;cursor: pointer;' width="15" height="15"/>
            </div>
            <div id="loginPage" style="margin-top:20px;">
                <div id="result" style="display: none;width: auto;margin-bottom: 10px;color: red;font-size: 16px;"></div>
                <div class="logFields">
                    <s:form theme="bootstrap" cssStyle="margin-left:30px;width:350px;" cssClass="well form-vertical">
                        <s:textfield id="email" class="form-control" onchange="testId();" autofocus="true" placeholder="Enter Email" cssStyle="width:300px;height:30px;" />
                        <s:password id="pass" class="form-control" placeholder="Enter Password" cssStyle="width:300px;height:30px;" />
                    <div class="btn btn-primary" id="logon">Sign In</div>
                    </s:form>
                </div>
                <br>

                <div class="connect">
                    Or sign up / sign in with  <img src="neo/face.png" width="28" height="28"/>  <img src="neo/google-plus.png" width="30" height="30"/>  <img width="30" height="30" src="neo/in.png"/> <a href="userProfile.jsp"><img width="40" height="40" src="neo/mail.png"/></a>
                </div>
            </div>
        </div>
        
     <%-- SignUp form--%>
     <div class="contentOverlay"></div>
        <div class="content">
                                 
                             <form method="post" cssClass="well form-vertical" name="propForm" id="propertyDetail" onsubmit="return sendPro();" action="profile"  enctype="multipart/form-data">
                                 <h4>Sign Up</h4>
                                 <div class="signupLeftPane">
                                     <table border="0">
                                             <tr>
                                                 <td style="text-align: right;">First Name:</td>
                                                 <td><input type="text" class="form-control" name="fname" id="fname" ></td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right;">Last Name:</td>
                                                 <td><input type="text" class="form-control" name="lname" id="lname"></td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right;">Email:</td>
                                                 <td><input type="text" class="form-control" name="email" id="emailID"></td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right;">Password:</td>
                                                 <td><input type="password" class="form-control" name="password" id="password" ></td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right;">Confirm Password:</td>
                                                 <td><input type="password" class="form-control" name="cpassword" id="cpassword" ></td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right;">Blurb:</td>
                                                 <td><textarea rows="4" placeholder="Tell about yourself..." class="form-control" name="aboutU" id="aboutU" ></textarea></td>
                                             </tr>
                                     </table>

                                         <s:if test="hasActionMessages()">
                                  <div style="color:green;font-size: 18px;float: left;text-decoration: none;margin-left: 10px;margin-top: 5px;"> <img src='images/tick.png' width='20' height='20' /> <s:actionmessage/></div>
                             </s:if>
                                             
                                 </div>
                                   <div class="signupRightPane">
                                       
                                       <table border="0">
                                         <tr>
                                             <td style="text-align: right;">Address:</td>
                                             <td><textarea class="form-control" name="address" id="address" class='address' rows="4"></textarea></td>
                                         </tr>
                                         <tr>
                                             <td style="text-align: right;">Upload Your Photo:</td>
                                             <td style="text-align: left;">
                                                 <span class="btn btn-default btn-file">
                                               Browse  <input type="file"  name="ppic" onchange="showimagepreview(this,this.value)"/>
                                             </span>
                                                 </td>
                                         </tr>
                                         <tr>
                                             <td></td>
                                             <td style="text-align: left;"> <img id="imgprvw" class="img-thumbnail" alt="Preview" style="width:120px;height: 100px;"/>
                                                 <input type="hidden" id="imgName"/></td>
                                         </tr>
                                         <tr>
                                             <td></td>
                                             <td style="text-align: left;"><input type="checkbox" name="tenant"  value="">Are you a Tenant? </td>
                                             
                                         </tr>
                                         <tr>
                                             <td></td>
                                             <td style="text-align: left;"><input type="checkbox" name="landlard"  value="">Are you a Landlord? </td>
                                             
                                         </tr>
                                         <tr>
                                             <td></td>
                                             <td><div id="target"></div></td>
                                         </tr>
                                         <tr>
                                             <td><input  type="submit"  name="submit"  class="btn btn-sm btn-primary" value="Submit" ></td>
                                             <td>
                                             <input type="button" id="cancel" name="Cancel"  class="btn btn-sm btn-primary" value="Cancel" >    
                                             </td>
                                         </tr>
                                        
                                 </table>

                                            
                                   </div>
                                  
                             </form>
                                 
                  </div>
        
        
          <%-- SignUp form--%>
        
        
         
        
        
       
        <jsp:include page="contact.jsp"/>
    </body>
</html>


<script type='text/javascript'>
    function sendPro()
            {
//alert("inside0");
 var filename  = document.getElementById("imgName").value;
        var fname = document.getElementById("fname").value;
    ///    alert("inside1");
              var lname = document.getElementById("lname").value;
              //alert("inside2");
              var address = document.getElementById("address").value;
             // alert("inside3");
              var email = document.getElementById("emailID").value;
              var aboutU = document.getElementById("aboutU").value;
              //alert(email);
            //  alert("inside4");
              var password = document.getElementById("password").value;
              var cpassword = document.getElementById("cpassword").value;
            //  alert(password+"      "+cpassword)
              if (fname==="" || fname==="")
               {
                   $("#target").html('<img src="images/error.png" width=20 height=20 />First Name required');
                   $("#target").show('slow');
                   return false;
                }
                else if (lname==="" || lname === null)
                {
                    $("#target").html('<img src="images/error.png" width=20 height=20 />Last Name required');
                   $("#target").show('slow');
                   return false;
                }
               
              else if (address==="" || address===null)
               {
                   $("#target").html('<img src="images/error.png" width=20 height=20 />Address required');
                   $("#target").show('slow');
                   return false;
              }
              else if (email==="" || email===null)
               {
                   $("#target").html('<img src="images/error.png" width=20 height=20 />Email required');
                   $("#target").show('slow');
                   return false;
              }
              else if (password==="" || password===null)
               {
                   $("#target").html('<img src="images/error.png" width=20 height=20 />Password required');
                   $("#target").show('slow');
                   return false;
              }
              else if (cpassword==="" || cpassword===null)
               {
                   $("#target").html('<img src="images/error.png" width=20 height=20 />Repeat password');
                   $("#target").show('slow');
                   return false;
              }
              else if (cpassword!==password)
               {
                   $("#target").html('<img src="images/error.png" width=20 height=20 />Password do not match');
                   $("#target").show('slow');
                   return false;
              }
              else if (aboutU==="" || aboutU===null)
               {
                  document.getElementById("aboutU").value="none";
              }
              else if(filename!==null){
           var allowed_extensions = new Array("jpg","jpeg","JPG","JPEG","png","gif");
    var file_extension = filename.split('.').pop(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.

    for(var i = 0; i < allowed_extensions.length; i++)
    {
        if(allowed_extensions[i]===file_extension)
        {
            return true; // valid file extension
        }
        else
        {
           // if(i+1===3)
           // {
           // $("#target").html("Image type not allowed");
          // $("#target").show('slow');
           return true;
            //}
        }
    }
       }
           return true;    
            }
            
           function showimagepreview(input,name) {
               document.getElementById("imgName").value=name;
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

</script>

