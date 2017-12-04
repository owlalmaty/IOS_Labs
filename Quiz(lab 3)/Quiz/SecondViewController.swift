//
//  SecondViewController.swift
//  Quiz
//
//  Created by Saulebekov Azamat on 06.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import UIKit

protocol GoBackDelegate {
    func goBack()
}
extension Dictionary {
    subscript(i:Int) -> (key:Key,value:Value) {
        get {
            return self[index(startIndex, offsetBy: i)];
        }
    }
}
class SecondViewController: UIViewController, GoBackDelegate {

    @IBOutlet weak var labelQ: UILabel!
   

    var array = [["Linus Torjvalds", "Richard Stallman", "Eric Raymond"],
                 ["IBM","Netscape", "Microsoft"],
                 ["True","False"],
                 ["True","False"],
                 ["The Open Source Institute","The Open Source Committee","The Open Source Initiative","The Open Source Board"],
                 ["True","False"],
                 ["True","False"]]
    
    var dict: Dictionary = ["1 Who created Linux?":"Linus Torjvalds",
                "2 Which was the first commercial company to put its software in Open Source?":"Netscape",
                "3 Is Apache the Web server with the largest market share?":"True",
                "4 Open Source software is generally more expensive for its users.": "False",
                "5 What organization defines Open Source rules?": "The Open Source Initiative",
                "6 Was the GPL license invented by Richard Stallman?": "True",
                "7 MySql, Samba and Perl are Open Source software.": "True"]
    var cur: Int = 0
    var totalScore: Int = 0
    var listAnswer: Array<Answer> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewQ()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
        NewQ()
    }
    
    func NewQ() {
        labelQ.text = dict.sorted(by: <)[cur].key
        let variant = array[cur]
        for i in 0..<variant.count{
            let button = UIButton(frame: CGRect(x: 0, y: 52*i+150, width: Int(UIScreen.main.bounds.size.width), height: 50))
            button.backgroundColor = UIColor.blue
            button.setTitle(variant[i], for: UIControlState.normal)
            button.addTarget(self, action:#selector(buttonClicked(_:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    
    func buttonClicked(_ sender:UIButton) {
        if(sender.currentTitle == dict.sorted(by: <)[cur].value){
            totalScore+=1
            let curAns: Answer = Answer(_question: labelQ.text!, _answer: sender.currentTitle!, _correctAnswer: dict.sorted(by: <)[cur].value, _correct: true,  _questionId: cur)
            listAnswer.append(curAns)
            super.loadView()
        }
        else{
            let curAns: Answer = Answer(_question: labelQ.text!, _answer: sender.currentTitle!, _correctAnswer: dict.sorted(by: <)[cur].value, _correct: false,  _questionId: cur)
            listAnswer.append(curAns)
            super.loadView()
        }
        if cur < dict.count-1{
            cur+=1
            NewQ()
        }else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "third") as! TableViewController
            vc.delegate  = self
            vc.inite(arrayOfAns: listAnswer, totalOfScore: totalScore)
            reset()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func reset() {
        cur = 0
        totalScore = 0
        listAnswer = []
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
