<%-- 
    Document   : deleteM
    Created on : Jul 19, 2018, 12:42:06 PM
    Author     : nikitatribhuvan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="styles.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete a record</title>
    </head>
    <body>
        
        <h1>Details of the movie to be deleted</h1> 
        
        <form action="index.jsp" method="POST">
            
            <input type="textbox" name="formName" value="deleteForm" hidden /> 
            
            <table>
                <tr>
                    <td>Title*:</td>
                    <td><input type="textbox" name="title" required /> </td>
                </tr>
                
                <tr>
                    <td>Year*: </td>
                    <td><input type="textbox" name="year" required /> </td>
                 </tr>
                 
                 <tr>
                     <td><button type="button" onclick="window.location='index.jsp'"/> HOME </td>
                    <td></td>
                    <td></td>
                    <td><td><button type="submit" /> DELETE </td> </td>
                </tr>
                 
            </table>
            
            
            
        </form>
        
    </body>
</html>
