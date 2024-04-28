//
//  ContentView.swift
//  VisualizerTest
//
//  Created by Haralambos Kogos on 2024.04.07.
//
import SwiftUI

struct Segment: Identifiable {
    var id = UUID()
    var amplitude: Double = 0.0
    var frequency: Double = 0.0
    var hue: Double
}
// Test c/pu

@Observable
final class VisualizerManager {
    var noOfSegments: Int = 10
    var segments: [Segment] = []
    var currentHue: Double = 0.0
    let frequencyRange: [Int] = [Int](20..<20000)
    
    init() {
//        self.noOfSegments   = noOfSegments
//        self.segments       = segments
//        self.currentHue     = currentHue
        generateSegments(noOfSegmnents: noOfSegments, hue: &self.currentHue)
    }
    func changeHue(currentHue: Double, noOfSegments: Int) {
        let hueDelta: Double = 1000.0 / Double(noOfSegments)
        self.currentHue = currentHue + hueDelta
        if self.currentHue > 99.9 {
            self.currentHue -= 100
        }
    }
    func generateSegments(noOfSegmnents: Int, hue: inout Double) {
        for _ in 0..<noOfSegmnents {
            segments.append(Segment(hue: hue))
            changeHue(currentHue: hue, noOfSegments: noOfSegmnents)
        }
    }
    func randomizeAmps() {
        for segment in self.segments.indices {
            self.segments[segment].amplitude = Double.random(in: 20..<20000)
        }
    }
}
struct ContentView: View {
    @State private var visualizer = VisualizerManager()
    
    var body: some View {
        VStack {
            HStack(spacing: 1) {
                ForEach(visualizer.segments) { segment in
                    segmentView
                        .frame(height: 1 * segment.amplitude / 100)
                        .animation(.default, value: segment.amplitude)
                        .onTapGesture {
//                            segment.amplitude = visualizer.frequencyRange.randomElement()
                        }
                }
            }
            .frame(maxHeight: .infinity)
            .cornerRadius(30)
            .padding(.top)
            HStack {
                Text("Tunesplash")
                Button("Brrt", systemImage: "dice", action: visualizer.randomizeAmps)
                    .buttonStyle(.bordered)
                
            }
        }
        .onAppear(perform: visualizer.randomizeAmps)
    }
    var segmentView: some View {
        Rectangle()
            .fill(.purple.gradient)
            .brightness(-0.1)
            .cornerRadius(10)
//            .padding(.top)
    }
}

#Preview {
    ContentView()
}
