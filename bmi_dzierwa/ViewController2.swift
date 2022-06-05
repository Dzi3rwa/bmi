//
//  ViewController2.swift
//  bmi_dzierwa
//
//  Created by Maciej Dzierwa on 09/12/2021.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var waga: UITextField!
    @IBOutlet weak var wzrost: UITextField!
    
    @IBAction func policz(_ sender: UIButton) {
        let wg:Double = Double(waga.text!)!
        var wz:Double = Double(wzrost.text!)!
        wz = wz / 100
        var bmi:Double = wg / (wz * wz)
        bmi = Double(round(bmi * 10)/10)
        wynik.text = String(bmi)
        if     bmi < 18.5 {
            wynik2.text = "Niedowaga!"
            secik.image = UIImage(named: "Image1")
        }else if bmi >= 18.5 && bmi < 25 {
            wynik2.text = "Wartość prawidłowa"
            secik.image = UIImage(named: "Image2")
        }else{
            wynik2.text = "Nadwaga"
            secik.image = UIImage(named: "Image3")
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       if let x = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
          return true
       } else {
        return string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
       }
        //if string.isEmpty {
        //   return true
        //}
        
        
    }

    @IBOutlet weak var wynik: UITextField!
    @IBOutlet weak var wynik2: UILabel!
    @IBOutlet weak var secik: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        waga.delegate = self
        wzrost.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
