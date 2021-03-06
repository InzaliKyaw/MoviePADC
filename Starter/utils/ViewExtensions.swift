//
//  ViewExtensions.swift
//  Starter
//
//  Created by Mac on 02/02/2021.
//

import Foundation
import UIKit

extension UITableViewCell{
    var identifier:String{
        String(describing: self)
    }
}

extension UILabel{
    func underlineText(text:String) {
        let attributedString = NSMutableAttributedString.init(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1,range:NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
}

extension UITableViewCell{
    static var identifier : String{
        String(describing: self)
    }
}

extension UITableView{
    func registerForCell(identifier:String){
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func dequeueCell<T:UITableViewCell>(identifier:String,indexPath:IndexPath)->T{
        guard let cell = dequeueReusableCell(withIdentifier: identifier,for: indexPath) as? T else{
            return UITableViewCell() as! T
        }
        return cell
    }
}

extension UIViewController{
    static var identifier : String{
        String(describing: self)
    }
}
