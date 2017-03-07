//
//  ViewController.swift
//  multiple-picker
//
//  Created by Admin on 07/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    struct time {
        private var _hr = Int()
        private var _min = Int()
        private var _sec = Int()
        
        var hr:Int{
            get{
                return _hr
                print("get hr")
            }
            set{
                _hr = newValue
                print("set hr \(newValue)")
            }
        }
        
        var min : Int{
            get{
                return _min
            }
            set{
                _min = newValue
                print("set sec \(newValue)")
            }
        }

        
        
        var sec : Int{
            get{
                return _sec
            }
            set{
                _sec = newValue
                print("set sec \(newValue)")
            }
        }
        init() {
            print("time inited")
            hr = 0
            min = 0
            sec = 0
        }
        func timeString() -> String {
            return "\(self.hr):\(self.min):\(self.sec)"
        }
        
        
    };
    
    var startTime = time()
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var textbox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        textbox.inputView = picker
        
        picker.delegate = self
        picker.dataSource = self
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 12
        }
        if component == 1{
            return 60
        }
        if component == 2{
            return 60
        }
        else{
        return 0
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            if row == 0 {
                return "hour"
            }else{
                return "\(row-1)"
 
            }
        }
        if component == 1{
            if row == 0 {
                return "minutes"
            }else{
                return "\(row-1)"
 
            }
        }
        if component == 2{
            if row == 0 {
                return "seconds"
            }else{
                return "\(row-1)"
 
            }
            
        }
        return "nil"

    
//        return arr[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        var empty = Bool()
        
        
        if component == 0 {
            if row == 0 {
                empty = true
            }else{

                startTime.hr = row-1
            }
        }
        if component == 1{
            if row == 0 {
                empty = true
            }else{
               startTime.min = row-1
            }
        }
        if component == 2{
            if row == 0 {
                empty = true
            }else{
                startTime.sec = row-1
            
            }
            
        }

        textbox.text = startTime.timeString()
    }
    
    
    
    


}

