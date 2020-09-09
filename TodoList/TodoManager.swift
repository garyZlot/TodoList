//
//  TodoManager.swift
//  MyTodoList
//
//  Created by liuguangde on 2020/9/8.
//  Copyright © 2020 liuguangde. All rights reserved.
//

import SwiftUI
import Combine

class TodoManager: NSObject, ObservableObject {
    @Published var todos = [todo]()
    
    func addTask(name: String, desc: String) {
        todos.append(todo(name: name, desc: desc))
    }
}

struct todo: Identifiable {
    var id:  UUID = UUID()
    var name: String
    var desc: String
}

