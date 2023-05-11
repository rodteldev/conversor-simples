//
//  ViewController.swift
//  Conversor-Unidade
//
//  Created by Rodrigo Telles on 10/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldValue: UITextField!
    @IBOutlet weak var buttonUnitOne: UIButton!
    @IBOutlet weak var buttonUnitTwo: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResultUnit: UILabel!
    @IBOutlet weak var labelUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch labelUnit.text! {
        case "Temperatura":
            labelUnit.text = "Peso"
            buttonUnitOne.setTitle("Kg", for: .normal)
            buttonUnitTwo.setTitle("Lb", for: .normal)
        case "Peso":
            labelUnit.text = "Moeda"
            buttonUnitOne.setTitle("BRL", for: .normal)
            buttonUnitTwo.setTitle("USD", for: .normal)
        case "Moeda":
            labelUnit.text = "Distância"
            buttonUnitOne.setTitle("M", for: .normal)
            buttonUnitTwo.setTitle("KM", for: .normal)
        default:
            labelUnit.text = "Temperatura"
            buttonUnitOne.setTitle("C", for: .normal)
            buttonUnitTwo.setTitle("F", for: .normal)
        }
        convert(nil)
    }
    //    O convert aplica-se aos dois botões para o cálculo
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == buttonUnitOne {
                buttonUnitTwo.alpha = 0.5
            } else {
                buttonUnitOne.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch labelUnit.text! {
        case "Temperatura":
            calculateTemperature()
        case "Peso":
            calculateWeight()
        case "Moeda":
            calculateCurrency()
        default:
            calculateDistancy()
        }
        view.endEditing(true) // Teclado retroceder
//        Formatação dos resultados
        let result = Double(labelResult.text!)!
        labelResult.text = String(format: "%.2f", result)
    }
    
    func calculateTemperature() {
        guard let temperature = Double(textFieldValue.text!) else {return}
            if buttonUnitOne.alpha == 1.0 {
                labelResultUnit.text = "F"
                labelResult.text = String(temperature * 1.8 + 32.0)
            } else {
                labelResultUnit.text = "C"
                labelResult.text = String((temperature - 32.0) / 1.8)
            }
    }
    
    func calculateWeight() {
        guard let weight = Double(textFieldValue.text!) else {return}
            if buttonUnitOne.alpha == 1.0 {
                labelResultUnit.text = "Lb"
                labelResult.text = String(weight / 2.2046)
            } else {
                labelResultUnit.text = "Kg"
                labelResult.text = String(weight * 2.2046)
            }
    }
    
    func calculateCurrency() {
        guard let currency = Double(textFieldValue.text!) else {return}
            if buttonUnitOne.alpha == 1.0 {
                labelResultUnit.text = "USD"
                labelResult.text = String(currency / 4.5)
            } else {
                labelResultUnit.text = "BRL"
                labelResult.text = String(currency * 4.5)
            }
    }
    
    func calculateDistancy() {
        guard let distance = Double(textFieldValue.text!) else {return}
            if buttonUnitOne.alpha == 1.0 {
                labelResultUnit.text = "KM"
                labelResult.text = String(distance / 1000.0)
            } else {
                labelResultUnit.text = "M"
                labelResult.text = String(distance * 1000.0)
            }
    }
    
}

