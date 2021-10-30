//
//  CoffeeDecorator.swift
//  CoffeeRSN
//
//  Created by Sergey Razgulyaev on 08.10.2021.
//

import Foundation

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee, additivePrice: Int, additiveCount: Int)
}
