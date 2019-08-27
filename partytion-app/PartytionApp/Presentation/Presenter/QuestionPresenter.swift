//
//  QuestionPresenter.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/19.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import CoreData

class QuestionPresenter: BasePresenter {
    var nextView: String { return "Answer" }

    private let questionThemes = [ "ゲーム", "飲み会", "ニュース", "あるあるネタ" ]
    public private(set) var theme: String = ""
    private var playerNumber: Int = 0
    public private(set) var answerPair = (0, 0)

    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil

    // For Entity IO
    private var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    init(playerNumber: Int) {
        self.playerNumber = playerNumber
        
        self.answerPair.0 = Int.random(in: 1 ... playerNumber)
        self.answerPair.1 = playerNumber - self.answerPair.0
        
        self.theme = questionThemes[ Int.random(in: 0 ... (questionThemes.count-1)) ]
        
        self.setNextViewController()
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
    
    func registerText(text: String?) {
        let now = Date()
        
        // Get an entity
        let questions = Questions(context: managedContext)
        
        // set attribute
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = NSEntityDescription.entity(forEntityName: "Questions", in: managedContext)
        request.includesSubentities = false
        
        do {
            let id = Int64(try managedContext.fetch(request).count)
            questions.id = id
            questions.players = Int64(playerNumber)
            questions.theme = theme
            questions.question = text
            questions.created_at = now


            // set id to ViewController
            (viewController as! AnswerViewController).question_id = id
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        
        // Save data using by saveContext()
        if managedContext.hasChanges {
            do {
                try managedContext.save()
                print("data saved")

            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        // sqlite の生成場所が見たい時は以下のコメントアウトを戻す
//        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
//        print("\(path)")
    }
}
