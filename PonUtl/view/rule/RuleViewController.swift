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

// RuleViewController builds RuleView and notifies updating Rule
// RuleView shows key-value and notifies updating it
class RuleViewController: NSViewController {
    @IBOutlet var rulesStackView: NSStackView!

    var delegate: RuleUpdate!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func addItem(key _: String, value _: Any) {}

    func onChange(_: Any) {}
}
