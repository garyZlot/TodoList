//
//  ContentView.swift
//  TodoList
//
//  Created by liuguangde on 2020/9/8.
//  Copyright © 2020 liuguangde. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var todoStr = ""
    @State private var descStr = ""
    
    @EnvironmentObject private var todoManager: TodoManager
    
    var body: some View {
        TabView(selection: $selection){
            List {
                ForEach(todoManager.todos) { todo in
                    VStack {
                        Text(todo.name)
                            .font(.title)
                        Text(todo.desc)
                            .font(.subheadline)
                    }
                }
            }
                .tabItem {
                    VStack {
                        Image("first")
                        Text("TODO")
                    }
                }
                .tag(0)
            VStack {
                Text("Add TODO")
                TextField("输入任务", text: $todoStr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("输入任务描述", text: $descStr)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    self.todoManager.addTask(name: self.todoStr, desc: self.descStr)
                    
                    self.selection = 0
                }) {
                    Text("Add")
                }
            }
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Add")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TodoManager())
    }
}
