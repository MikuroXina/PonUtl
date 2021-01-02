//
//  RuleViewController.swift
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/02.
//

import Cocoa

protocol RuleUpdate {
    func updateRule(predicate: NSPredicate)
}

class RuleViewController: NSViewController {
    @IBOutlet var ruleView: NSPredicateEditor!
    
    var delegate: RuleUpdate!
    
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

    @IBAction func onChangePredicate(_ sender: Any) {
        delegate.updateRule(predicate: ruleView.predicate!)
    }
}
