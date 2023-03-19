<%-- 
    Document   : updateinDb
    Created on : 4 Sep, 2022, 12:52:23 PM
    Author     : ashok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@ page import="java.sql.*" %>  
          
        <%              String sno=request.getParameter("sno");
                           String product=request.getParameter("product");
                           int cost=Integer.parseInt(request.getParameter("cost"));
                            Connection conn = null; 
                           try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            PreparedStatement stmt  = null; 
            String query="update product set product='"+product+"',cost="+cost+" where sno="+sno;  
            stmt=conn.prepareStatement(query);
            int status = stmt.executeUpdate();
            if(status > 0) {
                out.println("Product update successfully");
                %>
                <jsp:include page="productadmi.jsp"/>
        <%
            }
else{
%>
<jsp:include page="productadmi.jsp"/>
         <%
}

              
        } catch (SQLException e) {  
            out.println(e.getMessage());  
        } finally {  
            try {  
                if (conn != null) {  
                    conn.close();  
                }  
            } catch (SQLException ex) {  
                out.println(ex.getMessage());  
            }  
        }  
                            %>
    </body>
</html>
