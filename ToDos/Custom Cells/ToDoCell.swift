//
//  ToDoCell.swift
//  ToDos
//
//  Created by Joffrey Mann on 7/27/18.
//  Copyright © 2018 Joffrey Mann. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var userIDValueLabel: UILabel!
    @IBOutlet var incompleteToDosLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
