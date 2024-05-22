//
//  ContentView.swift
//  VisualizerTest
//
//  Created by Haralambos Kogos on 2024.04.07.
//
import SwiftUI

enum SegmentShape {
    case rectangle(cornerRadius: CGFloat?)
    case circle
}

struct Segment: Identifiable, View {
    let id = UUID()
    var amp: Double = { Double.random(in: 0.0..<1.0) }()
    var freq: Double = { Double.random(in: 0.0..<20000.0) }()
    var hue: Double = 0.68
    var color: Color { Color(hue: self.hue,
                             saturation: 1.0,
                             brightness: 1.0,
                             opacity: 1.0)}
    
    var shape: SegmentShape = .rectangle(cornerRadius: 20)
    var cornerRadius: CGFloat?
    
    var body: some View {
        switch shape {
        case let .rectangle(cornerRadius):
            RoundedRectangle(cornerRadius: cornerRadius ?? 0.0)
        case .circle:
            Circle()
        }
    }
    
}

@Observable
final class VisualizerManager {
    var noOfSegments: Int = 10
    var segments: [Segment] = []
    let frequencyRangeArray: [Int] = [Int](20..<20000)
    let frequencyRange: Range = 20..<20000
    let colors: [Color] = [.purple, .red, .mint]
    var cornerRadius: CGFloat = 0
    var shape: SegmentShape = .rectangle(cornerRadius: 0)
    var globalColor: Color = .black
    
    init() {
        generateSegments(noOfSegmnents: noOfSegments, color: globalColor)
    }
    
    func generateSegments(noOfSegmnents: Int, color: Color) {
        for _ in 0..<10 {
            segments.append(Segment(shape: shape))
        }
    }
    
    func randomizeColor() {
        globalColor = colors.randomElement()!
    }
    
    func randomizeAmps() {
        for segment in self.segments.indices {
            self.segments[segment].amp = Double.random(in: 0.0..<1.0)
        }
    }
}

struct ContentView: View {
    @State private var visualizer = VisualizerManager()
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                HStack(alignment: .bottom ,spacing: 2) {
                    ForEach(visualizer.segments) { segment in
                        Segment()
                            .frame(height: geo.size.height * segment.amp)
                            .animation(.default, value: segment.amp)
                            .foregroundColor(segment.color)
                            .onTapGesture {
                                print("butt")
                                print("Hue: \(segment.hue)\nAmp: \(segment.amp)\nFreq: \(segment.freq)")
                                print("_ Center: \(geo.frame(in: .global).midX)")
                            }
                    }
                }
                .frame(height: .infinity)
                .padding()
                
            }
            //        .onAppear(perform: visualizer.randomizeAmps)
            HStack {
                Button("Wawiwawa", action: visualizer.randomizeAmps)
                Button("Chroma") {
                    //                    visualizer.c
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
