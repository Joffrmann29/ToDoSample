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
        self.todoService.fetchToDos { (todos) in
            self.todos = todos!
            self.tableView.reloadData()
        }
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
        
        todoCell.incompleteToDosLabel.text = String(format: "Incomplete todos: %i", todo.numberOfIncompletes!)
        
        return todoCell
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedIndexPath = self.tableView.indexPathForSelectedRow
        let userID = self.todos[(selectedIndexPath?.row)!].userID!
        let incompletes = self.todos[(selectedIndexPath?.row)!].numberOfIncompletes!
        if segue.identifier == "toDetail"{
            let detailVC = segue.destination as! DetailViewController
            detailVC.userID = userID
            detailVC.incompleteToDos = incompletes
        }
    }
}

