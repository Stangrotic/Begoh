<%@page import="pojos.Replies"%>
<%@page import="pojos.RepliesList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<div class="Repzoom">
    
<%
    
    List list = new ArrayList();
     RepliesList rlist = new RepliesList();
    rlist = (RepliesList)request.getAttribute("rlist");
    int rating = rlist.getRating();
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
    %>
    <div class="com">
    <a href="#"  onclick="showProfile('<%=(rlist.getUser())%>');" id="img">
                            <img src="<%=(rlist.getUserImage())%>" class="img-circle" style="width:50px;height: 50px;"  /></a>
                            <div class="rat"><%=(rlist.getName())%><img src="<%=path%>" /></div>
                            <div class="comBox"><%=(rlist.getComment())%></div>  
                            <div class="date">
                                <%=(rlist.getDate())%><br>
                                <button type="button" onclick="sendBack('<%=(session.getAttribute("pid").toString())%>');" class="btn btn-primary">Back</button> 
                            </div> 
</div>
    <%
    list = rlist.getReplies();
 Iterator itr = list.iterator();
    while(itr.hasNext())
    {
        Replies rep = (Replies)itr.next();
     %>
   <div class="com">
    <a href="#"  onclick="showProfile('<%=(rep.getUser())%>');" id="img">
                            <img src="upload/<%=(rep.getImgName())%>" class="img-circle" style="width:50px;height: 50px;"  /></a>
                            <div class="rat"><%=(rep.getName())%></div>
                            <div class="comBox"><%=(rep.getReply())%></div>  
                            <div class="date">
                                <%=(rep.getRdate())%><br>
                                
                            </div> 
</div>
     <%
    }
        %>
        </div>