<%-- 
    Document   : home
    Created on : 17 Jun, 2014, 11:30:43 AM
    Author     : neo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap core CSS -->
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap theme -->
        <link href="dist/css/bootstrap-theme.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="dist/css/theme.css" rel="stylesheet">
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
                $("#cancel").click(function() {
                    window.location = "index.jsp";
                });


                $("#overlay").hide();


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
        <%
             String name = "";
            String email = "";
              if(session.getAttribute("name")==null)
                {
                    %>
                    <jsp:forward page="index.jsp"/>
                    
                    <%
                }
              else{
                  
             
           
                            //int pid = 0;
            // String login = session.getAttribute("login").toString();
            // {
            if (session.getAttribute("name") == null) {
                name = "none";
            } else {
                name = session.getAttribute("name").toString();
                email = session.getAttribute("email").toString();
            }
              }
        %>
        <input type="hidden" id="name" value="<%=name%>"/>


      
        <div class="contentOverlay"></div>
        <%--content--%>
        <div class="content">
            <div style="color: blue;font-size: 18px;width: auto;height: auto;">
                <s:if test="hasActionMessages()">
                    <img src='images/tick.png' style="float: left;" width='20' height='20' /> <s:actionmessage/>
                </s:if>
            </div>
            <center><h4>Property Details.</h4>     </center><br>
            <form enctype="multipart/form-data" action="ppm" name="propertyRating" onsubmit="return saveProp();" id="propertyRating" method="POST" >

                <div class="signupLeftPane">
                    <table border="0">
                        <thead>

                            <tr>
                                <td>Property Name:</td>
                                <td><input type="text" class="form-control" name="pname" id="pname"  /></td>
                            </tr>

                            <tr>
                                <td>Apartment/Suite:</td>
                                <td>
                                    <input type="text" class="form-control" name="suite" id="suite"  />
                                </td>
                            </tr>
                            <tr>
                                <td>Street:</td>
                                <td><input type="text" class="form-control" name="street" id="street" /></td>
                            </tr>
                            <tr>
                                <td>City:</td>
                                <td><input class="form-control" type="text" name="city" id="city" /></td>
                            </tr>
                            <tr>
                                <td>State:</td>
                                <td><input type="text" class="form-control" name="state" id="state"  /></td>
                            </tr>
                            <tr>
                                <td>Country:</td>
                                <td><input type="text" class="form-control" name="country" id="country" /></td>
                            </tr>
                            <tr>
                                <td>ZipCode:</td>
                                <td><input type="text" class="form-control" name="zip" id="zip" /></td>
                            </tr>
                    </table>


                </div>
                <div class="signupRightPane">


                    <table border="0">

                        <tr>
                            <td></td>
                            <td>Upload Property Photo:</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span class="btn btn-default btn-file">
                                    Browse  <input type="file"  name="pfile" id="file" onchange="showimagepreview(this, this.value)"/>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><img id="imgprvw" class="img-thumbnail" alt="preview" style="width:140px;height: 100px;"/>
                                <input type="hidden" id="imgName"/>
                            </td>
                        </tr>

                    </table>


                    <div style="float:left;margin-top: 5%;margin-left:0%;">
                        <div id="target" style="color:red;font-size: 18px;float: left;width: 100%;height: 30px;background: transparent;"></div>
                        <input type="submit"   class="btn btn-sm btn-primary" value="Submit" >
                        <input type="button" id="cancel"   class="btn btn-sm btn-primary" value="Cancel" >
                    </div>


                </div>


            </form>
            <!--                                <div style="float:right;margin-top: -30%;width:30px;height: 10px;margin-right: 10%;">
                                                      <div class="menubutton" style="font-size:12px;">
                                                                   <a href='#' ><span>Current / Past Tenant? Click here to Rate the Property!</span></a>
                                                      </div>    
                                            </div>      -->
        </div>
        <%--content ends--%>




        
        <jsp:include page="contact.jsp"/>
    </body>
</html>
<script>
    function saveProp()
    {
        // alert("jjjjj");
        var login = document.getElementById("name").value;
        var filename = document.getElementById("imgName").value;
        var pname = document.getElementById("pname").value;
        var street = document.getElementById("street").value;
        var suite = document.getElementById("suite").value;
        var city = document.getElementById("city").value;
        var state = document.getElementById("state").value;
        var zip = document.getElementById("zip").value;
        var country = document.getElementById("country").value;
        if (login === "none")
        {
            $myWindow.dialog("open");
            return false;
        }
        else if (pname === null || pname === "")
        {
            $("#target").html("Enter Property Name");
            $("#target").show('slow');
            return false;
        }
        else if (street === null || street === "")
        {
            $("#target").html("Enter Street Name");
            $("#target").show('slow');
            return false;
        }
        else if (suite === null || suite === "")
        {
            $("#target").html("Select Apartment or Suite");
            $("#target").show('slow');
            return false;
        }
        else if (city === null || city === "")
        {
            $("#target").html("Enter city Name");
            $("#target").show('slow');
            return false;
        }
        else if (state === null || state === "")
        {
            $("#target").html("Enter state Name");
            $("#target").show('slow');
            return false;
        }
        else if (country === null || country === "")
        {
            $("#target").html("Enter state Name");
            $("#target").show('slow');
            return false;
        }
        else if (zip === null || zip === "")
        {
            $("#target").html("Enter zip");
            $("#target").show('slow');
            return false;
        }
        else if (filename !== null) {
            var allowed_extensions = new Array("jpg", "jpeg", "JPG", "JPEG", "png", "gif");
            var file_extension = filename.split('.').pop(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.

            for (var i = 0; i < allowed_extensions.length; i++)
            {
                if (allowed_extensions[i] === file_extension)
                {
                    return true; // valid file extension
                }
                else
                {
                    if (i + 1 === 3)
                    {
                        // $("#target").html("Image type not allowed");
                        //$("#target").show('slow');
                        return true;
                    }
                }
            }
        }
        return true;
    }

    function showimagepreview(input, name) {
        document.getElementById("imgName").value = name;
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