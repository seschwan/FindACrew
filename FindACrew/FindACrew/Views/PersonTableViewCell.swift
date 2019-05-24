//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by Seschwan on 5/23/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var nameLbl:     UILabel!
    @IBOutlet weak var genderLbl:   UILabel!
    @IBOutlet weak var birthLbl:    UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let person = self.person else { return }
            self.nameLbl.text = person.name
            self.genderLbl.text = "Gender: \(person.gender)"
            self.birthLbl.text = "Birth Year: \(person.birthYear)"
    }
}
