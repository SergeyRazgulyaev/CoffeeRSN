//
//  SimpleCoffee.swift
//  CoffeeRSN
//
//  Created by Sergey Razgulyaev on 08.10.2021.
//

import Foundation

protocol Coffee {
    var price: Int { get }
}

class SimpleCoffee: Coffee {
    var price: Int
    
    init(price: Int) {
        self.price = price
    }
}
