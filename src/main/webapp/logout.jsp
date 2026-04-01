<%-- 
    Document   : logout
    Created on : 30 Sept 2025, 9:23:05 pm
    Author     : padol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
    // Invalidate the session
    HttpSession session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }

    // Redirect to login page
    response.sendRedirect("login.jsp");
%>

    </body>
</html>
