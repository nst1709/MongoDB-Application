<%-- 
    Document   : update
    Created on : Jul 19, 2018, 5:15:53 PM
    Author     : nikitatribhuvan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="styles.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update an existing movie record</title>
    </head>
    <body>
        <h1>Enter the details of the movie to be updated</h1>
        <form action="updateInfo.jsp" method="POST">
            
            <input type="textbox" name="formName" value="updateDet" hidden /> 
            
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
                    <td><button type="submit"/> NEXT </td>
                </tr>
            </table>
        </form>
    </body>
</html>
