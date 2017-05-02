import com.googlecode.objectify.ObjectifyService;
import models.Automovil;
import models.Bicicleta;
import models.Motocicleta;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by ferdyrod on 5/2/17.
 */
public class OfyHelper implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ObjectifyService.register(Automovil.class);
        ObjectifyService.register(Motocicleta.class);
        ObjectifyService.register(Bicicleta.class);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
