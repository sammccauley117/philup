//
//  Charity.swift
//  PhilUp
//
//  Created by Sam McCauley on 3/23/20.
//  Copyright © 2020 Sam McCauley. All rights reserved.
//

import Foundation
import UIKit

class Charity {
    var image: UIImage
    var title: String
    var description: String
    
    init(image: UIImage, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}
