//
//  ScreenCapture.swift
//  Ice
//
//  Fire port: permissions no longer depend on CGWindowName (often nil on
//  Tahoe even with Screen Recording granted). Capture path kept on Fire's
//  Bridging.createCGWindowArray API.

import CoreGraphics
import ScreenCaptureKit

enum ScreenCapture {
    private enum Cache {
        static var lastCheckResult: Bool?
        static var lastCheckDate = Date.distantPast
    }

    static func checkPermissions() -> Bool {
        if CGPreflightScreenCaptureAccess() {
            return true
        }
        for windowID in Bridging.getMenuBarWindowList(option: [.itemsOnly, .activeSpace]) {
            guard
                let window = WindowInfo(windowID: windowID),
                window.owningApplication != .current
            else {
                continue
            }
            if window.title != nil {
                return true
            }
        }
        return false
    }

    static func cachedCheckPermissions(reset: Bool = false) -> Bool {
        let now = Date()
        if !reset, let last = Cache.lastCheckResult, now.timeIntervalSince(Cache.lastCheckDate) < 15 {
            return last
        }
        let result = checkPermissions()
        Cache.lastCheckResult = result
        Cache.lastCheckDate = now
        return result
    }

    static func requestPermissions() {
        if #available(macOS 15.0, *) {
            SCShareableContent.getWithCompletionHandler { _, _ in }
        } else {
            CGRequestScreenCaptureAccess()
        }
    }

    static func captureWindows(
        with windowIDs: [CGWindowID],
        screenBounds: CGRect? = nil,
        option: CGWindowImageOption = []
    ) -> CGImage? {
        guard let array = Bridging.createCGWindowArray(with: windowIDs) else {
            return nil
        }
        let bounds = screenBounds ?? .null
        return CGImage(windowListFromArrayScreenBounds: bounds, windowArray: array, imageOption: option)
    }

    static func captureWindow(
        with windowID: CGWindowID,
        screenBounds: CGRect? = nil,
        option: CGWindowImageOption = []
    ) -> CGImage? {
        captureWindows(with: [windowID], screenBounds: screenBounds, option: option)
    }
}
