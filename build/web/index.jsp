<%-- 
    Document   : index
    Created on : Jul 18, 2018, 2:59:43 PM
    Author     : nikitatribhuvan
--%>

<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles.css" rel="stylesheet">
        <title>Query IMDB Movies</title>
    </head>
    <body>
        <h1>MongoDB Operations on IMDB dataset</h1>
        
        <div id="options">
            <button onclick="window.location='insert.jsp'">INSERT A NEW MOVIE</button>
            <button onclick="window.location='update.jsp'">UPDATE AN EXISTING MOVIE</button><br>
            <button onclick="window.location='deleteM.jsp'">DELETE A MOVIE RECORD</button>
            <button onclick="window.location='search.jsp'">SEARCH FOR A MOVIE</button><br>
        </div>
        
        <div id="result">
            <%
                MongoClient client = new MongoClient( "localhost" , 27017 );
                MongoDatabase database = client.getDatabase("imdb"); 
                Document insertDoc = new Document();
                MongoCollection<Document> movies = database.getCollection("Movies");
                
                String output = "";
                
                if (request.getParameter("formName") != null){
                    
                    if (request.getParameter("formName").equals("insertForm")){
                
                        insertDoc.append("title", request.getParameter("title"));
                        insertDoc.append("year", Integer.parseInt(request.getParameter("year")));

                        String[] genreSplit = request.getParameter("genres").split(",");
                        ArrayList genreList = new ArrayList();
                        for (String g : genreSplit) {
                            genreList.add(g);
                        }
                        insertDoc.append("genres", genreList);

                        Map directors = new HashMap<String, String>();
                        directors.put("first", request.getParameter("directorFirst"));
                        directors.put("last", request.getParameter("directorLast"));

                        ArrayList directorArray = new ArrayList();
                        directorArray.add(directors);

                        insertDoc.append("directors", directorArray);

                        Map actors = new HashMap<String, String>();
                        actors.put("first", request.getParameter("actorFirst"));
                        actors.put("last", request.getParameter("actorLast"));
                        actors.put("gender", request.getParameter("gender"));
                        actors.put("role", request.getParameter("role"));

                        ArrayList actorArray = new ArrayList();
                        actorArray.add(actors);

                        insertDoc.append("actors", actorArray);

                        movies.insertOne(insertDoc);

//                        output += insertDoc+"<br>";
                        output += "Record inserted sucessfully!!";
                    }
                    
                    else if (request.getParameter("formName").equals("deleteForm")){
                        insertDoc.append("title", request.getParameter("title"));
                        insertDoc.append("year", Integer.parseInt(request.getParameter("year")));
                        
                        movies.deleteOne(insertDoc);
                        
//                        output += insertDoc+"<br>";
                        output += "Record deleted sucessfully!!";
                    
                    }
                    
                    else if (request.getParameter("formName").equals("updateInfo")){
                        insertDoc.append("title", request.getParameter("title"));
                        insertDoc.append("year", Integer.parseInt(request.getParameter("year")));
                        
                        Document updateDoc = new Document();
                        
                        if (!request.getParameter("genres").isEmpty()){
                            String[] genreSplit = request.getParameter("genres").split(",");
                            ArrayList genreList = new ArrayList();
                            for (String g : genreSplit) {
                                genreList.add(g);
                            }
                            updateDoc.append("genres", genreList);
                        }
                        

                        if (!request.getParameter("directorFirst").isEmpty())
                            updateDoc.append("directors.0.first", request.getParameter("directorFirst"));
                        if (!request.getParameter("directorLast").isEmpty())
                            updateDoc.append("directors.0.last", request.getParameter("directorLast"));
                            
                        if (!request.getParameter("actorFirst").isEmpty())
                            updateDoc.put("actors.0.first", request.getParameter("actorFirst"));
                        if (!request.getParameter("actorLast").isEmpty())
                            updateDoc.put("actors.0.last", request.getParameter("actorLast"));
                        if ((!request.getParameter("gender").isEmpty()) && (request.getParameter("gender") != ""))
                            updateDoc.put("actors.0.gender", request.getParameter("gender"));
                        if (!request.getParameter("role").isEmpty())
                            updateDoc.put("actors.0.role", request.getParameter("role"));
                    
                        if (!updateDoc.isEmpty()){
                            Document setDoc = new Document("$set", updateDoc);
                        
                            movies.updateOne(insertDoc, setDoc);
                        
//                            output += insertDoc+"....."+updateDoc+"<br>";
                            output += "Record updated sucessfully!!";
                        }
                        else
                            output += "Enter valid values and try again!";
                    
                    }
                    
                    if (request.getParameter("formName").equals("searchForm")){
                        
                        Document p = new Document("title", "");
                                
                        if (!request.getParameter("title").isEmpty())
                            insertDoc.append("title",new Document("$regex","^(?=.*"+request.getParameter("title")+").*$").append("$options","i"));
                        
                        if (!request.getParameter("year").isEmpty())
                            insertDoc.append("year", Integer.parseInt(request.getParameter("year")));
                     
                        if (!request.getParameter("genres").isEmpty()){
                            String[] genreSplit = request.getParameter("genres").split(",");
                            ArrayList genreList = new ArrayList();
                            for (String g : genreSplit) {
                                genreList.add(g);
                            }
                            insertDoc.append("genres", genreList);
                        }
                    
                        if (!insertDoc.isEmpty()){
                            MongoCursor<Document> cursor = movies.find(insertDoc).projection(p).iterator();
                            output += "Results! <br><br>";
                                try {
                                    System.out.println("*******Results********");

                                    if (!cursor.hasNext())
                                            output += "No results were found. Please try again.\n";

                                    while (cursor.hasNext()) {
//                                        output += insertDoc+"<br>";
                                        output += cursor.next().getString("title")+"<br>";
                                    }
                                } catch (Exception e){
                                    System.out.println(e);
                                }
                            }
                            else
                                output += "No criteria specified!";
                    }
                    
                }
                
            %>

            <h2> <%= output %> </h2>
        </div>
        
    </body>
</html>
