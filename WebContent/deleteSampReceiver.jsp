<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.userVariable"%>
<jsp:useBean id="u" class="loginVar.userVariable"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    UserQuery.deleteLabExp(u);
    session.setAttribute("deleteRec", "");
    response.sendRedirect("viewSampReceiver.jsp");
%>
