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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    
    /**
     Test post: stores defined variables title, message and time under "Table" + currentTableNumber/currentTime as "title", "message" and "timeField"
     */
    func post(){
        
        let currentTime = getDateTime()
        let currentTableNumber = "1"
        let title = "Title"
        let message = "Message"
        let time = "12:23"
        
        let order : [String : String] = ["title" : title, "message" : message, "timeField" : time]
        
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Table"+currentTableNumber).child(currentTime).setValue(order)
        
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
