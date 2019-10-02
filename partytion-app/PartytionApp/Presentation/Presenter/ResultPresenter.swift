//
//  ResultPresenter.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/31.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import CoreData

class ResultPresenter: BasePresenter {
    var nextView: String { return "HowTo" }
    private let animationTag: String = "BeerBubbles"

    public private(set) var question_id: Int = 0
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil
    public private(set) var count: Int = 0

    // For Entity IO
    private var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init(question_id: Int) {
        self.question_id = question_id
        self.setNextViewController()

        self.getQuestion()
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }

    func getQuestion() -> Questions? {
        var question: Questions? = nil

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Questions")
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "question_id = %@", String(question_id))
        
        do {
            let questions = try managedContext.fetch(request)
            // we shouldn't have any duplicates in CD
            assert(questions.count < 2)
            
            question = questions.first as? Questions
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        return question
    }
    
    func getResult() -> (Double, Double) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.predicate = NSPredicate(format: "question_id = %@", String(question_id))
        var resultPair: (Double, Double) = (0, 0)

        do {
            let users = try managedContext.fetch(request)
            
            self.count = users.count
            users.forEach {
                if ($0 as! Users).answer == "yes" {
                    resultPair.0 += 1.0
                } else {
                    resultPair.1 += 1.0
                }
            }
            
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        return resultPair
    }
    
    func showAnimation(panel: UIView) {
        let animationView = AnimationView(name: self.animationTag)
        animationView.animationSpeed = 0.9
        animationView.loopMode = LottieLoopMode.loop

        panel.addSubview(animationView)

        animationView.play()
    }
}
