//
//  ItemModel.swift
//  TodoList
//
//  Created by Mario Abraham Ochoa Tovar on 20/09/24.
//

import Foundation

// Imutable Struct
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletition() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
