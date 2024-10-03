//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mario Abraham Ochoa Tovar on 20/09/24.
//

import Foundation
 
class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            // se llama cada vez que cambia el array de items
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "Thre first title", isCompleted: false),
//            ItemModel(title: "Thre second title", isCompleted: false),
//            ItemModel(title: "Thre third", isCompleted: true),
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//        Este codigo hace lo mismo que el de abajo
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletition()
        }
    }
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
                    UserDefaults.standard.set(encodedData, forKey: itemsKey)
                }
    }
}
