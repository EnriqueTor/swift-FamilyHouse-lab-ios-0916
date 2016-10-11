//
//  ViewController.swift
//  FamilyHouse
//
//  Created by Enrique Torrendell on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

enum TVSeries {
    
    case familyMatters
    case fullHouse
    
    var description: String {
        switch self {
        case .familyMatters: return "Family Matters"
        case .fullHouse: return "Full House"
        }
    }
}

struct FilmLocation {
    
    let name: String
    let address: String
    var tvSeries: TVSeries
    
}

struct Character {
    
    let name: String
    let realLifeName: String
    let tvSeries: TVSeries
    var currentLocation: FilmLocation
    let image: UIImage
    
    func canReportToSet(on location: FilmLocation) -> Bool {
        if self.currentLocation.address == location.address {
            return true
        }
        return false
    }
    
    mutating func reportToSet(on location: FilmLocation) {
        if canReportToSet(on: location) == true {
            self.currentLocation = location
        }
    }
}
