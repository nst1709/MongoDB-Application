package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mongodb.client.MongoCursor;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import org.bson.Document;
import com.mongodb.client.MongoCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoDatabase;
import com.mongodb.MongoClient;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"styles.css\" rel=\"stylesheet\">\n");
      out.write("        <title>Query IMDB Movies</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>MongoDB Operations on IMDB dataset</h1>\n");
      out.write("        \n");
      out.write("        <div id=\"options\">\n");
      out.write("            <button onclick=\"window.location='insert.jsp'\">INSERT A NEW MOVIE</button>\n");
      out.write("            <button onclick=\"window.location='update.jsp'\">UPDATE AN EXISTING MOVIE</button><br>\n");
      out.write("            <button onclick=\"window.location='deleteM.jsp'\">DELETE A MOVIE RECORD</button>\n");
      out.write("            <button onclick=\"window.location='search.jsp'\">SEARCH FOR A MOVIE</button><br>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div id=\"result\">\n");
      out.write("            ");

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
                
            
      out.write("\n");
      out.write("\n");
      out.write("            <h2> ");
      out.print( output );
      out.write(" </h2>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
