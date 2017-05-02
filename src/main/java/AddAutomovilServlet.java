import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import models.Automovil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ferdyrod on 5/2/17.
 */
public class AddAutomovilServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Automovil automovil;

        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        if(user != null){
            String make = request.getParameter("make");
            String model = request.getParameter("model");
            String year = request.getParameter("year");

            if(make.isEmpty() || model.isEmpty() || year.isEmpty()){
                response.sendRedirect(request.getRequestURI());
            } else {
                automovil = new Automovil(make, model, year);
                ObjectifyService.ofy().save().entities(automovil).now();
            }
        } else {
            response.sendRedirect(userService.createLoginURL(request.getRequestURI()));
        }

        response.sendRedirect(request.getRequestURI());
    }

}
