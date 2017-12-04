//
//  TableViewCell.swift
//  Quiz
//
//  Created by Saulebekov Azamat on 13.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var question: UILabel!
    
    
    @IBOutlet weak var currentAns: UILabel!

    
    @IBOutlet weak var correctAns: UILabel!
    
    func Color(tORf: Bool){
        if(tORf == true){
            self.backgroundColor = #colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1)
        }
        else{
            self.backgroundColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
