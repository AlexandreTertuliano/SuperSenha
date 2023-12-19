//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Gold System on 14/12/23.
//

import UIKit

class PasswordsViewController: UIViewController {

    
     
    

    @IBOutlet weak var tvPasswords: UITextView!
        
    var numberOfCharacteres: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters:Bool!
    var useNumbers:Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters:Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        title =  "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacteres, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        
        generatorPassword()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func generate(_ sender: UIButton) {
        generatorPassword()
    }
    
    func generatorPassword(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords =  passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")        }
    }

}
