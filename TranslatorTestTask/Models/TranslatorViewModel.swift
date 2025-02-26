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
    var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .audio)
            
            // Determine if the user previously authorized camera access.
            var isAuthorized = status == .authorized
            
            // If the system hasn't determined the user's authorization status,
            // explicitly prompt them for approval.
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .audio)
            }
            
            return isAuthorized
        }
    }
    
    func getPermission() {
        Task.init {
            await AVCaptureDevice.requestAccess(for: .audio)
        }
    }
    
    func startRecording(showUnauthorizedAlert: Binding<Bool>) {
        Task.init {
            
            
            guard await isAuthorized else {
                showUnauthorizedAlert.wrappedValue = true
                return
            }
            
        }
    }
}
