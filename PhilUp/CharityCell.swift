//
//  CharityCell.swift
//  PhilUp
//
//  Created by Sam McCauley on 3/22/20.
//  Copyright © 2020 Sam McCauley. All rights reserved.
//

import UIKit

class CharityCell: UITableViewCell {
    
    @IBOutlet weak var charityImageView: UIImageView!
    @IBOutlet weak var charityTitle: UILabel!
    @IBOutlet weak var charityDescription: UITextView!
    
    func setCharity(charity: Charity) {
        charityImageView.image = charity.image
        charityTitle.text = charity.title
        charityDescription.text = charity.description
    }
}
