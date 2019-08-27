//
//  ResultViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/07.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import Charts

class ResultViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!

    public var question_id: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPieChartView()
        
    }
    
    private func setupPieChartView() {
        self.pieChartView.usePercentValuesEnabled = true
        let values: [Double] = [30, 70]
        let yesNo : [Double] = [1, 2]
        var entries: [ChartDataEntry] = Array()
        for (i, value) in values.enumerated(){
            entries.append(ChartDataEntry(x: yesNo[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        dataSet.colors = ChartColorTemplates.vordiplom()
        
        let chartData = PieChartData(dataSet: dataSet)
        
        dataSet.drawValuesEnabled = false
        
        pieChartView.data = chartData
        
        pieChartView.holeRadiusPercent = 0.7
        pieChartView.transparentCircleRadiusPercent = 0
        pieChartView.legend.enabled = false
        pieChartView.chartDescription?.enabled = false
        pieChartView.minOffset = 0
        
        yesLabel.text = "Yes: " + String(values[0])
        noLabel.text = "No: " + String(values[1])
    }
}
