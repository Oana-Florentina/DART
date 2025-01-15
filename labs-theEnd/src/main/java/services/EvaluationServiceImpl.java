package services;

import entities.Evaluation;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import java.util.List;

@ApplicationScoped
public class EvaluationServiceImpl implements EvaluationService {
    @Inject
    private EntityManager entityManager;

    @Transactional
    @Override
    public void addEvaluation(Evaluation evaluation) {
        entityManager.persist(evaluation);
    }

    @Transactional
    @Override
    public void updateEvaluation(Long id, Evaluation evaluation) {
        Evaluation existing = entityManager.find(Evaluation.class, id);
        if (existing != null) {
            existing.setActivity(evaluation.getActivity());
            existing.setGrade(evaluation.getGrade());
            existing.setComment(evaluation.getComment());
            entityManager.merge(existing);
        }
    }

    @Transactional
    @Override
    public void deleteEvaluation(Long id) {
        Evaluation evaluation = entityManager.find(Evaluation.class, id);
        if (evaluation != null) {
            entityManager.remove(evaluation);
        }
    }

    @Override
    public List<Evaluation> getEvaluations() {
        return entityManager.createQuery("SELECT e FROM Evaluation e", Evaluation.class).getResultList();
    }

    @Override
    public List<Evaluation> getEvaluationsByTeacher(String teacher) {
        return entityManager.createQuery("SELECT e FROM Evaluation e WHERE e.teacher = :teacher", Evaluation.class)
                .setParameter("teacher", teacher)
                .getResultList();
    }
}
