//
//  JudgeViewController.swift
//  PitchDay
//
//  Created by Josh on 11/2/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class JudgeViewController: UIViewController {
	
	var startupName: String = ""
	
	let rubricQuestions = [(id: "Problem", text: "This startup is solving a real problem."),
						   (id: "Solution", text: "I would invest in this startup's solution."),
						   (id: "MVP", text: "This startup team demoed a high quality MVP."),
						   (id: "Invest", text: "I would invest in this startup's solution")]
	
	var questionCount = 0
	
	var rubricTracker: [(questionID: String, score: Int)] = []
	

	@IBOutlet weak var question: UITextView!
	
	@IBOutlet weak var button_0: UIButton!
	@IBOutlet weak var button_1: UIButton!
	@IBOutlet weak var button_2: UIButton!
	@IBOutlet weak var button_3: UIButton!
	@IBOutlet weak var button_4: UIButton!
	
	@IBOutlet weak var nextButton: UIButton!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		question.text = rubricQuestions[questionCount].text
		title = startupName
	}
	
	@IBAction func didTapScore(_ sender: UIButton) {
		addScore(sender)
	}
	
	@IBAction func didTapNext(_ sender: UIButton) {
		questionCount += 1
		question.text = rubricQuestions[questionCount].text
	}
	
	func addScore(_ button: UIButton) {
		
		if button.title(for: .normal)!.contains("5") {
			rubricTracker.append((questionID: rubricQuestions[questionCount].id, score: 5))
		} else if button.title(for: .normal)!.contains("4") {
			rubricTracker.append((questionID: rubricQuestions[questionCount].id, score: 4))
		} else if button.title(for: .normal)!.contains("3") {
			rubricTracker.append((questionID: rubricQuestions[questionCount].id, score: 3))
		} else if button.title(for: .normal)!.contains("2") {
			rubricTracker.append((questionID: rubricQuestions[questionCount].id, score: 2))
		} else if button.title(for: .normal)!.contains("1") {
			rubricTracker.append((questionID: rubricQuestions[questionCount].id, score: 1))
		} else if button.title(for: .normal)!.contains("0") {
			rubricTracker.append((questionID: rubricQuestions[questionCount].id, score: 0))
		}
		
		nextButton.isHidden = false
		
		print("Rubric tracker: \(rubricTracker)")
	}
	
	

}
