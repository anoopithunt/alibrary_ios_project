//
//  ViewController.swift
//  Demo
//
//  Created by Sandeep Kesarwani on 03/06/22.
//  Copyright © 2022 Sandeep Kesarwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepperText: UIStepper!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    var transparentView = UIView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        let emailImage = UIImage(named: "download")
//        addLeftImageTo(textField: txtEmail, andImage: emailImage!)
//        let passwordImage = UIImage(named: "download-1")
//        addLeftImageTo(textField: txtPass, andImage: passwordImage!)
        
        
        
        
        //Stepper Action Start
        stepperText.autorepeat = true
        
        stepperText.isContinuous = true
        textField.text = stepperText.value.description
        stepperText.maximumValue = 100
        stepperText.minimumValue = 33
        
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper ){
        textField.text = sender.value.description
    }
    
    

    @IBAction func onClickMenu(_ sender: Any) {
        
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.brown.withAlphaComponent(0.5)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)
        
        
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        
        transparentView.addGestureRecognizer(tabGesture)
        transparentView.alpha = 0.5
//        UIView.animate(withDuration : 0.5, delay: 0, usingSpringWithDamping: 1.0,initialSpringVelocity: 1.0, options: .curveEaseInOut, animations:{
//            self.transparentView.alpha = 0.5
//            } ()->Void, completion: ((Bool->Void)?)
//    )
        
        
        
        
        
    }
    
    
    @objc func onClickTransparentView(){
        
        transparentView.alpha = 0
        
        
        
        
    }
    
    
    func addLeftImageTo(textField: UITextField, andImage img: UIImage){
            let leftImageView = UIImageView(frame: CGRect(x: 5.0, y: 0.0, width: 12.0, height: 15.0))
            leftImageView.image = img
            textField.leftView = leftImageView
            textField.leftViewMode = .always
            






    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        if ((txtEmail.text?.isValidEmail)!){
            print("Your email is valid")
        } else{
            print("your email is not valid")
        }
    }
    
}

extension String{
    var isPhoneNumber: Bool{
        do{
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches=detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res=matches.first{
                return res.resultType == .phoneNumber && res.range.location==0 && res.range.length == self.count && self.count==10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    var isValidEmail : Bool{
        let emailRegEx = "[A-Z0-9a-z.]@[A-Za-z].[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@",emailRegEx)
        return emailTest.evaluate(with:self)
    }
}
