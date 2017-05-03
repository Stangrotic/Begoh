<%
	        String redirectURL = session.getAttribute("myUrl").toString();
                out.print(redirectURL);
	        response.sendRedirect(redirectURL);
	    %>