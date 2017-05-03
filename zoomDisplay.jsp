<%@page import="pojos.Comments"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="pojos.Profile"%>
  <link rel="stylesheet" href="css/text.css">
        <link rel="stylesheet" href="css/rating.css">
       <script src="rating/jquery.js"></script>
        <script src="rating/jquery.rating.js"></script>
       
  
        <div class="Repzoom" id="zoomCode">
    <div id="response" style="padding-bottom: 10px;display: none;width:400px;height: 40px;padding-top: 3px;color: white;float:left;background: #1D3BFF;font-size: 17px;"></div>
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
                    clist = p.getComments();
                %>
                <input type="hidden" value="<%=(p.getPid())%>" id="PID" name="pid"/>
                <div class="property">
                    <div class="profile">

                        <!--            <div style="background-color: gainsboro;float: right;width: auto;height: auto;padding: 2px 2px 2px 2px;margin-right: 2%;">Des/06/2014 at 7:20 pm</div>-->


                        <img src="<%=(p.getPimage())%>" class="thumbnail"  style="min-width: 200px;width: 200px;min-height: 140px;height: 140px;float: left;margin-left: 3%;margin-top: 2%;border-radius: 10px;"/>

                        <div style="color: white;width: auto;height: auto;float: left;padding: 8px 0px 0px 7px;font-size: 18px;margin-left: 3%;margin-top: 1%;font-weight: bold;"><%=(p.getPname())%></div><br><br>
                        <div style="font-size: 1.3em;float: left;color: white;width: auto;height: auto;margin-left:4%;margin-top: 2%;text-align: left;"><%=(p.getType())%><br><%=(p.getStreet())%><br><%=(p.getCity())%><br><%=(p.getZip())%><br><%=(p.getState())%>, <%=(p.getCountry())%></div>
                        <div style="float: left;width: 90%;height: 25px;margin-left: 3%;margin-right: 30%;margin-top: 2%;"><div style="background: white;float: left;width: 70%;height: 100%;border-radius: 10px;">Overall Rating : <img src="<%=(request.getAttribute("prating").toString())%>"/> Users <span class="badge"><%=(p.getRateCount())%></span></div><div style="float: right;width: 100px;height: 100%;"><input type="button" onclick="rateMe();" value="Rate this Property" id="xxx" class="btn btn-xs btn-info" /></div></div>
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
                    <input type="submit" class="btn btn-primary" id="submit"  value="submit"/><br><br><br><br>
                </div>
                <!--    comment section-->
                <%
                    Iterator itr = clist.iterator();
                    int count = 1;
                    while (itr.hasNext()) {
                        Comments com = (Comments) itr.next();
                        int rating = com.getRating();
                         String path = "";
     if(rating<=20 && rating>1)
       {
        path =  "stars/1star.png";
       }
       else if(rating<=40 && rating>20)
       {
           path = "stars/2star.png";
       }
       else if(rating<=60 && rating>40)
       {
         path = "stars/3star.png";
       }
       else if(rating<=80 && rating>60)
       {
         path =  "stars/4star.png";
       }
       else if(rating<=100 && rating>80)
       {
           path =  "stars/5star.png";
       }
                        email=com.getEmail();
                %>

                <div class="com">
                  <a href="#"  onclick="showProfile('<%=email%>');" id="img" >
                            <img src="<%=(com.getImgPath())%>" class="img-circle" style="width:50px;height: 50px;" /></a>
 <div class="rat"><%=(com.getUser())%><img src="<%=path%>" /></div>
 
                            
                        <div class="comBox"><%=(com.getComment())%></div>
                  <div class="date">      
                        <div class="pills"><%=(com.getDate())%></div>
                        <div class="pills">
                            <button type="button" class="btn btn-xs btn-default">
            <span class="glyphicon glyphicon-usd">Donate</span> 
        </button>
<a href="#" style="float:right;"  >
                            <div  id="imgbox<%=(com.getCid())%>" class="btn btn-xs btn-danger" onclick="abusive('<%=(com.getCid())%>');">Abuse</div></a>
 
<a href="#" style="float:right;margin-right: 1%;"  >
                            <div   class="btn btn-xs btn-info" onclick="rebuttalShow('<%=(com.getCid())%>');">Rebuttal</div></a>
                   <a href="javascript:replies('<%=(com.getCid())%>');" style="float:right;margin-right: 1%;" >Replies <span class="badge"><%=(com.getReplies())%></span></a>
                            
                        </div>
                  </div>
<div id="rebuttal<%=(com.getCid())%>" class="rebuttal">
    <textarea  placeholder="type your text here..." name="comment" id="rebutCom<%=(com.getCid())%>" class="zcomment" ></textarea>
<div   class="btn btn-xs btn-info" onclick="rebuttal('<%=(com.getCid())%>');">submit</div>
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
                