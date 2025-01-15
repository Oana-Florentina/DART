package resources;

import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;

@ApplicationPath("/api") // This sets the base path for your REST endpoints
public class ApplicationConfig extends Application {
    // No additional configuration is required here
}
