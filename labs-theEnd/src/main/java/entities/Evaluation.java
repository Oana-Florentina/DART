package entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Evaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String teacher;
    private String activity;
    private String type;
    private int grade;
    private String comment;
    private String registrationNumber;

    private LocalDateTime timestamp;

    // Getters and setters
    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
