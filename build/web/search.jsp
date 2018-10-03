<%-- 
    Document   : search
    Created on : Jul 19, 2018, 8:47:24 PM
    Author     : nikitatribhuvan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="styles.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query the movie database</title>
    </head>
    <body>
        <h1>Enter the fields to search on </h1>
        
        <form action="index.jsp" method="POST">
            
            <input type="textbox" name="formName" value="searchForm" hidden /> 
            
            <table>
                <tr class="heading">
                    <td> <h4> Movie Details </h4> </td>
                </tr>
                
                <tr>
                    <td>Title:</td>
                    <td><input type="textbox" name="title" /> </td>
                </tr>
                
                <tr>
                    <td>Year: </td>
                    <td><input type="textbox" name="year" /> </td>
                 </tr>
                 
                <tr>
                    <td>Genres: </td>
                    <td><input type="textbox" name="genres" /> </td>
                 </tr>
                
                <tr>
                    <td><button type="button" onclick="window.location='index.jsp'"/> HOME </td>
                    <td></td>
                    <td></td>
                    <td><button type="submit" /> SEARCH </td> 
                </tr>
                
            </table>
            
        </form>

    </body>
</html>
