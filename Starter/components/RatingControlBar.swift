//
//  RatingControlBar.swift
//  Starter
//
//  Created by Mac on 29/01/2021.
//

import UIKit

@IBDesignable
class RatingControlBar: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable var rating:Int = 4{
        didSet{
            updateButtonRating()
        }
    }
    var ratingButtons = [UIButton]()
    @IBInspectable var starSize:CGSize = CGSize(width: 50.0, height: 50.0){
        didSet{
            setUpButtons()
            updateButtonRating()
        }
    }
    @IBInspectable var starCount:Int = 4{
        didSet{
            setUpButtons()
            updateButtonRating()
        }
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpButtons()
        updateButtonRating()
    }
    required init(coder: NSCoder) {
        super.init(coder:coder)
        setUpButtons()
        updateButtonRating()
    }
    
    private func setUpButtons(){
      clearExistingButton()
        for _ in 0...starCount {
            let buttons = UIButton()
            buttons.setImage(UIImage(named: "filledStar"), for: .selected)
            buttons.setImage(UIImage(named: "emptyStar"), for: .normal)

            buttons.translatesAutoresizingMaskIntoConstraints = false
            buttons.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            buttons.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true

            addArrangedSubview(buttons)
            buttons.isUserInteractionEnabled = false
            ratingButtons.append(buttons)
        }

    }
    private func clearExistingButton(){
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
    }
    private func updateButtonRating(){
        for(index,button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
        }
    }
    
}
