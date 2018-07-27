//
//  ToDoService.swift
//  ToDos
//
//  Created by Joffrey Mann on 7/27/18.
//  Copyright © 2018 Joffrey Mann. All rights reserved.
//

import Foundation
import Alamofire

class ToDoService {
    var incompleteTodos = [String]()
    var todos = [ToDo]()
    var finalTodos = [ToDo]()
    
    func fetchToDos(completion: @escaping ([ToDo]?) -> Void) {
        let url = URL(string: "http://jsonplaceholder.typicode.com/todos")

        Alamofire.request(url!)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let jsonArray = response.result.value as? [[String: Any]] else {
                    print("didn't get todo object as JSON from API")
                    if let error = response.result.error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                for todo in jsonArray{
                    let userID = todo["userId"] as! Int
                    let taskID = todo["id"] as! Int
                    let title = todo["title"] as! String
                    let isCompleted = todo["completed"] as! Bool
                    
                    let todoObj = ToDo(userID: userID, taskID: taskID, isCompleted: isCompleted, title: title)
                    if(!isCompleted){
                        self.incompleteTodos.append(String(format: "%i", todoObj.userID!))
                    }
                    self.todos.append(todoObj)
                }
                
                for todo in self.todos{
                    var counts: [String: Int] = [:]
                    
                    for item in self.incompleteTodos {
                        counts[item] = (counts[item] ?? 0) + 1
                    }
                    
                    for (key, value) in counts {
                        print("\(key) occurs \(value) time(s)")
                    }
                    
                    let currentStringUserID = String(format: "%i", todo.userID!)
                    
                    todo.numberOfIncompletes = counts[currentStringUserID]!
                    self.finalTodos.append(todo)
                }
                
                self.finalTodos = (self.todos.sorted(by: { $0.numberOfIncompletes! > $1.numberOfIncompletes! }))
                completion(self.finalTodos)
        }
    }
}
