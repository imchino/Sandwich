//
//  Sandwich.swift
//  Sandwiches
//
//  Created by chino on 2020/11/15.
//

import Foundation

struct Sandwich: Identifiable {
    var id = UUID()
    var name: String
    var indigrientCount: Int
    var isSpicy: Bool = false
    
    var imageName: String { return self.name }
    var thumbnailName: String { return self.name + "Thumb" }
}

let testData = [
    Sandwich(name: "Club", indigrientCount: 4, isSpicy: false),
    Sandwich(name: "Pastrami on rye", indigrientCount: 4, isSpicy: true),
    Sandwich(name: "French dip", indigrientCount: 3, isSpicy: false),
    Sandwich(name: "Banh mi", indigrientCount: 5, isSpicy: true),
    Sandwich(name: "Ice cream sandwich", indigrientCount: 2, isSpicy: false),
    Sandwich(name: "Croque madame", indigrientCount: 4, isSpicy: false),
    Sandwich(name: "Hot dog", indigrientCount: 2, isSpicy: true),
    Sandwich(name: "Fluffernutter", indigrientCount: 2, isSpicy: false),
    Sandwich(name: "Avocado toast", indigrientCount: 3, isSpicy: true),
    Sandwich(name: "Gua bao", indigrientCount: 4, isSpicy: true)
]

