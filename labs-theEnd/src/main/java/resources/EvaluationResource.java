package resources;
import entities.Evaluation;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import services.EvaluationService;

import java.util.List;

@Path("/evaluations")
public class EvaluationResource {
    @Inject
    private EvaluationService evaluationService;

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void addEvaluation(Evaluation evaluation) {
        evaluationService.addEvaluation(evaluation);
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void updateEvaluation(@PathParam("id") Long id, Evaluation evaluation) {
        evaluationService.updateEvaluation(id, evaluation);
    }

    @DELETE
    @Path("/{id}")
    public void deleteEvaluation(@PathParam("id") Long id) {
        evaluationService.deleteEvaluation(id);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Evaluation> getEvaluations() {
        return evaluationService.getEvaluations();
    }

    @GET
    @Path("/teacher/{name}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Evaluation> getEvaluationsByTeacher(@PathParam("name") String teacher) {
        return evaluationService.getEvaluationsByTeacher(teacher);
    }
}
