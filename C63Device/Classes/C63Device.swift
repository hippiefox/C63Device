//
//  C63Device.swift
//  C63Device
//
//  Created by pulei yu on 2023/10/23.
//

import DeviceKit
import Foundation
import KeychainAccess
import UIKit

public struct C63Device {
    public static var keychain_access_key: String?

    public static let app_name: String = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    public static let app_version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    public static let bundle_id = Bundle.main.bundleIdentifier ?? ""

    public static let system_name = UIDevice.current.systemName
    public static let system_version = UIDevice.current.systemVersion

    public static let device_name = UIDevice.current.name
    public static var device_model: String {
        switch Device.current {
        case .unknown: return UIDevice.current.model
        default: return Device.current.safeDescription
        }
    }

    public static let local_language = Locale.preferredLanguages[0]
    public static var language: String { Locale.preferredLanguages[0].components(separatedBy: "-").first! }

    public static var unique_device_id: String {
        let service = keychain_access_key ?? C63Device.bundle_id
        let key = keychain_access_key ?? C63Device.bundle_id
        let kcService = Keychain(service: service)

        if let deviceId = try? kcService.get(key) {
            return deviceId ?? ""
        }
        // 创建新的uuid
        let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
        let uuidString = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
        let __uuidStr = uuidString as? String ?? ""
        do {
            try kcService.set(__uuidStr, key: key)
            return __uuidStr
        } catch {
            return ""
        }
    }
}
