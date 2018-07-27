//
//  ViewController.swift
//  ToDos
//
//  Created by Joffrey Mann on 7/27/18.
//  Copyright © 2018 Joffrey Mann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var todos = [ToDo]()
    var todoService = ToDoService()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.todoService = ToDoService()
        self.todos = todoService.fetchToDos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ToDoCell
        let todo = self.todos[indexPath.row]
        
        todoCell.userIDValueLabel.text = String(format: "%i", todo.userID!)
        
        var counts: [String: Int] = [:]
        
        for item in self.todoService.incompleteTodos {
            counts[item] = (counts[item] ?? 0) + 1
        }
        
        for (key, value) in counts {
            print("\(key) occurs \(value) time(s)")
        }
        
        let currentStringUserID = String(format: "%@", todo.userID!)
        
        todoCell.incompleteToDosLabel.text = String(format: "Incomplete todos: %i", counts[currentStringUserID]!)
        
        return todoCell
    }
}

