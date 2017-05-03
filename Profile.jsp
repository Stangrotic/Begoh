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
        <link href='http://fonts.googleapis.com/css?family=Fira+Sans:400,600' rel='stylesheet' type='text/css'>
        <title>jQuery UI Example Page</title>
         <link href="css/start/jquery-ui-1.10.4.custom.css" rel="stylesheet">
        <link type="text/css" href="css/text.css" rel="stylesheet" />
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery-ui-1.10.4.custom.js"></script>

        <script>
                    $(function() {
                  var email = document.getElementById("email").value;
                  var Me = document.getElementById("Me").value;
                  // alert(Me);
                        $( "#allComments" ).load( "getComments", { email: ""+email+"",Me: ""+Me+"" }, function() {
  //alert( "The last 25 entries in the feed have been loaded" );
});
      
                        
                            $(".ui-dialog-titlebar").hide();
                    

$("#onWall").click(function(){
    var post = document.getElementById("mywall").value;                              
       var email = document.getElementById("email").value;
       if(post===null || post==="")
       {
          document.getElementById("mywall").placeholder = "please type here";
       }
       else{
    $.post("postOnWall",{post:""+post+"",email:""+email+""},function(data){
       // $("#resp").hide('slow');
        $( "#allComments" ).html(data);
        //$("#resp").show('slow');
        document.getElementById("mywall").value = "";
         
    });
       }
});



                    });        </script>
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
        
        <jsp:include page="menu.jsp" />    


        <%--logo
        <div class="header" >
            <div class="logo"><img src="images/logo.png" width="50" height="50"></div>
                
        </div>
         logo ends--%>
 <!-- ui-dialog -->


<%@page import="pojos.User"%>
<div class="contentProOverlay"></div>
<div class="contentPro">
    <div class="proLeftPane">
<%
      if(session.getAttribute("name")==null)
                {
                    %>
                    <jsp:forward page="index.jsp"/>
                    
                    <%
                }
      else{
    int z =0;
            if(session.getAttribute("pid")!=null){
          z  = Integer.parseInt(session.getAttribute("pid").toString());
            }
    User user = (User)request.getAttribute("profile");
    %>
    <div class="proImage" > <img src="upload/<%=(user.getImgName())%>" class="img-circle" style="float: left;margin-left: 4%;margin-top: 4%;width:100px;height: 100px;"/> </div>
    <div class="proAddress"> 
        <input type="hidden" id="email" value="<%=(user.getEmail())%> "/>
        <table class="table">
          
                <tr>
                    
                    <td><%=(user.getName())%>  <%=(user.getLname().charAt(0))%></td>
                    
                </tr>
                <tr>
                    <td>Blurb</td>
                </tr>
               <tr>
                   <td><div style="color: #666666"><%=(user.getAboutU())%></div> </td>
                    
                </tr>
           
        </table>
        <%
        if(z!=0)
      {
        %>
    <button type="button" onclick="sendBack('<%=z%>');" class="btn btn-primary">Back</button> 
     <%
                }
     if(session.getAttribute("email").toString().equals(user.getEmail()))
        {
     %>
     <input type="hidden" value="true" id="Me"/>
     <button type="button" onclick="settings();" class="btn btn-primary">Settings</button> 
      <button type="button" onclick="logout();" class="btn btn-primary">Logout</button> 
    <%
        }
     else{
        %>
        <input type="hidden" value="false" id="Me"/> 
        <button type="button" id="donate-link" class="btn btn-primary">
            <span class="glyphicon glyphicon-usd">Donate</span> 
        </button>
       
    <% 
     }
     session.setAttribute("pid", "0");
    %>
    </div>
    </div>
    <div class="proRightPane">
        
        <div style="width:100%;color: #0072ab;font-size: 1.2em; ">Wall Posts</div>
        <div class="allComments" id="allComments">
            
            
            
        </div>
        <%
       // if(!session.getAttribute("email").toString().equals(user.getEmail()))
        //{
        %>
        <textarea id="mywall" placeholder="post on wall..." class="myWall" autofocus="true"></textarea>
        <div id="resp"></div>
        <button type="button" id="onWall" class="btn btn-primary">Post</button> 
        <%
      }
//}
        %>
    </div>
    </div>
    




        <jsp:include page="contact.jsp"/>
    </body>
</html>
<script>
function delPost(pno)
{
    $.post("delPost", {pno: "" + pno + ""}, function(data) {
            $("#post"+pno).hide('slow');
            });
}
function settings()
{
    window.location = "settings.jsp";
}

function logout()
{
    window.location = "logout";
}

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
    
     function rebuttal(cno)
    {
    // alert(cno);
    $("#response").hide('slow');
    var login = document.getElementById("name").value;
    var comment = document.getElementById("rebutCom"+cno).value;
    if(comment==="" || comment===null)
    {
        document.getElementById("rebutCom"+cno).placeholder = "please type here...";
    }
    else
            if (login === "none")
    {
    $myWindow.dialog("open");
    }
    else {
    $.post("rebuttal", {cno: "" + cno + "",comment: ""+comment+""}, function(data) {
    $("#response").hide('slow');
            $("#response").html(data);
            $("#response").slideDown('slow');
            $("#rebuttal" + cno).hide('slow');
           $("#rebutCom"+cno).html(" "); 
    });
    }
    }

 function rebuttalShow(cno)
    {
        
        $("#rebuttal"+cno).slideToggle('slow');
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
      window.location = "refineRedirect?pid="+pid;
    //  $( "#zoom" ).load( "zoomDisp", { key: ""+pid+"" }, function() {
  //alert( "The last 25 entries in the feed have been loaded" );
//});
      
  }
  
  
   function showProfile(user)
    {
        //alert(user);
        $.post("getProfile", {email: "" + user + ""}, function(data) {
 //alert(user);
           // $('#zoom').hide('slow');
            $('#zoom').html(data);
           // $('#zoom').show();
        });
    }
</script>
