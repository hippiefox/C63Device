//
//  C63DeviceOrientation.swift
//  C63Device
//
//  Created by pulei yu on 2023/10/23.
//

import Foundation

public struct C63DeviceOrientation {
    public static var allowedOrientation: UIInterfaceOrientationMask = .portrait

    public static func rotateHrz() {
        C63DeviceOrientation.allowedOrientation = .landscapeRight

        if #available(iOS 16, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeLeft))
            }
        } else {
            UIDevice.current.setValue(3, forKey: "orientation")
        }
        UIViewController.attemptRotationToDeviceOrientation()
    }

    public static func rotateVtl() {
        C63DeviceOrientation.allowedOrientation = .portrait

        if #available(iOS 16, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
            }
        } else {
            UIDevice.current.setValue(3, forKey: "orientation")
        }

        UIViewController.attemptRotationToDeviceOrientation()
    }

    public static func rotateToggle() {
        if C63DeviceOrientation.allowedOrientation == .portrait {
            rotateHrz()
        } else {
            rotateVtl()
        }
    }
}
