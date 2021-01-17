//
//  AVCaptureDevice.swift
//  FlashLight
//
//  Created by 김예진 on 2021/01/17.
//

import Foundation
import AVFoundation

extension AVCaptureDevice {
    func toggleTorch(_ device:AVCaptureDevice , _ on: Bool) {
      
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                device.unlockForConfiguration()
            } catch {
                print("플래쉬를 실행할 수 없습니다.")
            }
        } else {
            print("플래쉬가 실행되지 않습니다.")
        }
    }
}
