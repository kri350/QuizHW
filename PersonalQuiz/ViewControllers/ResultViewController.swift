//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultChar: UILabel!
    @IBOutlet var resultDescription: UILabel!
    var answersResult: [Answer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let animal = Answer.getResult(answers: answersResult)
        print(animal)
        resultChar.text = String(animal.rawValue)
        resultDescription.text = animal.definition
    }
   
}

