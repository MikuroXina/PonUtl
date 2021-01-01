//
//  ViewController.swift
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/01.
//

import Cocoa
import MetalKit

class ViewController: NSViewController, MTKViewDelegate {
    
    @IBOutlet var previewView: MTKView!
    
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    var pipelineState: MTLRenderPipelineState!
    var viewSize = CGSize.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        previewView.delegate = self
        
        device = MTLCreateSystemDefaultDevice()
        previewView.device = device
        commandQueue = device.makeCommandQueue()
        commandQueue.label = "PUCommandQueue"
        
        let defaultLib = device.makeDefaultLibrary()!
        let pipelineDesc = MTLRenderPipelineDescriptor.init()
        pipelineDesc.label = "PURenderPipeline"
        pipelineDesc.vertexFunction = defaultLib.makeFunction(name: "vertex_shader")
        pipelineDesc.vertexFunction?.label = "ponutl_vertex_shader"
        pipelineDesc.fragmentFunction = defaultLib.makeFunction(name: "fragment_shader")
        pipelineDesc.fragmentFunction?.label = "ponutl_fragment_shader"
        pipelineDesc.colorAttachments[0].pixelFormat = previewView.colorPixelFormat
        pipelineState = try! device.makeRenderPipelineState(descriptor: pipelineDesc)
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        viewSize = size
    }
    
    func draw(in view: MTKView) {
        let vertexes: [PUVertex] = [
            PUVertex(position: .init(250, -250, 0)),
            PUVertex(position: .init(-250, -250, 0)),
            PUVertex(position: .init(0, 250, 0)),
        ]
        var uniforms = PUUniform.init(screenSize: .init(Float(viewSize.width), Float(viewSize.height)))

        guard let commandBuf = commandQueue.makeCommandBuffer(),
              let onscreenDesc = view.currentRenderPassDescriptor,
              let commandEnc = commandBuf.makeRenderCommandEncoder(descriptor: onscreenDesc) else { return }
        commandBuf.label = "PUCommandBuffer"
        commandEnc.label = "PUCommandEncoder"
        
        commandEnc.setViewport(.init(originX: 0.0, originY: 0.0, width: Double(viewSize.width), height: Double(viewSize.height), znear: -10.0, zfar: 10.0))
        
        commandEnc.setRenderPipelineState(pipelineState)
        
        commandEnc.setVertexBytes(vertexes, length: vertexes.count * MemoryLayout<PUVertex>.stride, index: 0)
        commandEnc.setVertexBytes(&uniforms, length: MemoryLayout<PUUniform>.stride, index: 1)
        
        commandEnc.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        
        commandEnc.endEncoding()
        
        if let drawable = previewView.currentDrawable {
            commandBuf.present(drawable)
        }
        commandBuf.commit()
    }

}

