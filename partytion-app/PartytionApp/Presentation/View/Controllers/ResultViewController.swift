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
import SSBouncyButton

class ResultViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var partitionText: UITextView!
    @IBOutlet weak var animationPanel: AnimationView!
    @IBOutlet weak var replyButton: SSBouncyButton!
    
    var timer : Timer?
    
    public var question_id: Int = 0
    private var presenter: ResultPresenter!
    private let wireframe: RootViewWireframe = RootViewWireframe()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ResultPresenter(question_id: question_id)
        self.presenter.showAnimation(panel: animationPanel)

        let question: Questions? = presenter.getQuestion()
        questionText.text = question!.question
        partitionText.text = "\(question!.partition_text!)になりましたか？"
        self.setupPieChartView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.presenter.deleteAllData()
        super.viewDidDisappear(animated)
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
        colors.append(UIColor(245, 197, 100))
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
        pieChartView.rotationEnabled = false
        pieChartView.holeRadiusPercent = 0.4
        pieChartView.transparentCircleRadiusPercent = 0
    }
    
    
    @IBAction func replyButtonTapped(_ sender: Any) {
        self.presenter.deleteAllData()
        self.wireframe.transition(to: self.presenter.viewController!)
    }
}
