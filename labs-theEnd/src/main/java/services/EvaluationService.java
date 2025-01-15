package services;
import entities.Evaluation;

import java.util.List;

public interface EvaluationService {
    void addEvaluation(Evaluation evaluation);
    void updateEvaluation(Long id, Evaluation evaluation);
    void deleteEvaluation(Long id);
    List<Evaluation> getEvaluations();
    List<Evaluation> getEvaluationsByTeacher(String teacher);
}
