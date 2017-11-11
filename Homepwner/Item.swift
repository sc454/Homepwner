//
//  Item.swift
//  Homepwner
//
//  Created by sravya chelikani on 11/8/17.
//  Copyright © 2017 Mohu. All rights reserved.
//

import UIKit

class Item: NSObject{
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = Date()
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random{
            let adjectives = ["Clean","Rusty","Soft"]
            let nouns = ["Rug","Fork","Carpet"]
            
            var index = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(index)]
            index = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(index)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)

        } else{
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: "name")
        aCoder.encode(serialNumber, forKey: "serialNumber")
        aCoder.encode(valueInDollars, forKey: "valueInDollars")
        aCoder.encode(dateCreated, forKey: "dateCreated")
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        serialNumber = aDecoder.decodeObject(forKey: "serialNumber,") as! String
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        dateCreated = aDecoder.decodeObject(forKey: "name") as! Date
        
        super.init()
    }
}
