<%-- 
    Document   : bill
    Created on : 29 Aug, 2022, 12:13:45 AM
    Author     : ashok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}
            tr:nth-child(even) {background-color: #f2f2f2;}
        </style>
    </head>
    <body style="background-color:powderblue;">
        <%@ page import="java.sql.*"%>
        <%@ page import="java.sql.*" %>
        <h1 style='text-align: center'>Billing System</h1>
        <h3 style="text-align: center">Bill amount</h3>
        <table style="margin-left: auto;margin-right: auto; border: 1px solid black;">
                    <tr>
                        <th>S.no</th><th>Products</th><th>Cost</th><th>Quantity</th><th>Total</th></tr>
        <%
            Connection conn = null;
            try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            Statement stmt  = conn.createStatement();  
            ResultSet rs    = stmt.executeQuery("select * from product");  
        int total=0;
            while (rs.next()) {  
                String sno = rs.getString("sno");
                String product = rs.getString("product");         
                int cost=rs.getInt("cost"),cost1=1;
                
                int quan=Integer.parseInt(request.getParameter(sno));
                if(quan>0){
                    cost1=cost*quan;
                out.println("<tr><td>"+sno+"</td><td>"+product+"</td><td>"+cost+"</td><td>"+quan+"</td><td>"+cost1+"</td></tr>");
                total=total+cost1;
                }
            }
            out.println("<tr><td></td><td></td><td></td><td>Total=</td><td>"+total+"</td></tr>");
              
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
              
                </table>
    </body>
</html>
