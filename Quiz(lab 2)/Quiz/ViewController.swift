//
//  ViewController.swift
//  Quiz
//
//  Created by Saulebekov Azamat on 06.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func `switch`(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

