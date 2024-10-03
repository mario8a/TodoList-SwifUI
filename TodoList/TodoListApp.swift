//
//  TodoListApp.swift
//  TodoList
//
//  Created by Mario Abraham Ochoa Tovar on 20/09/24.
//

import SwiftUI

/**
 Model - data point
 View - UI
 ViewModel - manages for view
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel() 
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel) // las demas vistas tienen acceso al viewmodel
        }
    }
}
