//
//  ViewController.swift
//  CoffeeRSN
//
//  Created by Sergey Razgulyaev on 19.11.2020.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet private weak var simpleCoffeePriceLabel: UILabel!
    @IBOutlet private weak var milkPriceLabel: UILabel!
    @IBOutlet private weak var whipPriceLabel: UILabel!
    @IBOutlet private weak var sugarPriceLabel: UILabel!
    @IBOutlet private weak var quantityOfMilkInOrderLabel: UILabel!
    @IBOutlet private weak var quantityOfWhipInOrderLabel: UILabel!
    @IBOutlet private weak var quantityOfSugarInOrderLabel: UILabel!
    @IBOutlet private weak var totalAmountLabel: UILabel!
    
    //MARK: - Base properties
    private let simpleCoffeePrice: Int = 50
    private let milkPrice: Int = 20
    private let whipPrice: Int = 30
    private let sugarPrice: Int = 10
    
    private var milkCount: Int = 0
    private var whipCount: Int = 0
    private var sugarCount: Int = 0
    
    private var totalAmount: Int = 0
    
    lazy var simpleCoffee = SimpleCoffee(price: simpleCoffeePrice)
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialTotalAmount()
        configureUI()
    }
    
    //MARK: - Configuration Methods
    private func setInitialTotalAmount() {
        totalAmount = simpleCoffee.price
    }
    
    private func configureUI() {
        simpleCoffeePriceLabel.text = String(simpleCoffee.price) + " cent"
        milkPriceLabel.text = String(milkPrice) + " cent"
        whipPriceLabel.text = String(whipPrice) + " cent"
        sugarPriceLabel.text = String(sugarPrice) + " cent"
        totalAmountLabel.text = "= " + String(simpleCoffee.price) + " cent"
    }
    
    private func refreshAllLabelsText() {
        quantityOfMilkInOrderLabel.text = String(milkCount)
        quantityOfWhipInOrderLabel.text = String(whipCount)
        quantityOfSugarInOrderLabel.text = String(sugarCount)
        totalAmountLabel.text = "= " + String(totalAmount) + " cent"
    }
    
    private func setTotalAmount() {
        totalAmount = CoffeeWithSugar(base: CoffeeWithWhip(base: CoffeeWithMilk(base: simpleCoffee,
                                                                                additivePrice: milkPrice,
                                                                                additiveCount: milkCount) as Coffee,
                                                           additivePrice: whipPrice,
                                                           additiveCount: whipCount) as Coffee,
                                      additivePrice: sugarPrice,
                                      additiveCount: sugarCount).price
    }
    
    private func resetPurchaseSelection() {
        totalAmount = simpleCoffee.price
        milkCount = 0
        whipCount = 0
        sugarCount = 0
    }
    
    //MARK: - @IBActions
    @IBAction func addToOrderMilkButtonPressed(_ sender: UIButton) {
        milkCount += 1
        setTotalAmount()
        refreshAllLabelsText()
    }
    
    @IBAction func removeFromOrderMilkButtonPressed(_ sender: UIButton) {
        if milkCount > 0 {
            milkCount -= 1
            setTotalAmount()
        }
        refreshAllLabelsText()
    }
    
    @IBAction func addToOrderWhipButtonPressed(_ sender: UIButton) {
        whipCount += 1
        setTotalAmount()
        refreshAllLabelsText()
    }
    
    @IBAction func removeFromOrderWhipButtonPressed(_ sender: UIButton) {
        if whipCount > 0 {
            whipCount -= 1
            setTotalAmount()
        }
        refreshAllLabelsText()
    }
    
    @IBAction func addToOrderSugarButtonPressed(_ sender: UIButton) {
        sugarCount += 1
        setTotalAmount()
        refreshAllLabelsText()
    }
    
    @IBAction func removeFromOrderSugarButtonPressed(_ sender: UIButton) {
        if sugarCount > 0 {
            sugarCount -= 1
            setTotalAmount()
        }
        refreshAllLabelsText()
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        print("You bought Coffee for \(totalAmount) cent")
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetPurchaseSelection()
        refreshAllLabelsText()
    }
}

