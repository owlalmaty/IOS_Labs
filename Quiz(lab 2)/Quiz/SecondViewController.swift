//
//  SecondViewController.swift
//  Quiz
//
//  Created by Saulebekov Azamat on 06.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelQ: UILabel!
    
    var array = [["Amazon", "B", "C", "D"],["A1","B1", "C1"],["A2","B2", "C2"]]
    var dict = ["Which of these is the largest river by discharge of water in the world?":"Amazon", "Second":"B1", "Third":"C2"]
    
    var cur: Int = 0
    var totalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewQ()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func NewQ() {
        labelQ.text = Array(dict.keys).sorted()[cur]
        let variant = array[cur]
        for i in 0..<variant.count{
            let button = UIButton(frame: CGRect(x: 16, y: 50*i+150, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
            button.backgroundColor = UIColor.blue
            button.setTitle(variant[i], for: UIControlState.normal)
            button.addTarget(self, action:#selector(buttonClicked(_:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    
    func buttonClicked(_ sender:UIButton) {
            
        if(sender.currentTitle == Array(dict.values).sorted()[cur]){
            totalScore+=1
            super.loadView()
            self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        else{
            super.loadView()
            self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        if cur < dict.count-1{
            cur+=1
            NewQ()
        }else {
            super.loadView()
            labelQ.text = String(totalScore) + " from " + String(dict.count)
            let button = UIButton(frame: CGRect(x: 16, y: 150, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
            button.backgroundColor = UIColor.blue
            button.setTitle("Restart", for: UIControlState.normal)
            button.addTarget(self, action:#selector(butRef(_:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    func butRef(_ sender:UIButton) {
        cur = 0
        totalScore = 0
        super.loadView()
        NewQ()
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
