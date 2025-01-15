package filters;

import jakarta.ws.rs.container.*;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Provider
public class CacheFilter implements ContainerRequestFilter, ContainerResponseFilter {
    private static final Map<String, Response> cache = new HashMap<>();

    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {
        String key = requestContext.getUriInfo().getRequestUri().toString();
        if (cache.containsKey(key)) {
            requestContext.abortWith(cache.get(key));
        }
    }

    @Override
    public void filter(ContainerRequestContext requestContext, ContainerResponseContext responseContext) {
        String key = requestContext.getUriInfo().getRequestUri().toString();
        Response response = Response.ok(responseContext.getEntity()).build();
        cache.put(key, response);
    }
}
