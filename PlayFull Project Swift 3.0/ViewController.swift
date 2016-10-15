//
//  ViewController.swift
//  PlayFull Project
//
//  Created by Matthew Allen Lin on 6/10/16.
//  Copyright © 2016 Matthew Allen Lin Software. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource  {
    //Picker View
    var pickerDataSource = ["Posts", "Comments", "Albums", "Photos", "Todos", "Users"]
    
    var resource: String = "posts"
    
    @IBOutlet weak var pickerView: UIPickerView!
    //End of Picker View
    
    //Table View
    var items: [String] = [""]
    
    var calledDictDirectly: Bool = true
    //End of Table View
    
    @IBOutlet var item: UITextField!
    
    @IBOutlet var parameter: UITextField!
    
    @IBOutlet var parameterValue: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    //PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
//            self.view.backgroundColor = UIColor.white
            self.resource = "posts"
        }
        else if(row == 1)
        {
  //          self.view.backgroundColor = UIColor.red
            self.resource = "comments"
        }
        else if(row == 2)
        {
    //        self.view.backgroundColor =  UIColor.green
            self.resource = "albums"
        }
        else if(row == 3)
        {
      //      self.view.backgroundColor = UIColor.blue
            self.resource = "photos"
        }
        else if(row == 4)
        {
        //    self.view.backgroundColor = UIColor.orange
            self.resource = "todos"
        }
        else if(row == 5) {
          //  self.view.backgroundColor = UIColor.purple
            self.resource = "users"
        }
        
        print("resource: " + self.resource)
    }
    //
    
    //TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func storeJsonInCellArray(y: NSArray) -> Void {
        //Clears out items array
        items.removeAll()
        self.calledDictDirectly = false

        for i in 0...y.count-1 {
            storeJsonInCellDict(x: y[i] as! NSDictionary)
        }
        
        self.calledDictDirectly = true
    }
    
    func storeJsonInCellDict(x: NSDictionary) -> Void {
        print("x: \(x)")
        
        if(calledDictDirectly) {
            //Clears out items array
            items.removeAll()
        }
        
        self.items.append("---------------------")
        for(key, value) in x {
            print("key: \(key)")
            print("value: \(value)")
            
            let item: String = "\(key): \(value)"
            
            self.items.append(item)
        }
        self.items.append("---------------------")

        self.tableView.reloadData()
    
        print(self.items)
        print(self.items.count)
    }
    //End of TableView methods
    
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
        
        print("OK: " + self.resource)
        let endpoint: String = "http://jsonplaceholder.typicode.com/" + resource + "/" + item.text!
        let parameters: Parameters = [parameter.text!: parameterValue.text!]
        
        Alamofire.request(endpoint, parameters: parameters)
//            Alamofire.request("http://jsonplaceholder.typicode.com/comments")
         .responseJSON { response in
         print(response.request)  // original URL request
         
         if let JSON = response.result.value {
            print("JSON: \(JSON)")
            
            if let o = JSON as? NSArray {
                print("Treat it as an array: \(o[0])")
                self.storeJsonInCellArray(y: JSON as! NSArray)
            } else {
                self.storeJsonInCellDict(x: JSON as! NSDictionary)
            }
        
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
        
        //Picker View
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //Table View
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
}

