<%@page import="pojos.Comments"%>
<%@page import="java.util.Iterator"%>
<%@page import="pojos.Profile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>BEGOH</title>
           <%@taglib uri="/struts-bootstrap-tags" prefix="sb" %>
        <sb:head/>
        <%@taglib prefix="s" uri="/struts-tags" %>
      
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:600,400' rel='stylesheet' type='text/css'>
       <link rel="stylesheet" href="css/text.css">
        <link rel="stylesheet" href="css/rating.css">
       <script src="rating/jquery.js"></script>
        <script src="rating/jquery.rating.js"></script>
        <link href="css/start/jquery-ui-1.10.4.custom.css" rel="stylesheet">
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui-1.10.4.custom.js"></script>
      <script>
            
    $(function() {
        
        $("#overlay").hide();
        $("#signin").click(function(){
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
           $('#result').slideDown('slow');
            }
      
        });
    }  
        });
          $( document ).tooltip();
      var loginPos = $('#dialog');
      var contact = $("#contact");
      var about  =  $("#dialogAbout");
      var works =  $("#dialogWorks");
$("#lclose").click(function(){
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

$("#aboutClose").click(function(){
   // alert("done");
$("#overlay").hide();
location.reload(true);
});


$("#worksClose").click(function(){
   // alert("done");
 $("#overlay").hide();
location.reload(true);
});

$("#contactClose").click(function(){
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
                  //$("#dialog").show();
                   $("#overlay").show();
                  loginPos.show();
loginPos.animate({
    left: "35%",
    top: "-70%"
    
}, 500);
               
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
    
}, 500);  event.preventDefault();
                });
         

                // Hover states on the static widgets

            });
        </script>
        <style>
