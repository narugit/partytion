//
//  ResultViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/07.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import Charts
import Lottie

extension UIColor {
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int = 255) {
        let rgba = [red, green, blue, alpha].map { i -> CGFloat in
            switch i {
            case let i where i < 0:
                return 0
            case let i where i > 255:
                return 1
            default:
                return CGFloat(i) / 255
            }
        }
        self.init(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
    }
}

class ResultViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var animationPanel: AnimationView!
    
    var timer : Timer?
    
    public var question_id: Int = 0
    private var presenter: ResultPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showAnimation()
        
        self.presenter = ResultPresenter(question_id: question_id)
        let question: Questions? = presenter.getQuestion()
        questionText.text = question!.question
        
        self.setupPieChartView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupPieChartView() {
        let resultPair: (Double, Double) = presenter.getResult()

        let values: [Double] = [resultPair.0, resultPair.1]
        let yesNo : [String] = ["Yes", "No"]
        
        customizeChart(dataPoints: yesNo, values: values)
    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        var colors: [UIColor] = []
        colors.append(UIColor(244, 174, 61))
        colors.append(UIColor(233, 128, 48))
        pieChartDataSet.colors = colors
        pieChartDataSet.valueFont = UIFont(name: "Oshidashi-M-Gothic-Regular", size: 18)!
        
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        
        pieChartView.data = pieChartData
        pieChartView.legend.enabled = false
    }
    
    private func showAnimation() {
        let animationView = AnimationView(name: "BeerBubbles")
        
        animationView.animationSpeed = 0.9
        animationView.loopMode = LottieLoopMode.loop
        
        animationPanel.addSubview(animationView)
        
        animationView.play()
    }
}
