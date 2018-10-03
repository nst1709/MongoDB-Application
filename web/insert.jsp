<%-- 
    Document   : create
    Created on : Jul 17, 2018, 8:55:05 PM
    Author     : nikitatribhuvan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="styles.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert a new data entry</title>
    </head>
    <body>
        <h1>Insert a new data entry</h1>
        
        <form action="index.jsp" method="POST">
            
            <input type="textbox" name="formName" value="insertForm" hidden /> 
            
            <table>
                <tr class="heading">
                    <td> <h4> Movie Details </h4> </td>
                </tr>
                
                <tr>
                    <td>Title*:</td>
                    <td><input type="textbox" name="title" required /> </td>
                </tr>
                
                <tr>
                    <td>Year*: </td>
                    <td><input type="textbox" name="year" required /> </td>
                 </tr>
                 
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
                    <td><button type="button" onclick="window.location='index.jsp'"/> HOME </td>
                    <td></td>
                    <td></td>
                    <td><button type="submit" /> SUBMIT </td> 
                </tr>
                
            </table>
            
        </form>
        
    </body>
</html>
