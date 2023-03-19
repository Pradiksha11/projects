<%-- 
    Document   : addproductinDB
    Created on : 4 Sep, 2022, 11:29:03 AM
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
                       <%
                           String product=request.getParameter("product");
                           int cost=Integer.parseInt(request.getParameter("cost"));
                            Connection conn = null; 
                           try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            PreparedStatement stmt  = null; 
            String query="insert into product (product,cost)"+"values(?,?)";  
            stmt=conn.prepareStatement(query);
            stmt.setString(1,product);
            stmt.setInt(2,cost);
            int status = stmt.executeUpdate();
            if(status > 0) {
                out.println("Product added successfully");
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
