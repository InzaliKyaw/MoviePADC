//
//  File.swift
//  Starter
//
//  Created by Mac on 17/01/2021.
//

import Foundation

var colorlist = ["red","green","yellow"]
var regionlist:Set = ["Yangon","Myeik","Mandalay"]
var townshiplist:[String:[String]] = ["Yangon":["Tamwe","Tharketa","Pazundaung"]]

var doOnNext:((String)->String)?=nil

public func main(){
    var name = "Inzali"
    name = "Lupin"
    
    colorlist.append("orange")
    let townships = townshiplist["Yangon"]
    debugPrint(townships)
    
    for color in colorlist {
        debugPrint(color)
    }
    //Global Function
    doOnNext = {
        name-> String in
        debugPrint("Hello Names \(name)")
        return "Hello Names \(name)"
    }
    

    //Traling Closure
    decrease(total: 10){
        
    }
    
    var indexForwhile = 0
    while indexForwhile<3 {
        debugPrint(colorlist[indexForwhile])
        indexForwhile += 1
    }
    
    var indexForRepeatWhile = 0
    repeat{
        debugPrint(indexForRepeatWhile)
        indexForRepeatWhile += 1
    }while indexForRepeatWhile<3
    
}
//Nested Closure
func increment(amount:Int)->()->Int{
    func doProcess()->Int{
        return amount
    }
    return doProcess
}

func decrease(total:Int,doDecrease:()->Void)->Void{
    debugPrint("Trailing closure")
}


