//
//  PrototypeView.swift
//  VisualizerTest
//
//  Created by Haralambos Kogos on 2024.04.28.
//

import SwiftUI



//struct PrototypeView: View {
//    @State private var segments: [PrototypeSegment] = []
//    
//    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                HStack(alignment: .bottom ,spacing: 2) {
//                    ForEach(segments) { segment in
//                        PrototypeSegment()
//                            .frame(height: geo.size.height * segment.amp)
//                            .animation(.default, value: segment.amp)
//                            .onTapGesture {
//                                print("butt")
//                                print("Hue: \(segment.hue)\nAmp: \(segment.amp)\nFreq: \(segment.freq)")
//                                print("_ Center: \(geo.frame(in: .global).midX)")
//                            }
//                    }
//                }
//                .frame(height: .infinity)
//                .padding()
//                .onAppear {
//                    generatePTSegments()
//                }
//            }
//            Button("Wawiwawa", action: randomizePTAmps)
//        }
//        
//        // #warning unnecessary/debug BG
//        .background(.white)
//        .onTapGesture {
//            segments.enumerated().forEach { index, segment in
//                print("Segment#\(index) Amp: \(segment.amp)")
//            }
//        }
//    }
//    func generatePTSegments() {
//        for _ in 0..<10 {
//            segments.append(PrototypeSegment())
//        }
//    }
    
//}
//
//#Preview {
//    PrototypeView()
//}
