//
//  TableViewController.swift
//  Quiz
//
//  Created by Saulebekov Azamat on 12.09.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import UIKit

protocol ShowAnswer: class {
    func inite(arrayOfAns: Array<Answer>, totalOfScore: Int)
}


class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,ShowAnswer{
    
    var delegate: GoBackDelegate?
    var totalScore: Int = 0
    var listAnswer: Array<Answer> = []
    
    @IBOutlet weak var showPoint: UILabel!
    
    func inite(arrayOfAns: Array<Answer>, totalOfScore: Int){
        totalScore = totalOfScore
        listAnswer = arrayOfAns
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAnswer.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.question.text = listAnswer[indexPath.row].question
        cell.currentAns.text = listAnswer[indexPath.row].answer
        cell.correctAns.text = listAnswer[indexPath.row].correctAnswer
        cell.Color(tORf: listAnswer[indexPath.row].correct)
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let allQuestion: Int = listAnswer.count
        showPoint.text = String(totalScore) + " from " + String(allQuestion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func restartTab(_ sender: Any) {
        delegate?.goBack()
    }
    
    

}
