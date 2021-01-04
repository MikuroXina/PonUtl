//
//  MainViewController.swift
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/02.
//

import Cocoa

// MainViewController converts view events into user events and delegates them
class MainViewController: NSViewController, RuleUpdate {
    @IBOutlet var objController: NSObjectController!

    var previewCtrl: PreviewViewController!
    var ruleCtrl: RuleViewController!

    override func viewDidLoad() {
        ruleCtrl.delegate = self
    }

    @IBSegueAction func previewSegue(_ coder: NSCoder) -> PreviewViewController? {
        previewCtrl = PreviewViewController(coder: coder)
        return previewCtrl
    }

    @IBSegueAction func ruleSegue(_ coder: NSCoder) -> RuleViewController? {
        ruleCtrl = RuleViewController(coder: coder)
        return ruleCtrl
    }

    func updateRule(predicate: NSPredicate) {
        print(predicate)
    }
}
