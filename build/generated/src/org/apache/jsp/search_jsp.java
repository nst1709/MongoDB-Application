package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link href=\"styles.css\" rel=\"stylesheet\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Query the movie database</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Enter the fields to search on </h1>\n");
      out.write("        \n");
      out.write("        <form action=\"index.jsp\" method=\"POST\">\n");
      out.write("            \n");
      out.write("            <input type=\"textbox\" name=\"formName\" value=\"searchForm\" hidden /> \n");
      out.write("            \n");
      out.write("            <table>\n");
      out.write("                <tr class=\"heading\">\n");
      out.write("                    <td> <h4> Movie Details </h4> </td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td>Title:</td>\n");
      out.write("                    <td><input type=\"textbox\" name=\"title\" /> </td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td>Year: </td>\n");
      out.write("                    <td><input type=\"textbox\" name=\"year\" /> </td>\n");
      out.write("                 </tr>\n");
      out.write("                 \n");
      out.write("                <tr>\n");
      out.write("                    <td>Genres: </td>\n");
      out.write("                    <td><input type=\"textbox\" name=\"genres\" /> </td>\n");
      out.write("                 </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td><button type=\"button\" onclick=\"window.location='index.jsp'\"/> HOME </td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td><button type=\"submit\" /> SEARCH </td> \n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("        </form>\n");
      out.write("\n");
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