.loginPos
{
    z-index: 30;
    width: 450px;
    height: 450px;
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
         <div class="searchResult"></div>
        <div class="searchResultTop">
            <div class="zoom" id='zoom'> 
       <div class="zPropcontent">
    <div id="response" style="display: none;width:400px;height: 20px;padding-top: 3px;color: white;float:left;background: #1D3BFF;font-size: 17px;"></div>
         <form name="rateForm" method="post" id="rateForm" onsubmit="return rate();" action="rate">
            
          

                <%
                    String name = "";
                    String email = "";
                    //int pid = 0;
                   // String login = session.getAttribute("login").toString();
                   // {
                     if (session.getAttribute("name")==null) {
name="none";
                     } else {
                        name = session.getAttribute("name").toString();
                           email = session.getAttribute("email").toString();
                      }
                   
                    Profile p = (Profile) request.getAttribute("property");
                    if (p.getPname().equals("None")) {
                %>
                <div class="popMsg" title="Dialog Title">
                    <p>The property is not found....<br><br>Would you like to create now</p>
                </div>

                <%
                } else {
                    List clist = new ArrayList();
                    if(p.getComments()!=null)
                    clist = p.getComments();
                %>
                <input type="hidden" value="<%=(p.getPid())%>" name="pid"/>
                <div class="property">
                    <div class="profile">

                        <!--            <div style="background-color: gainsboro;float: right;width: auto;height: auto;padding: 2px 2px 2px 2px;margin-right: 2%;">Des/06/2014 at 7:20 pm</div>-->


                        <img src="<%=(p.getPimage())%>"  style="min-width: 200px;width: 200px;min-height: 120px;height: 120px;float: left;margin-left: 3%;margin-top: 2%;border: 4px solid aliceblue;color: white;"/>

                        <div style="color: white;width: auto;height: auto;float: left;padding: 8px 0px 0px 7px;font-size: 18px;margin-left: 1%;margin-top: 1%;"><%=(p.getPname())%></div><br><br>
                        <div style="color: white;width: auto;height: auto;padding: 5px 0px 0px 8px;margin-left: 27%;margin-top: 2%;margin-right: 25%;"><%=(p.getAddress())%></div>
                        <div style="float: left;width: 90%;height: 25px;margin-left: 3%;margin-right: 30%;margin-top: 2%;"><div style="background: white;float: left;width: 48%;height: 100%;">Overall Rating : <img src="<%=(request.getAttribute("prating").toString())%>"/></div><div style="float: left;width: 100px;height: 100%;"></div><div style="float: right;width: 100px;height: 100%;"><input type="button" onclick="rateMe();" value="Rate this Property" id="xxx" style="width: auto;background: #2191c0;height: 25px;color:white;cursor: pointer;"/></div></div>
                    </div>
                        <div class="rating">
                            <div style="width: 100%;color:gray;float: left;text-align: left;padding-left: 10px;margin-top: 10px;">Was/is your landlord a good communicator?<img src="<%=(request.getAttribute("rating1").toString())%>"/></div>
                            <div style="width: 100%;color:gray;float: left;text-align: left;padding-left: 10px;margin-top: 10px;">Did/does your landlord provide a functional property?<img src="<%=(request.getAttribute("rating2").toString())%>"/></div>
                            <div style="width: 100%;color:gray;float: left;text-align: left;padding-left: 10px;margin-top: 10px;">Do you feel the rent price is/was justified by your experience?<img src="<%=(request.getAttribute("rating3").toString())%>"/></div>
                            <div style="width: 100%;color:gray;float: left;text-align: left;padding-left: 10px;margin-top: 10px;">Did/does your landlord make timely repairs?<img src="<%=(request.getAttribute("rating4").toString())%>"/></div>
                            <div style="width: 100%;color:gray;float: left;text-align: left;padding-left: 10px;margin-top: 10px;">Would you recommend this landlord/property to a friend?<img src="<%=(request.getAttribute("rating5").toString())%>"/></div>
                        </div>
                </div>
                <div id="rateMe" class="zrateMe">

                    <div style="float: left;">Was/is your landlord a good communicator?: </div>   
                    <input type="radio"  name="rating" value="1" class="star">
                    <input type="radio"  name="rating" value="2" class="star">
                    <input type="radio"  name="rating" value="3" class="star">
                    <input type="radio"  name="rating" value="4" class="star">
                    <input type="radio"  name="rating" value="5" class="star">
                    <br><br>
                    <div style="float: left;">Did/does your landlord provide a functional property? (HVAC, Appliances, electricity, etc):</div> 
                    <input type="radio" name="rating2" value="1" class="star">
                    <input type="radio" name="rating2" value="2" class="star">
                    <input type="radio" name="rating2" value="3" class="star">
                    <input type="radio" name="rating2" value="4" class="star">
                    <input type="radio" name="rating2" value="5" class="star">
                    <br><br>
                    <div style="float: left;">Do you feel the rent price is/was justified by your experience?:</div> 
                    <input type="radio" name="rating3" value="1" class="star">
                    <input type="radio" name="rating3" value="2" class="star">
                    <input type="radio" name="rating3" value="3" class="star">
                    <input type="radio" name="rating3" value="4" class="star">
                    <input type="radio" name="rating3" value="5" class="star">
                    <br><br>
                    <div style="float: left;">Did/does your landlord make timely repairs?:</div> 
                    <input type="radio" name="rating4" value="1" class="star">
                    <input type="radio" name="rating4" value="2" class="star">
                    <input type="radio" name="rating4" value="3" class="star">
                    <input type="radio" name="rating4" value="4" class="star">
                    <input type="radio" name="rating4" value="5" class="star">
                    <br><br>
                    <div style="float: left;">Would you recommend this landlord/property to a friend?:</div> 
                    <input type="radio" name="rating5" value="1" class="star">
                    <input type="radio" name="rating5" value="2" class="star">
                    <input type="radio" name="rating5" value="3" class="star">
                    <input type="radio" name="rating5" value="4" class="star">
                    <input type="radio" name="rating5" value="5" class="star">
                    <br><br>
                    <textarea  placeholder="Comment about this property" name="comment" id="comment" class="zcomment" ></textarea><br>   
                    <br>
                    <div id="target" style="display: none;float:left;width: 100%;height: 40px;padding-left: 10px;padding-top: 4px;color: red;"></div>
                    <input type="submit" class="siginBtns" id="submit"  value="submit"/><br><br><br><br>
                </div>
                <!--    comment section-->
                <%
                    Iterator itr = clist.iterator();
                    int count = 1;
                    while (itr.hasNext()) {
                        Comments com = (Comments) itr.next();
                        int rate = com.getRating();
                        email=com.getEmail();
                %>

                <div class="zcoMments">
                    <div style="color: black;float: left;width: 100%;background-color: white;height:auto;border-top: 2px solid #999999;border-bottom:  3px solid #ccc;display:table;">


                        <div style="color:black;float: right;width: auto;height: auto;padding: 2px 2px 2px 2px;margin-right: 2%;font-size: 14px;"><%=(com.getDate())%></div>

                        <a href="#"  onclick="showProfile('<%=(com.getEmail())%>');" >
                          <img src="<%=(com.getImgPath())%>" style="min-width: 70px;width: 70px;min-height:70px;height:70px;float: left;margin-left: 3%;margin-top: 2%;border: 2px solid cornflowerblue;"/></a>

                        <div style="color: black;width: auto;height: auto;float: left;padding: 2px 0px 0px 2px;margin-left: 1%;margin-top: 2%;font-size: 16px;"><%=(com.getUser())%><br>
                            <%

                                for (int i = 1; i <= 5; i++) {
                                    if (rate == i) {
                            %>
                            <input name="<%=count%>" type="radio" class="star" disabled="disabled" checked="checked"/>
                            <%
                            } else {
                            %>
                            <input name="<%=count%>" type="radio" class="star" disabled="disabled"/>
                            <%
                                    }
                                }
                            %>


                        </div><br>
                        <div style="color: black;font-family: serif;font-size: 14px;width: 80%;height: auto;float: left;padding: 2px 0px 0px 2px;margin-left: 1%;margin-top: 1%;"><%=(com.getComment())%></div>


 <a href="#"  onclick="showProfile('<%=(com.getEmail())%>');" >
                            <div  id="imgbox<%=(com.getCid())%>" style="background: #0078ae;color: white;width: 140px;height: 30px;float: right;margin-left: 3%;margin-top: 2%;" onclick="abusive('<%=(com.getCid())%>');"><img src="images/down.png" width="20" height="20"/>Report Abusive</div></a>
                    </div>


                </div>

                <%
                            count++;
                        }
                    }
                %> 
                <input type="hidden" value="<%=name%>" id="name" name="name"/>
                <input type="hidden" value="<%=email%>" name="email"/> 


             
        </form>
                </div>
            </div>
        </div>
                
 <!-- ui-dialog -->
        <div id="dialog" class="loginPos">
            <div class="dialogTitles">welcome to BEGOH
                <img src="neo/cross.png" title="Close" id='lclose' style='float:right;margin-right: 10px;cursor: pointer;' width="15" height="15"/>
            </div>
            <div id="loginPage" style="margin-top:20px;">
                <div id="result" style="display: none;width: auto;margin-bottom: 10px;color: red;font-size: 16px;"></div>
                <div class="logFields">
                    <s:form theme="bootstrap" cssStyle="margin-left:30px;width:350px;" cssClass="well form-vertical">
                        <s:textfield id="email" onchange="testId();" placeholder="Enter Email" cssStyle="width:300px;height:30px;" />
                        <s:password id="pass" placeholder="Enter Password" cssStyle="width:300px;height:30px;" />
                    <div class="siginBtn" id="signin">Sign In</div>
                    </s:form>
                </div>
                <br>

                <div class="connect">
                    Or sign up / sign in with  <img src="neo/face.png" width="28" height="28"/>  <img src="neo/google-plus.png" width="30" height="30"/>  <img width="30" height="30" src="neo/in.png"/> <a href="userProfile.jsp"><img width="40" height="40" src="neo/mail.png"/></a>
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
 
 <jsp:include page="contact.jsp"/>
    </body>
</html>


<script type='text/javascript'>
    function showProfile(user)
    {
        $.post("getProfile.jsp", {email: "" + user + ""}, function(data) {

            $('#content').hide();
            $('#content').html(data);
            $('#content').slideToggle();
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
            $("#target").html('You must login to Comment please...Login');
            $("#target").slideToggle('slow');
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

   
</script>
