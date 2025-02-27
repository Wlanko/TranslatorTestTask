//
//  TranslatorViewModel.swift
//  TranslatorTestTask
//
//  Created by Vlad Kyrylenko on 26.02.2025.
//

import Foundation
import AVFoundation
import SwiftUI

class TranslatorViewModel {
//    var isAuthorized: Bool {
//        get async {
//            let status = AVCaptureDevice.authorizationStatus(for: .audio)
//            
//            var isAuthorized = status == .authorized
//            
//            if status == .notDetermined {
//                isAuthorized = await AVCaptureDevice.requestAccess(for: .audio)
//            }
//            
//            return isAuthorized
//        }
//    }
    
    func getPermission() {
        Task.init {
            await AVCaptureDevice.requestAccess(for: .audio)
        }
    }
    
    func isAuthorized(showUnauthorizedAlert: Binding<Bool>, _ permitRecording: Binding<Bool>) {
        Task.init {
            let status = AVCaptureDevice.authorizationStatus(for: .audio)
            
            if status == .authorized {
                permitRecording.wrappedValue = true
            } else if status == .notDetermined {
                await AVCaptureDevice.requestAccess(for: .audio)
            } else {
                showUnauthorizedAlert.wrappedValue = true
            }
            return
        }
    }
}
