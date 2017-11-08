//
//  ItemStore.swift
//  Homepwner
//
//  Created by sravya chelikani on 11/8/17.
//  Copyright © 2017 Mohu. All rights reserved.
//

import UIKit

class ItemStore{
    
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item{
        let newItem = Item(random:true)
        allItems.append(newItem)
        return newItem
    }
    
    init() {
        for _ in 0..<5{
            createItem()
        }
        
    }
}
