//
//  PrototypeView.swift
//  VisualizerTest
//
//  Created by Haralambos Kogos on 2024.04.28.
//

import SwiftUI

enum SegmentShape: View {
    case rectangle, circle
//    case roundedRectangle(cornerRadius: CGFloat)
    //    var cornerRadius: CGFloat
    
    var body: some View {
        switch self {
        case .rectangle:
            Rectangle()
        case .circle:
            Circle()
//        case .roundedRectangle:
//            RoundedRectangle(cornerRadius: 10)
        }
    }
    
}

struct PrototypeSegment: Identifiable, View {
    let id = UUID()
    var amp: Double = { Double.random(in: 0.0..<1.0) }()
    var freq: Double = { Double.random(in: 0.0..<20000.0) }()
    var hue: Double = 0.98
    var color: Color { Color(hue: self.hue,
                             saturation: 1.0,
                             brightness: 1.0,
                             opacity: 1.0)
    }
    var shape: SegmentShape = .rectangle
    var body: some View {
        shape
            .foregroundColor(color)
            .frame(height: .infinity)
    }
    
}

struct PrototypeView: View {
    @State private var segments: [PrototypeSegment] = []
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                HStack(spacing: 2) {
                    ForEach(segments) { segment in
                        PrototypeSegment()
                            .frame(height: geo.size.height / (segment.amp / 1.0))
                            .onTapGesture {
                                print("Hue: \(segment.hue)\nAmp: \(segment.amp)\nFreq: \(segment.freq)")
                            }
                    }
                }
                .padding()
                .onAppear {
                    generatePTSegments()
            }
            }
            Button("Wawiwawa", action: randomizePTAmps)
        }
    }
    func generatePTSegments() {
        for _ in 0..<10 {
            segments.append(PrototypeSegment())
        }
    }
    func randomizePTAmps() {
        for segment in self.segments.indices {
            self.segments[segment].amp = Double.random(in: 0.0..<1.0)
        }
    }
}

#Preview {
    PrototypeView()
}
