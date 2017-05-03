<%-- 
    Document   : home
    Created on : 17 Jun, 2014, 11:30:43 AM
    Author     : neo
--%>

<%@page import="pojos.Comments"%>
<%@page import="pojos.Profile"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%@taglib uri="/struts-bootstrap-tags" prefix="sb" %>
        <sb:head/>
        <%@taglib prefix="s" uri="/struts-tags" %>
        <meta charset="utf-8">
        <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400' rel='stylesheet' type='text/css'>
        <title>jQuery UI Example Page</title>
        <link rel="stylesheet" href="css/rating.css">
        <script src="rating/jquery.js"></script>
        <script src="rating/jquery.rating.js"></script>
        <link rel="stylesheet" href="css/rating.css">
        <script src="rating/jquery.js"></script>
        <script src="rating/jquery.rating.js"></script>
        <link href="css/start/jquery-ui-1.10.4.custom.css" rel="stylesheet">
        <link type="text/css" href="css/text.css" rel="stylesheet" />
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui-1.10.4.custom.js"></script>

        <script>
            $(function() {
                //search better

                $("form").submit(function() {


                    var ser = document.getElementById("search").value;
                    if (ser === "" || ser === null) {
                        document.getElementById("search").placeholder = "Please Fill The Property Details";
                        return false;
                    }
                    else
                    {
                        return true;
                    }



                });
                // search better ends




                var pid = document.getElementById("proId").value;
                //jQuery("#myButton").click( showDialog );
                $("#zoom").load("zoomDisp", {key: "" + pid + ""}, function() {
              
                });
                //variable to reference windowaddProperty
                $add = jQuery('#addProperty');
                $("#addClose").click(function() {
                    $add.dialog("close");
                });
                $add.dialog({
                    autoOpen: true,
                    modal: true,
                    width: 300,
                    height: 300,
                    show: {effect: 'clip', duration: 250},
                    hide: {effect: 'clip', duration: 500},
                    buttons: [
                        {
                            text: "ADD",
                            click: function() {
                                window.location = "propertyProfile.jsp";
                                $(this).dialog("close");
                            }
                        },
                        {
                            text: "CLOSE",
                            click: function() {
                                window.location = "index.jsp";
                                $(this).dialog("close");
                            }
                        },
                    ]
                });

               
                $("#overlay").hide();
                $(".ui-dialog-titlebar").hide();
                // Hover states on the static widgets

            });</script>
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
            img {  
                vertical-align: middle;  
            } 
        </style>
    </head>
    <body class="background-image">
        <div id="overlay"></div>
        <jsp:include page="menu2.jsp" />    


        <%--logo
        <div class="header" >
            <div class="logo"><img src="images/logo.png" width="50" height="50"></div>
                
        </div>
         logo ends--%>





        <!-- ui-dialog -->

        <%--search result display ---%>
        <div class="searchResult"></div>
        <div class="searchResultTop">
            <div class="zoom" id='zoom'> 
                <%--zoom begins --%>

                <%
                      if(session.getAttribute("name")==null)
                {
                    %>
                    <jsp:forward page="index.jsp"/>
                    
                    <%
                }
                      else
                      {
                    String test = session.getAttribute("pid").toString();

                %>
                <input type="hidden" id="proId" value="<%=test%>"/>           
                <div id="Zoomed">

                </div>

                <%--zoom ends --%>
            </div>
            <div class="all">
                <div class="head">
                    <form class="form-search" method="get" id="s" action="refine">
                      <%--  <div class="input-append" style="float: left;margin-left: 4%;">
                            <input type="text" class="input-medium search-query" name="key" id="search" placeholder="Search for property" style="height:5%;width: 133%;" value="">
                            <button type="submit" class="add-on" style="height:6%;"><i class="icon-search"></i></button>
                        </div>
                      --%>

                      <div class="input-group" style="margin-left: 10px;">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-search"></span>
                            </span>
                            <input type="text" class="form-control" name="key" id="search" placeholder="Search your property" style="height:45px;width:290px;">

                        </div>
                    </form>

                </div>
                <div class="props">
                    <%
                        List list = new ArrayList();
                        list = (ArrayList) session.getAttribute("propertyList");
                        if (Integer.parseInt(test) != 0) {
                            Iterator itr = list.iterator();
                            while (itr.hasNext()) {
                                Profile pp = (Profile) itr.next();
                    %>

                    <div onclick="zoom('<%=(pp.getPid())%>');" class="prop"><img  src='<%=(pp.getPimage())%>' style="float: left;width: 90px;height: 90px;border: 0px solid transparent;border-radius: 10px;padding-left: 4px;padding-top: 3px;font-weight: bold;margin-right: 20px;" /> <%=(pp.getPname())%><br><%=(pp.getType())%>, <%=(pp.getStreet())%><br><%=(pp.getCity())%>, <%=(pp.getState())%><br><%=(pp.getZip())%>, <%=(pp.getCountry())%></div>         

                    <%

                        }
                    } else {
                    %>

                    <div id="addProperty" >
                        <div class="dialogTitles">Property Not Found

                        </div>
                        <br><br>
                        <center>Would you to like to ADD Property</center>
                        <br>
                    </div>

                    <%
                        }
                      }
                    %>



                </div>

            </div>
        </div>


       


        <jsp:include page="contact.jsp"/>
    </body>
