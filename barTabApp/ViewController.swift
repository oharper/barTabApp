//
//  ViewController.swift
//  barTabApp
//
//  Created by Owen Harper on 17/01/2017.
//  Copyright © 2017 Owen Harper. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var ref:FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    var userData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        post(drink: "Peroni", quantity: "7", tableNumber: "1", user: "Simon")
        post(drink: "Carling", quantity: "2", tableNumber: "2", user: "Steve")
        post(drink: "Carling", quantity: "5", tableNumber: "10", user: "Simon")
        
        ref = FIRDatabase.database().reference()
        ref?.child("Users").observeSingleEvent(of: .value, with: { snapshot in
            
            print(snapshot.value)
        })
        
       
    }

    
    
    
    /**
     Test post: stores defined variables time, table, user, drinkand quantity under path Orders/auto id
     */
    func post(drink: String, quantity: String, tableNumber: String, user: String){
        
        let time = getDateTime()
        let table = tableNumber
        let drink = drink
        let quantity = quantity
        let user = user
        
        let order : [String : String] = ["Time" : time, "Table" : table, "User" : user, "Drink" : drink, "Quantity" : quantity]
        
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Orders").childByAutoId().setValue(order)
        
    }
    
    /**
     Gets current time and returns it as a string in the form dd-MM-yy HH:mm
     */
    func getDateTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy HH:mm"
        let result = formatter.string(from: date)
        Swift.print("TIME"+result)
        return result
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
