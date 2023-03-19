<%-- 
    Document   : delete
    Created on : 3 Sep, 2022, 10:53:16 PM
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
         
                       <%
                           String sno=request.getParameter("sno");
                     
                            Connection conn = null; 
                           try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            PreparedStatement stmt  = null; 
            String query="delete from product where sno ="+sno;  
            stmt=conn.prepareStatement(query);
            int status = stmt.executeUpdate();
            if(status > 0) {
                out.println("Product deleteed successfully");
                %>
                <jsp:include page="productadmi.jsp"/>
        <%
            }
else{
%>
<jsp:include page="productadmi.jsp"/>
        <%}
            
              
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
