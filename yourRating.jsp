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
        <%@taglib uri="/struts-jquery-tags" prefix="sj" %>
<sj:head/>
        <meta charset="utf-8">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:600,400' rel='stylesheet' type='text/css'>
        <title>jQuery UI Example Page</title>
         <link rel="stylesheet" href="css/rating.css">
        <script src="rating/jquery.js"></script>
        <script src="rating/jquery.rating.js"></script>
         <link type="text/css" href="css/text.css" rel="stylesheet" />
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui-1.10.4.custom.js"></script>

        <script>
                    $(function() {

                    //jQuery("#myButton").click( showDialog );

                    //variable to reference windowaddProperty
                    $add = jQuery('#addProperty');
                            $("#addClose").click(function() {
                    $add.dialog("close");
                    });
                            $add.dialog({
                            autoOpen: true,
                                    modal: true,
                                    width: 300,
                                    height:300,
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
                                    //                     title: 'Welcome to BEGOH',
                                    // dialogClass: 'info'
                                    //  overlay: { opacity: 0.5, background: 'black'}
                            });
                            
                            $myWindow = jQuery('#plzLogin');
                            $("#plzClose").click(function() {
                    $myWindow.dialog("close");
                    });
                            //instantiate the dialog
                            $myWindow.dialog({
                            autoOpen: false,
                                    modal: true,
                                    width: 440,
                                    show: {effect: 'clip', duration: 250},
                                    hide: {effect: 'clip', duration: 500}
                            //                     title: 'Welcome to BEGOH',
                            // dialogClass: 'info'
                            //  overlay: { opacity: 0.5, background: 'black'}
                            });
                            $("#overlay").hide();
                            $("#signIN").click(function() {
                    var email = document.getElementById("email").value;
                            var pass = document.getElementById("pass").value;
                            if (email === null || email === "")
                    {
                    $('#result').hide();
                            $('#result').html('<img src="images/error.png" width="20" height="20"/> Enter your mail-id');
                            $('#result').slideDown('slow');
                    }
                    else if (pass === null || pass === "")
                    {
                    $('#result').hide();
                            $('#result').html('<img src="images/error.png" width="20" height="20"/> Enter your password');
                            $('#result').slideDown('slow');
                    }
                    else {
                    $.post("login", {email: "" + email + "", pass: "" + pass + ""}, function(data) {

                    //    
                    if (data === "success")
                    {
                    window.location = "ReDirect.jsp";
                    }
                    else
                    {
                    $('#result').html(data);
                    }

                    });
                    }
                    });
                            $(document).tooltip();
                            var loginPos = $('#dialog');
                            var contact = $("#contact");
                            var about = $("#dialogAbout");
                            var works = $("#dialogWorks");
                            $("#lclose").click(function() {
                    //alert("done");

                    /*loginPos.animate({
                     right : "35%",
                     top: "100%"
                     
                     // top: "100%"
                     
                     }, 500);*/
                    loginPos.hide();
                            $("#overlay").hide();
                            location.reload(true);
                            //loginPos.addClass("loginPos");
                    });
                            $("#aboutClose").click(function() {
                    // alert("done");
                    $("#overlay").hide();
                            location.reload(true);
                    });
                            $("#worksClose").click(function() {
                    // alert("done");
                    $("#overlay").hide();
                            location.reload(true);
                    });
                            $("#contactClose").click(function() {
                    // alert("done");
                    $("#overlay").hide();
                            location.reload(true);
                    });
                            //  $("#dialog").dialog({
                            //  autoOpen: false,
                            // modal: true,
                            //  width: 470,
                            //  show: {effect: theme, duration: 500},
                            // hide: {effect: theme, duration: 500},
                            //  title: false,
                            //  dialogClass: 'info'

                            // });

                            /*      $("#contact").dialog({
                             autoOpen: false,
                             modal: true,
                             width: 470,
                             show: {effect: theme, duration: 500},
                             hide: {effect: theme, duration: 500},
                             title: false,
                             dialogClass: 'info'
                             
                             });
                             */

                            $(".ui-dialog-titlebar").hide();
                            /* $("#dialogAbout").dialog({
                             autoOpen: false,
                             modal: true,
                             width: 680,
                             show: {effect: theme, duration: 500},
                             hide: {effect: theme, duration: 500},
                             title: 'about BEGOH',
                             dialogClass: 'info'
                             
                             });*/
                            $(".ui-dialog-titlebar").hide();
                            /* $("#dialogWorks").dialog({
                             autoOpen: false,
                             modal: true,
                             width: 680,
                             show: {effect: theme, duration: 500},
                             hide: {effect: theme, duration: 500},
                             title: 'How does BEGOH work',
                             dialogClass: 'info'
                             
                             });
                             */
                            $(".ui-dialog-titlebar").hide();
                            // Link to open the dialog
                            $("#dialog-link").click(function(event) {
                    $myWindow.dialog("open");
                    });
                            // Link to open the Aboutdialog
                            $("#dialogAbout-link").click(function(event) {
                    $("#overlay").show();
                            about.show();
                            about.animate({
                            left: "25%",
                                    top: "-70%"

                            }, 500);
                            event.preventDefault();
                    });
                            // Link to open the Worksdialog
                            $("#dialogWorks-link").click(function(event) {
                    $("#overlay").show();
                            works.show();
                            works.animate({
                            left: "25%",
                                    top: "-70%"

                            }, 500);
                            event.preventDefault();
                    });
                            // Link to open the Worksdialog
                            $("#dialogContact-link").click(function(event) {
                    $("#overlay").show();
                            contact.show();
                            contact.animate({
                            left: "35%",
                                    top: "-70%"

                            }, 500);
                            event.preventDefault();
                    });
                            // Hover states on the static widgets

                    });        </script>
        <style>
            .loginPos
            {
                z-index: 30;
                width: 450px;
                height: 400px;
                background: white;
                display: none;
                position: fixed;
                bottom:100%;
                right:  -100px;
                left:100%;
                margin-top: 45%;
                margin-left: 0px;
            }
            .contact
            {
                display: none;
                z-index: 31;
                width: 450px;
                height: 400px;
                background: white;
                position: fixed;
                bottom:100%;
                right:  -100px;
                left:100%;
                margin-top: 45%;
                margin-left: 0px;
            }
            .about
            {
                z-index: 32;
                width: 650px;
                height: 400px;
                background: transparent;
                display: none; 
                position: fixed;
                bottom:100%;
                right:  -100px;
                left:100%;
                margin-top: 45%;
                margin-left: 0px;
            }

            .works
            {
                z-index: 33;
                width: 650px;
                height: 400px;
                background: transparent;
                display: none;
                position: fixed;
                bottom:100%;
                right:  -100px;
                left:100%;
                margin-top: 45%;
                margin-left: 0px;
            }

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

        <%--search result display ---%>
        <div class="searchResult"></div>
        <div class="searchResultTop">
            <div class="zoom" id='zoom'> 
                <%--zoom begins --%>
                <%
    String test = "/zoomDisp?key=1";
    
    %>
 <s:set var="test"><%=test%></s:set>
    <s:url action="%{test}" id="neo"/>
