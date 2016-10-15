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
    //
    var items: [String] = [""]
    
    @IBOutlet var resourcesPlusItem: UITextField!
    
    @IBOutlet var parameter: UITextField!
    
    @IBOutlet var parameterValue: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func storeJsonInCell(x: NSDictionary) -> [String] {
        print("LOVE IT: \(x)")
        
        //Clears out items array
        items.removeAll()
        for(key, value) in x {
            print("key: \(key)")
            print("value: \(value)")
            
            let item: String = key as! String
            
            self.items.append(item)
        }

        self.tableView.reloadData()
    
        print("WE DONT TALK")
        print(self.items)
        print(self.items.count)
        //self.items = x
        
        return ["LOVE"]
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
        
         Alamofire.request("http://jsonplaceholder.typicode.com/posts/1")
         .responseJSON { response in
         print(response.request)  // original URL request
         
         if let JSON = response.result.value {
            print("JSON: \(JSON)")
            
            self.storeJsonInCell(x: JSON as! NSDictionary)
            print(type(of: JSON))
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

