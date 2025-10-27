package controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// This annotation maps all your "virtual" URLs to this one servlet
@WebServlet(urlPatterns = {"/features", "/how-it-works", "/pricing", "/contact"})
public class PageController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get the URL path that was requested
        String path = request.getServletPath();
        String targetPage = null;

        // 2. This is your "Router Logic"
        // It maps the URL path to the actual JSP file
        switch (path) {
            case "/features":
                // You could add logic here, e.g., fetch features from DB
                // request.setAttribute("featureList", featureService.getAll());
                targetPage = "features.jsp";
                break;
            case "/how-it-works":
                targetPage = "how-it-works.jsp";
                break;
            case "/pricing":
                // Maybe fetch pricing tiers?
                targetPage = "pricing.jsp";
                break;
            default:
                // Handle 404 or redirect to home
                targetPage = "index.jsp";
                break;
        }

        // 3. Forward the request to the correct JSP page
        // The forward happens on the server, the user's URL stays clean
        RequestDispatcher dispatcher = request.getRequestDispatcher(targetPage);
        dispatcher.forward(request, response);
    }
}
