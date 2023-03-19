<%-- 
    Document   : adminlogin
    Created on : 29 Aug, 2022, 12:45:16 AM
    Author     : ashok
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
        <%@ page import="panda.Prdy" %>
        
       <%
            String uname,pswd;
            uname = request.getParameter("uname");
            pswd = request.getParameter("pswd");
            Prdy obj =new Prdy();
            int flag =0;
             Connection conn = null;  
        try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            Statement stmt  = conn.createStatement();  
            ResultSet rs    = stmt.executeQuery("select * from customer");  
        
            while (rs.next()) {  
                String unameDB = rs.getString("name");
                String pswdDB = rs.getString("password");
                
               if(unameDB.equals(uname) && pswdDB.equals(pswd))
               {
                   flag=1;
                   break;
               }
                   
               }
                   
            }
              
        catch (SQLException e) {  
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
            if(flag==1){
                out.println("Logged in success fully ");
                out.println("<h1 style='text-align: center'>Welcome  "+uname+"</h1>");
                %>
                <jsp:include page="productadmi.jsp"/>
        <%
                
            }

            else
            {%>
            
            <h1 style="text-align: center"> Billing system</h1>
            <h3 style="text-align: center">  Invalid Username or Password
                <a href="javascript:window.history.back()">Try again</a></h3>
                
            <%}
                
        %>
    </body>
</html>
