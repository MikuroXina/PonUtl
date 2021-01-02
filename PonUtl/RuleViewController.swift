//
//  RuleViewController.swift
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/02.
//

import Cocoa

class RuleViewController: NSViewController {
    @IBOutlet var ruleView: NSPredicateEditor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ruleView.rowTemplates = [
            .init(leftExpressions: [.init(forKeyPath: "degress")],
                  rightExpressionAttributeType: .doubleAttributeType,
                  modifier: .direct,
                  operators: [NSNumber(value: NSComparisonPredicate.Operator.equalTo.rawValue)],
                  options: 0)
        ]
        ruleView.objectValue = NSPredicate.init(format: "degress = 60.0")
    }
}