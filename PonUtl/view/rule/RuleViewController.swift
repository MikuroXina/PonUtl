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
    @IBOutlet var rulesStackView: NSStackView!
    
    var delegate: RuleUpdate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numericRuleView = NSNib.init(nibNamed: NSNib.Name("NumericRule"), bundle: Bundle.main) as! NSView
        
    }
    
    func addItem(key: String, value: Any) {
    }

    func onChange(_ sender: Any) {
    }
}
