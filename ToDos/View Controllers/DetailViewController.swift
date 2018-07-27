//
//  DetailViewController.swift
//  ToDos
//
//  Created by Joffrey Mann on 7/27/18.
//  Copyright © 2018 Joffrey Mann. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var userID = 0
    var incompleteToDos = 0
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var incompleteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        self.userIDLabel.text = String(format: "User id: %i", self.userID)
        self.incompleteLabel.text = String(format: "Incomplete todos: %i", self.incompleteToDos)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
