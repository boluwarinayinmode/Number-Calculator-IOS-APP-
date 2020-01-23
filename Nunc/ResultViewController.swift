//
//  ResultViewController.swift
//  Nunc
//
//  Created by Boluwarin Ayinmode on 1/8/20.
//  Copyright © 2020 Boluwarin Ayinmode. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    var result:String = ""
    
    
    
    @IBOutlet weak var resultlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let num = converter()
        
        //lab.text! =
        
        
        resultlabel.text! = num.get_type(result)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
