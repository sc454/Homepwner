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
    
    // To delete a row
    func removeItem(_ item: Item){
        if let index = allItems.index(of: item){
            allItems.remove(at: index)
        }
    }
    
    //To move a row
    func moveItem(from fromIndex:Int, to toIndex: Int){
        if fromIndex == toIndex {
            return }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
    
    

}
