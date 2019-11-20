//
//  TaxesCalculator.swift
//  comprasUSA
//
//  Created by Guilherme Santos on 09/05/19.
//  Copyright © 2019 Guilherme Santos. All rights reserved.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    var dolar: Double = 3.94
    var iof: Double = 6.38
    var stateStax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formarter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var statesTaxsValue: Double {
        return shoppingValue * stateStax / 100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateStax) * iof / 100
    }   
    
    func calculate(usingCreditCard: Bool) -> Double {
        
        var finalValue = shoppingValue + statesTaxsValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func convertToDouble(_ string: String) -> Double {
        formarter.numberStyle = .none
        return formarter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formarter.numberStyle = .currency
        formarter.currencySymbol = currency
        formarter.alwaysShowsDecimalSeparator = true
        return formarter.string(for: value)!
    }
    
    private init(){
        formarter.usesGroupingSeparator = true
    }
    
}
