//
//  ViewController.swift
//  PlayFull Project
//
//  Created by Matthew Allen Lin on 6/10/16.
//  Copyright © 2016 Matthew Allen Lin Software. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet var resourcesPlusItem: UITextField!
    
    @IBOutlet var parameter: UITextField!
    
    @IBOutlet var parameterValue: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func httpRequest(request: Alamofire.Method) {
/*        Alamofire.request(request, "http://jsonplaceholder.typicode.com/" + resourcesPlusItem.text!, parameters: [parameter.text!: parameterValue.text!])
            .responseJSON { response in
                print(response.request)  // original URL request
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                    
                else {
                    print("Request failure")
                }
                
                print("\n")
        }*/
    }
    
    @IBAction func getButton(sender: AnyObject) {
        print("GET TEST")
        
         Alamofire.request("http://jsonplaceholder.typicode.com/posts")
         .responseJSON { response in
         print(response.request)  // original URL request
         
         if let JSON = response.result.value {
         print("JSON: \(JSON)")
         }
         
         else {
         print("Request failure")
         }
         
         print("\n")
         }
    }
    
    @IBAction func postButton(sender: AnyObject) {
        print("POST TEST")
        
        Alamofire.request("http://jsonplaceholder.typicode.com/posts", method: .post)
            .responseJSON { response in
                print(response.request)  // original URL request
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                    
                else {
                    print("Request failure")
                }
                
                print("\n")
        }

    }
    
    @IBAction func putButton(sender: AnyObject) {
        print("PUT TEST")
        
        Alamofire.request("http://jsonplaceholder.typicode.com/posts", method: .put)
            .responseJSON { response in
                print(response.request)  // original URL request
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                    
                else {
                    print("Request failure")
                }
                
                print("\n")
        }
    }
    
    @IBAction func patchButton(sender: AnyObject) {
        print("PATCH TEST")
        
        Alamofire.request("http://jsonplaceholder.typicode.com/posts", method: .patch)
            .responseJSON { response in
                print(response.request)  // original URL request
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                    
                else {
                    print("Request failure")
                }
                
                print("\n")
        }

    }
    
    @IBAction func deleteButton(sender: AnyObject) {
        print("DELETE TEST")
        
        Alamofire.request("http://jsonplaceholder.typicode.com/posts", method: .delete)
            .responseJSON { response in
                print(response.request)  // original URL request
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                    
                else {
                    print("Request failure")
                }
                
                print("\n")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

