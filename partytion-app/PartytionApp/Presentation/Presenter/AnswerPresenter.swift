import UIKit
import CoreData

class AnswerPresenter: BasePresenter {
    var nextView: String { return "Result" }

    public private(set) var question_id: Int = 0
    
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil

    // For Entity IO
    private var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    public private(set) var question: Questions?
    
    init(question_id: Int) {
        self.question_id = question_id
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
    
    func getQuestion() -> Questions? {
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
    
    func stuckAnswer(answerText: String?) {
        let now = Date()

        // Get an entity
        let users = Users(context: managedContext)

        
    }
}
