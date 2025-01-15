package decorators;
import entities.Evaluation;
import jakarta.decorator.Decorator;
import jakarta.decorator.Delegate;
import jakarta.inject.Inject;
import services.EvaluationService;

import java.time.LocalDateTime;

@Decorator
public abstract class TimeValidator implements EvaluationService {
    @Inject
    @Delegate
    private EvaluationService evaluationService;

    private static final LocalDateTime START = LocalDateTime.of(2025, 1, 1, 0, 0);
    private static final LocalDateTime END = LocalDateTime.of(2025, 12, 31, 23, 59);

    @Override
    public void addEvaluation(Evaluation evaluation) {
        if (LocalDateTime.now().isAfter(START) && LocalDateTime.now().isBefore(END)) {
            evaluationService.addEvaluation(evaluation);
        } else {
            throw new IllegalArgumentException("Submission is outside the allowed time range.");
        }
    }
}
