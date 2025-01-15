package resources;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import java.util.List;
import jakarta.inject.Inject;
import services.EvaluationService;
import entities.Evaluation;

@Path("/evaluations") // Path after the "/api" defined in ApplicationConfig
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class EvaluationResource {

    @Inject
    private EvaluationService evaluationService;

    @GET
    public List<Evaluation> getEvaluations() {
        return evaluationService.getEvaluations();
    }

    @POST
    public void addEvaluation(Evaluation evaluation) {
        evaluationService.addEvaluation(evaluation);
    }
}
