//
//  Pet.swift
//  PetsAdoptionApp
//
//  Created by manuel on 9/10/19.
//  Copyright © 2019 breaknecklabs. All rights reserved.
//

import UIKit

struct Pet {
    let ageInMonths: Int
    let breed: String
    let isMale: Bool
    let photo: UIImage?
    let backgroundColor: UIColor?
    
    static let testObjects: [Pet] = [Pet(ageInMonths: 9,
                                         breed: "Egyptian Mau",
                                         isMale: true,
                                         photo: UIImage.recommendedCat1,
                                         backgroundColor: UIColor.recommendedColor1),
                                     Pet(ageInMonths: 5,
                                         breed: "Pixie-bob",
                                         isMale: true,
                                         photo: UIImage.recommendedCat2,
                                         backgroundColor: UIColor.recommendedColor2)]
}
