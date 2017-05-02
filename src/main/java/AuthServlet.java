import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ferdyrod on 5/2/17.
 */
public class AuthServlet extends HttpServlet {

    public AuthServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("testing") != null) {
            UserService userService = UserServiceFactory.getUserService();
            User currentUser = userService.getCurrentUser();
            if (currentUser != null) {
                response.getWriter().println("Welcome to Register " + currentUser.getNickname());
            } else {
                response.sendRedirect(userService.createLoginURL(request.getRequestURI()));
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        UserService userService = UserServiceFactory.getUserService();
//        if (userService.isUserLoggedIn()) {
//            User user = userService.getCurrentUser();
//            request.getSession().setAttribute("user", user.getNickname());
//        }
    }
}
