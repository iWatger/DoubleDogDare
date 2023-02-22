//
//  CameraView.swift
//  DoubleDogDare
//
//  Created by Ethan Fox on 2/21/23.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    
    var body: some View {
        ZStack {
            CameraPreview(camera: camera)
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Button(action: camera.takePhoto) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 65, height: 65)
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 75, height: 75)
                        }
                    }
                    
                    // TODO: This should be taken out when we have make more of the UI detail view pane
                    if camera.isTaken {
                        Spacer()
                        Button(action: camera.retakePhoto) {
                            ZStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 65, height: 65)
                                Circle()
                                    .stroke(Color.blue, lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        }
                    }
            }
                .padding()
        }
            
        }
        .onAppear {
            camera.check()
            
        }
        
    }
}
