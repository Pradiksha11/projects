<%-- 
    Document   : validate
    Created on : Jul 25, 2022, 11:16:21 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:powderblue;">
        <%@ page import="java.sql.*" %>
         <h1 style='text-align: center'>Billing System</h1>
        <%
            String uname,pswd,mobi,email;
            uname = request.getParameter("uname");
            email=request.getParameter("email");
            mobi=request.getParameter("mobile");
            pswd = request.getParameter("pswd");
             Connection conn = null;  
        try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            PreparedStatement pstmt = null;
            String query = "INSERT INTO customer(name, mobile,email,password)" + "VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, uname);
            pstmt.setString(2,mobi);
            pstmt.setString(3,email);
            pstmt.setString(4, pswd);  
            int status = pstmt.executeUpdate();
            if(status > 0) {%>
            User added successfully !!!<br>
                <jsp:include page="login.jsp"/>
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
        <%
            
            
        %>
    </body>
</html>
