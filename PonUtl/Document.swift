//
//  Document.swift
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/01.
//

import Cocoa
import MetalKit

class Document: NSPersistentDocument {
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
        let ctx = managedObjectContext!
        let newRule = NSEntityDescription.insertNewObject(forEntityName: "ShapeRule", into: ctx) as! ShapeRule
        newRule.degress = 60.0
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        addWindowController(windowController)
    }
}

struct PUVertex {
    var position: SIMD3<Float>
}

struct PUUniform {
    var screenSize: SIMD2<Float>
}
