//
//  LoginVC.swift
//  NewLogin
//
//  Created by Pranjal Tmarakar on 26/10/23.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if  emailTxt.text == ""  {
            print("EmailRong")
            singleActionAlert(withTitle: "", withMessage: "Alert", withButtonTitle: "Enter Email")
        } else if passwordTxt.text == ""{  // .text == "" {
            singleActionAlert(withTitle: "", withMessage: "Alert", withButtonTitle: "Enter password")

           } else {
               userLogIN()
           }
    }
    
   

}
extension LoginVC:UITextFieldDelegate{
    func userLogIN() {
        let param:[String:Any] = ["email_or_mobile": emailTxt.text ?? "", "password" : passwordTxt.text ?? ""]
        Api_Http_Class.shareinstance.APICall(methodName:  APIConstant.log, params: param.percentEncoded(), method: .post) {[weak self] requestResult in
            
            switch requestResult {
            case .success(let data ,_):
                if let data = data {
                    do{
                        let responce = try JSONDecoder().decode(LoginModel.self ,from : data)
                        if responce.code == "success" {
                            
                            DispatchQueue.main.async {
                                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "ListVC") as?  ListVC
                                self?.navigationController?.pushViewController(vc!, animated: true)
                               
                            }
                        }else {
                            //Alert
                        }
                    } catch(let errore ){
                        
                        DispatchQueue.main.async {
                            self?.singleActionAlert(withTitle: "Alert", withMessage: "Somthoing went wrong", withButtonTitle: "OK")
                         
                        }          
                        print(errore)
                    }
                }
            case .failer(let error):
                print("Hello \(error)")
            }
        }
    }
    
    
}
