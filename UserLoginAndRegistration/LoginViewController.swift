//
//  LoginViewController.swift
//  UserLoginAndRegistration
//
//  Created by Nikhil Tanappagol on 8/1/17.
//  Copyright © 2017 Nikhil Tanappagol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginActionBtn(_ sender: UIButton) {
        
        let email = loginTextField.text
        let password = passwordTextField.text
        
        let parameters =  ["email": email, "Password": password]
        
        guard let url = URL(string :"http://45.79.76.22:9080/EasyRentals/EasyRentals/getUserDetails") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField : "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {return}
        request.httpBody = httpBody
        let session = URLSession.shared.dataTask( with:request){ (data,response,error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                   if let myjson = json  as? NSDictionary{
                        let result : String = (myjson [ "value"] as? String)!
                        if result == "false" {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                            self.navigationController?.pushViewController(secondVc, animated: true)
                          /*  DispatchQueue.main.async {
                                self.displayMyAlertMessage (userMessage: "Registeration Sucessfully done ")
                            }*/
                            print("The user is registerd ")
                            
                        } else {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let secondVc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                            self.navigationController?.pushViewController(secondVc, animated: true)
                           /* self.displayMyAlertMessage (userMessage: "Registeration error")*/
                                print("The user is not registerd ")
                        }
                        }
                        }
            catch {
                    print(error)
                }
                
            
            }
        }
            session.resume()
    
    }
    
    func displayMyAlertMessage (userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
    }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


