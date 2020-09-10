//
//  TodoDetail.swift
//  TodoList
//
//  Created by liuguangde on 2020/9/10.
//  Copyright © 2020 liuguangde. All rights reserved.
//

import SwiftUI

struct TodoDetail: View {
    @EnvironmentObject var todoManager: TodoManager
    
    @State var todo: todo
    
    var todoIndex: Int {
        todoManager.todos.firstIndex(where: { $0.id == todo.id })!
    }
    
    var body: some View {
        VStack {
            Text("TODO Detail")
            TextField("输入任务", text: $todo.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("输入任务描述", text: $todo.desc)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                self.todoManager.todos[self.todoIndex] = self.todo
            }) {
                Text("Update")
            }
        }
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        let todoManager = TodoManager()
        todoManager.addTask(name: "todoTest", desc: "desc")
        return TodoDetail(todo: todoManager.todos[0])
            .environmentObject(todoManager)
    }
}
