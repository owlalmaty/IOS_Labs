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
   
    var arrQuestion = [Question(que: "Who created Linux?",
                                cur: "",
                                cor: "Linus Torjvalds",
                                corB: false,
                                varA: ["Linus Torjvalds", "Richard Stallman", "Eric Raymond"]),
                       Question(que: "Which was the first commercial company to put its software in Open Source?",
                                cur: "", cor: "Netscape", corB: false, varA: ["IBM","Netscape", "Microsoft"]),
                       Question(que: "Is Apache the Web server with the largest market share?",
                                cur: "",
                                cor: "True",
                                corB: false,
                                varA: ["True","False"]),
                       Question(que: "Open Source software is generally more expensive for its users.",
                                cur: "",
                                cor: "False",
                                corB: false,
                                varA: ["True","False"]),
                       Question(que: "What organization defines Open Source rules?",
                                cur: "", cor: "The Open Source Initiative",
                                corB: false,
                                varA: ["The Open Source Institute","The Open Source Committee","The Open Source Initiative","The Open Source Board"]),
                       Question(que: "Was the GPL license invented by Richard Stallman?",
                                cur: "",
                                cor: "True",
                                corB: false,
                                varA: ["True","False"]),
                       Question(que: "MySql, Samba and Perl are Open Source software.",
                                cur: "",
                                cor: "True",
                                corB: false,
                                varA: ["True","False"])]
    
    var cur: Int = 0
    var totalScore: Int = 0
    var newList: Array<Question> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newList = Quiz.sharedInstance.generate(arrQue: arrQuestion)
        NewQ()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
        newList = Quiz.sharedInstance.generate(arrQue: arrQuestion)
        NewQ()
    }
    
    func NewQ() {
        labelQ.text = newList[cur].question
        let variant = newList[cur].variantArray
        for i in 0..<variant.count{
            let button = UIButton(frame: CGRect(x: 0, y: 52*i+150, width: Int(UIScreen.main.bounds.size.width), height: 50))
            button.backgroundColor = UIColor.blue
            button.setTitle(variant[i], for: UIControlState.normal)
            button.addTarget(self, action:#selector(buttonClicked(_:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    
    func buttonClicked(_ sender:UIButton) {
        newList[cur].currentAnswer = sender.currentTitle!
        if(sender.currentTitle == newList[cur].correctAnswer){
            totalScore+=1
            newList[cur].correct = true
            super.loadView()
        }
        else{
            newList[cur].correct = false
            super.loadView()
        }
        if cur < newList.count-1{
            cur+=1
            NewQ()
        }else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "third") as! TableViewController
            vc.delegate  = self
            vc.inite(arrayOfAns: newList, totalOfScore: totalScore)
            reset()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func reset() {
        cur = 0
        totalScore = 0
        newList = Quiz.sharedInstance.generate(arrQue: arrQuestion)
    }

}
