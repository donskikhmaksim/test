//
//  Profile.swift
//  iOS-UI-Lesson5
//
//  Created by Максим Донских on 28.10.2022.
//

import UIKit

struct Profile {
    let firstName: String
    let secondName: String
    let job: String
    let description: String
    let image: UIImage?
    
    var fullname: String {
        self.firstName + " " + self.secondName
    }
}
