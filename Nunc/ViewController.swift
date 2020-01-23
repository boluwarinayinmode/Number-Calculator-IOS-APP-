//
//  ViewController.swift
//  Nunc
//
//  Created by Boluwarin Ayinmode on 12/16/19.
//  Copyright © 2019 Boluwarin Ayinmode. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var label: UILabel!
    
    var curr :String = "";
    var prev : String = "";
    var performingMath = false
    var count:Int = 0
    var notof:Int = 0
    var operation:Int = 0
    var holding:String = ""
    var count2:Int = 0
    var result:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib
    }
    

    @IBOutlet weak var button: UIButton!

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if  sender.tag == 11 {
            
            label.text! = ""
            curr = ""
            prev = ""
            count = 0
            notof = 0
            count2 = 0
            result = ""
            
        } else if sender.tag == 12 || sender.tag == 13 || sender.tag == 14  {
            
            count += 1
        
            if count == 2 && label.text! != "" {
                
                let x = performMath(tag: sender.tag, curr: Int(curr)!, prev: Int(prev)!)
             
                label.text! = String(x)
                
                notof = 1
                
                curr = label.text!
                
                prev = label.text!
                
                result = label.text!
                
                count = 0
                
                count2 = 0
                
                performingMath = false
                
                
            } else {
                if sender.tag != 16 {
                prev = curr
                label.text = ""
                performingMath = true
                operation = sender.tag
                count2 = 0
                }
            }
            
        } else if sender.tag == 15  { // =
            
            if prev.isEmpty && curr.isEmpty == false  || curr == ""{
                
                label.text! = curr
                
            } else if count2 >= 1 {
                    
                    prev = holding
                    
                    let x = performMath(tag: operation, curr: Int(curr)!, prev: Int(prev)!)
                    
                    label.text! = String(x)
                    curr = label.text!
                    
                    notof = 1
                    
                    count = 0
                
                result = curr
                    
                    count2 += 1
    
                } else {
            
            let x = performMath(tag: operation, curr: Int(curr)!, prev: Int(prev)!)
            
            label.text! = String(x)
            
            notof = 1
                
            prev = curr
            
            curr = label.text!
                
            holding = prev
                
            result = curr
            
            count = 0
            
            count2 += 1
                    
                    
                }
        
            } else {
            
            if notof == 1 {
                label.text = ""
                label.text = label.text! + String(sender.tag - 1)
                curr = label.text!
                notof = 0
                count = 1
                count2 = 0
                result =  curr
                
            } else {
                
                label.text = label.text! + String(sender.tag - 1)
                curr = label.text!
                count2 = 0
                result = curr
            }
            
        }
    
          }
    
    
    func performMath(tag:Int, curr:Int, prev:Int) -> Int {
        
        switch tag {
        case 12:return curr + prev
        case 13: return prev - curr
        case 14: return curr * prev
        default:
            return 1
        }
        
    }
    
    @IBAction func convert(_ sender: Any) {
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is ResultsViewController{
            
            let trans = segue.destination as? ResultsViewController
            
            trans?.result = result
        
        }
    }
}