<sj:div href="%{neo}" effect="bounce" effectDuration="1000">
    
</sj:div>

                <%--zoom ends --%>
            </div>
            <div class="all">
                <div class="head">Search Result</div>
                <div class="props">
                    <%
                        List list = new ArrayList();
                        list = (ArrayList) request.getAttribute("propertyList");
                        Iterator itr = list.iterator();
                        while (itr.hasNext()) {
                            Profile pp = (Profile) itr.next();
                    %>

                    <div onclick="zoom('<%=(pp.getPid())%>');" class="prop"><img  src='<%=(pp.getPimage())%>' style="float: left;width: 90px;height: 90px;border: 0px solid transparent;border-radius: 10px;padding-left: 4px;padding-top: 3px;"  width="90" height="90"/> <%=(pp.getPname())%><br><%=(pp.getAddress())%></div>         

                    <%
                        }
                        if (list.size() == 0) {
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

                    %>



                </div>

            </div>
        </div>


        <div id="dialogAbout" class="about">
            <div id="aboutClose" style="width: 100%;background: transparent;float: right;height: 30px;"><img style="float: right;cursor:pointer;" src="neo/close.png"/></div>  
            <iframe width="640" height="390" src="//www.youtube.com/embed/cdzdoalAG8A" frameborder="0" allowfullscreen></iframe>
        </div>


        <div id="dialogWorks" class="works">
            <div id="worksClose" style="width: 100%;background: transparent;float: right;height: 30px;"><img style="float: right;cursor:pointer;" src="neo/close.png"/></div>  
            <iframe width="640" height="390" src="//www.youtube.com/embed/TDMvBXCqeEo" frameborder="0" allowfullscreen></iframe>
        </div>
        <%--login dialog starts--%>
        <div id="plzLogin" >
            <div class="dialogTitles">welcome to BEGOH
                <img src="neo/cross.png" title="Close" id='plzClose' style='float:right;margin-right: 10px;cursor: pointer;' width="15" height="15"/>
            </div>
            <s:form theme="bootstrap" cssStyle="margin-left:30px;width:350px;" cssClass="well form-vertical">
                <s:textfield id="email" onchange="testId();" placeholder="Enter Email" cssStyle="width:300px;height:30px;" />
                <s:password id="pass" placeholder="Enter Password" cssStyle="width:300px;height:30px;" />
                <div class="siginBtn" id="signIN">Sign In</div>
            </s:form>
            <br>
            <div id="result" style="display: none;width: auto;margin-bottom: 10px;color: red;font-size: 16px;"></div>
            <div class="connect">
                Or sign up / sign in with  <img src="neo/face.png" width="28" height="28"/>  <img src="neo/google-plus.png" width="30" height="30"/>  <img width="30" height="30" src="neo/in.png"/> <a href="userProfile.jsp"><img width="40" height="40" src="neo/mail.png"/></a>
            </div>

        </div>

        <%-- login dialog ends--%>


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
    var login = document.getElementById("name").value;
            if (login === "none")
    {
    $myWindow.dialog("open");
    }
    else {
    $.post("abusive", {cno: "" + cno + ""}, function(data) {
    $("#response").hide('slow');
            $("#response").html(data);
            $("#response").slideDown('slow');
            $("#imgbox" + cno).hide('slow');
    });
    }
    }

</script>
