//
//  DetailViewController.swift
//  ToDos
//
//  Created by Joffrey Mann on 7/27/18.
//  Copyright © 2018 Joffrey Mann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource {
    var userID = 0
    var incompleteToDos = 0
    var todos = [ToDo]()
    var userToDos = [ToDo]()
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var incompleteLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        self.userIDLabel.text = String(format: "User id: %i", self.userID)
        self.incompleteLabel.text = String(format: "Incomplete todos: %i", self.incompleteToDos)
        self.tableView.dataSource = self
        for todo in self.todos{
            if todo.userID! == userID {
                self.userToDos.append(todo)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userToDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        let todo = self.userToDos[indexPath.row]

        todoCell.textLabel?.text = todo.title!
        todoCell.textLabel?.numberOfLines = 0
        todoCell.textLabel?.lineBreakMode = .byWordWrapping
        todoCell.textLabel?.sizeToFit()
        
        return todoCell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
