//
//  ViewController.swift
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/01.
//

import Cocoa
import MetalKit

class PreviewViewController: NSViewController {
    @IBOutlet var previewView: MTKView!
    
    var renderer: MetalRenderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        renderer = MetalRenderer(previewView)
        previewView.delegate = renderer
    }
}
