//
//  GenreVO.swift
//  Starter
//
//  Created by Mac on 08/06/2021.
//

import Foundation

public class GenreVO{
   public var id:Int = 0
   public var name:String = "ACTION"
   public var isSelected:Bool = false
    
    init(id:Int = 0, name:String,isSelected:Bool) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}



