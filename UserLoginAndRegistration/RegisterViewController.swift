//
//  RegisterViewController.swift
//  UserLoginAndRegistration
//
//  Created by Nikhil Tanappagol on 8/1/17.
//  Copyright © 2017 Nikhil Tanappagol. All rights reserved.
//

import UIKit

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var firstnameText: UITextField!
    @IBOutlet var lastnameText: UITextField!
    @IBOutlet var cPasswordText: UITextField!
  

    
    @IBAction func registerBtn(_ sender: Any) {
        let fName = firstnameText.text
        let lName = lastnameText.text
        let userPassword = passwordText.text
        let userEmail = emailText.text
        let ComfrimPassword = cPasswordText.text
        if fName=="" || lName=="" || userEmail=="" || userPassword==""
        {
            //Display alert message
            displayMyAlertMessage (userMessage: "All fields are required")
            return
        }
        // check if the password will match
         if (userPassword != ComfrimPassword){
         // Display alert message
         displayMyAlertMessage (userMessage: "Password do not match")
         return
         }
        
        let parameters =  ["fName": firstnameText.text, "lName": lastnameText.text,"email":emailText.text,"Password":passwordText.text]
        
        
        guard let url = URL(string :"http://45.79.76.22:9080/EasyRentals/EasyRentals/registerUser") else {return}
        // guard will run only if the statments are not true rather crashing the app it will exit
        
        var request = URLRequest(url: url)
        // prepares a url to be used by any service in Flash that needs to communicate with a server, capturing all of the information in a single HTTP request.
        

        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField : "Content-Type")
        //The header just denotes what the content is encoded in
        // in this case the receiving server apparently has an idea that it's dealing with JSON and assumes that the encoding is UTF-8 by default, that's why it works with or without the header.
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else {return}
        //An object that converts between JSON and the equivalent Foundation objects
        //Pretty printer = As JSON data is often output without line breaks to save space, it is extremely difficult to actually read and make sense of it.
        
        request.httpBody = httpBody
        
        let session = URLSession.shared.dataTask( with:request){ (data,response,error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                }
                catch {
                    print(error)
                }
                
            }
            
            }
        session.resume()
}
}



        // Store data
       /* UserDefaults.standard.set(name , forKey: "name")
        UserDefaults.standard.set(lastname , forKey: "lastname")
        UserDefaults.standard.set(email , forKey: "email")
        UserDefaults.standard.set(password , forKey: "password")
        UserDefaults.standard.set(cPassword , forKey: "cPassword")
        UserDefaults.standard.synchronize()
        
        // Display alert message
        var myAlert = UIAlertController(title: "Alert", message: "Registeration succefully done ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true , completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)*/
    
        
    
    func displayMyAlertMessage (userMessage: String){
         let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
}

    
