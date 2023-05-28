package com.jtspringproject.JtSpringProject.Service;

import com.jtspringproject.JtSpringProject.Entity.Review;
import com.jtspringproject.JtSpringProject.Repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
    private final ReviewRepository reviewRepository;

    @Autowired
    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }

    public Review getReviewById(int reviewId) {
        return reviewRepository.findById((long) reviewId).orElse(null);
    }

    public Review saveReview(Review review) {
        return reviewRepository.save(review);
    }

    public void deleteReview(int reviewId) {
        reviewRepository.deleteById((long) reviewId);
    }
}
