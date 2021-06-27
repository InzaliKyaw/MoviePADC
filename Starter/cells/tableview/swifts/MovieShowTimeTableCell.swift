//
//  MovieShowTimeTableCell.swift
//  Starter
//
//  Created by Mac on 06/02/2021.
//

import UIKit

class MovieShowTimeTableCell: UITableViewCell {
    @IBOutlet weak var viewForBackground: UIView!
    
    var delegate:MovieItemDelegate?=nil
    @IBOutlet weak var lblSeeMore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //**Note**viewForBackground.layer.cornerRadius = 4
        
        //**Note**kolochintae like 2 corners atwt bl so yin use tal
//        viewForBackground.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMinYCorner]
        
        //**Note**MutableString nae Bold,Italic,Line Spacing akone ya
      
        lblSeeMore.underlineText(text: "SEE MORE")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
