//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by apple on 2017/9/29.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: Meal Class Tests
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters
    func testMealInitializationSucceeds() {
        
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that the Meal initializaer returns nil when a negative rating or and empty name
    func testMealInitializationFails() {
        
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
    
}
