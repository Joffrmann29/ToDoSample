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
    
    func fetchToDos() -> [ToDo] {
        var todos = [ToDo]()
        
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
                    todos.append(todoObj)
                }
        }
        return todos
    }
}
