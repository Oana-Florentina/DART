package services;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class SentimentAnalyzer {
    public String analyzeSentiment(String comment) {
        if (comment.contains("bad") || comment.contains("poor")) {
            return "negative";
        } else if (comment.contains("great") || comment.contains("excellent")) {
            return "positive";
        }
        return "neutral";
    }
}
