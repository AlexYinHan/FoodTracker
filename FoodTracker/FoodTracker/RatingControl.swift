//
//  RatingControl.swift
//  FoodTracker
//
//  Created by apple on 2017/9/28.
//
//

import UIKit

class RatingControl: UIStackView {
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
        
    }
    
    // Button Action
    func ratingButtonTapped(button: UIButton){
        print("Button pressed")
    }
    
    // MARK:Private Methods
    
    private func setupButtons() {
        
        // Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constrains
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add thebutton to the stack
        addArrangedSubview(button)
        
    }

}
