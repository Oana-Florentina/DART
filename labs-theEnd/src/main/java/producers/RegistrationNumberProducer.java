package producers;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Produces;
import java.util.UUID;

@ApplicationScoped
public class RegistrationNumberProducer {
    @Produces
    public String generateRegistrationNumber() {
        return UUID.randomUUID().toString();
    }
}
