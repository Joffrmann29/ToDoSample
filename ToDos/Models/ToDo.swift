//
//  ToDo.swift
//  ToDos
//
//  Created by Joffrey Mann on 7/27/18.
//  Copyright © 2018 Joffrey Mann. All rights reserved.
//

import Foundation

class ToDo {
    var userID: Int?
    var taskID:Int?
    var isCompleted:Bool?
    var title:String?
    var numberOfIncompletes:Int?
    
    convenience init(userID: Int, taskID: Int, isCompleted:Bool, title:String) {
        self.init()
        self.userID = userID
        self.taskID = taskID
        self.isCompleted = isCompleted
        self.title = title
    }
}
