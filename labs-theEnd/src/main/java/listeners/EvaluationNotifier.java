package listeners;
import entities.Evaluation;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.event.Event;
import jakarta.inject.Inject;

@ApplicationScoped
public class EvaluationNotifier {
    @Inject
    private Event<Evaluation> evaluationEvent;

    public void notifyEvaluationSubmitted(Evaluation evaluation) {
        evaluationEvent.fire(evaluation);
    }
}
