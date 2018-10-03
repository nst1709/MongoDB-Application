<%-- 
    Document   : updateInfo
    Created on : Jul 19, 2018, 7:26:42 PM
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
        
        <form action="index.jsp" method="POST" >
            
            <input type="textbox" name="formName" value="updateInfo" hidden /> 
            
            <table>
                <tr>
                    <td>Genres: </td>
                    <td><input type="textbox" name="genres" /> </td>
                    <td id="condition">(Can have multiple values separated by a comma)</td>
                 </tr>
                 
                <tr class="heading">
                    <td> <h4> Director Details </h4> </td>
                </tr>
                
                <tr>
                    <td>First name: </td>
                    <td><input type="textbox" name="directorFirst" /> </td>
                    <td class="det">Last name:</td>
                    <td><input type="textbox" name="directorLast" /> </td>
                </tr>
                
                <tr class="heading">
                    <td> <h4> Actor Details </h4> </td>
                </tr>
                
                <tr>
                    <td>First name: </td>
                    <td><input type="textbox" name="actorFirst" /> </td>
                    <td class="det">Last name:</td>
                    <td><input type="textbox" name="actorLast" /> </td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <select name="gender">
                            <option value=""> Select an option </option>
                            <option value="M"> Male </option>
                            <option value="F"> Female </option>
                        </select>
                    </td>
                    <td class="det">Role:</td>
                    <td><input type="textbox" name="role" /> </td>
                </tr>
                
                <tr>
                    <td><button type="button" onclick="window.location='update.jsp'"/> BACK </td>
                    <td></td>
                    <td></td>
                    <td><button type="submit"/> UPDATE </td>
                </tr>
                
            </table>
            
            <input type="textbox" name="title" value="<%= request.getParameter("title") %>" hidden/>
            <input type="textbox" name="year" value="<%= request.getParameter("year") %>" hidden /> 

        </form>
    </body>
</html>