</html>
<script>



    function zoom(key)
    {
        //alert(key); 
        $.post("zoomDisp", {key: "" + key + ""}, function(data) {
            $("#zoom").html(data);
        });
    }


    function rateMe()
    {
        ///alert("Rate Me");
        $('#rateMe').slideToggle('slow');
        //$('#PropertyDisp').slideToggle('slow');


    }
    function rate()
    {
        var login = document.getElementById("name").value;
        var comment = document.getElementById("comment").value;
        //alert(login);
        if (login === "none")
        {
            $myWindow.dialog("open");
            return false;
        }
        else if (comment === null || comment === "")
        {
            $("#target").html('Enter your Comment please...');
            $("#target").slideToggle('slow');
            return false;
        }
        else
        {
            return true;
            //alert("sending");
            // $("#rateForm").ajaxSubmit({url: 'rate', type: 'post'});
            //var email = document.getElementById("email").value;
            //var name = document.getElementById("name").value;
            // var rating = document.getElementByName("rating").value;
            //alert(rating+email+name+comment+pid);
            //var rating2 = document.getElementByName("rating2").value;
            //var rating3 = document.getElementByName("rating3").value;
            //var rating4 = document.getElementByName("rating4").value;
            //var rating5 = document.getElementByName("rating5").value;
            //var comment = document.getElementById("comment").value;
            //var pid = document.getElementById("pid").value;
            //alert(email+name+comment+pid);
            // $.post("rate",{email:""+email+"",name:""+name+"",rating:""+rating+"",rating2:""+rating2+"",rating3:""+rating3+"",rating4:""+rating4+"",rating5:""+rating5+"",comment:""+comment+"",pid:""+pid+""},function(data){


            // if(data==="success")
            // {
            //     window.location="index.html";
            // }
            // else
            // {
            // $('#result').html(data);
            //  }

            // });
        }
    }
    function abusive(cno)
    {
      // alert(cno);
        
            $.post("abusive", {cno: "" + cno + ""}, function(data) {
                // $("#response").hide('slow');
                //        $("#response").html(data);
                //       $("#response").slideDown('slow');
                $("#imgbox" + cno).hide('slow');
            });
       
    }

    function rebuttal(cno)
    {
        // alert(cno);
        $("#response").hide('slow');
        var pid = document.getElementById("PID").value;
        var comment = document.getElementById("rebutCom" + cno).value;
        if (comment === "" || comment === null)
        {
            document.getElementById("rebutCom" + cno).placeholder = "please type here...";
        }
        
        else {
            $.post("rebuttal", {cno: "" + cno + "", comment: "" + comment + "", pid: "" + pid + ""}, function(data) {
                 
                //jQuery("#myButton").click( showDialog );
                $("#zoom").load("zoomDisp", {key: "" + pid + ""}, function() {
              
                });
                
            });
        }
    }

    function rebuttalShow(cno)
    {

        $("#rebuttal" + cno).slideToggle('slow');
    }

    function replies(cno)
    {
        //alert(cno);
        $("#zoomCode").hide('slow');
        // var login = document.getElementById("name").value;
        //  var comment = document.getElementById("rebutCom"+cno).value;
        // if(comment==="" || comment===null)
        // {
        //    document.getElementById("rebutCom"+cno).placeholder = "please type here...";
        // }
        // else
        //        if (login === "none")
        // {
        // $myWindow.dialog("open");
        // }
        // else {
        $.post("replies", {cno: "" + cno + ""}, function(data) {
            // $("#response").hide('slow');
            $("#zoom").html(data);
            $("#zoom").slideDown('slow');

        });
        // }
    }

    function sendBack(pid)
    {

        $("#zoom").load("zoomDisp", {key: "" + pid + ""}, function() {
            //alert( "The last 25 entries in the feed have been loaded" );
        });

    }


    function showProfile(user)
    {
        //alert(user);
        window.location = "getProfile?email=" + user;
        //  $.post("getProfile", {email: "" + user + ""}, function(data) {
        //alert(user);
        // $('#zoom').hide('slow');
        //$('#zoom').html(data);
        // $('#zoom').show();
        //});
    }
</script>
