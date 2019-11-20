    //
//  TaxesViewController.swift
//  comprasUSA
//
//  Created by Guilherme Santos on 08/05/19.
//  Copyright © 2019 Guilherme Santos. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStatesTaxes: UILabel!
    @IBOutlet weak var lbStatesTaxesDescription: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTaxes()
    }

    @IBAction func chageIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes(){
        lbStatesTaxesDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateStax, withCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStatesTaxes.text = tc.getFormattedValue(of: tc.statesTaxsValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ ")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }
}
