//
//  ResultsViewController.swift
//  Nunc
//
//  Created by Boluwarin Ayinmode on 1/8/20.
//  Copyright © 2020 Boluwarin Ayinmode. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result:String = ""
    
    
    @IBOutlet weak var resultlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if result.isEmpty{
            
            resultlabel.text! = "No Value"
        } else if result.count > 12 {
            
            resultlabel.text! = "Out Of Range"

        }
        else{
        let num = converter()
        resultlabel.text! = num.get_type(result)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
