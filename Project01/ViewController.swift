//
//  ViewController.swift
//  Project01
//
//  Created by 황지은 on 2020/05/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainTextField: UITextField!
    var textfieldData : String!
    @IBOutlet var finishBtn: UIButton!
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        mainTextField.addLeftPadding()
        mainTextField.layer.cornerRadius = 22.0
        finishBtn.layer.cornerRadius = 15.0
       }
    
    
    @IBAction func gotoPlayerBtn(_ sender: Any) {
        
        if(mainTextField.text == "힐링되는"){
         guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "healing") as? HealingViewController else {return}
            
            self.present(receiveViewController, animated: true, completion: nil)
    }
       else if(mainTextField.text == "신나는"){
               guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "exciting") as? ExcitingViewController else {return}
                  
                  self.present(receiveViewController, animated: true, completion: nil)
          }
        
        else if(mainTextField.text == "무드있는"){
                      guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "mood") as? MoodViewController else {return}
                         
                         self.present(receiveViewController, animated: true, completion: nil)
            
        }
        
    }
 
}

extension UITextField {
    func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
      }
}

