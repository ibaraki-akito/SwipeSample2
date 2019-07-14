import Foundation
import UIKit

if NSClassFromString("XCTestCase") != nil {
    UIApplicationMain(CommandLine.argc,
                      CommandLine.unsafeArgv,
                      NSStringFromClass(UIApplication.self),
                      NSStringFromClass(TestingAppDelegate.self))
} else {
    UIApplicationMain(CommandLine.argc,
                      CommandLine.unsafeArgv,
                      NSStringFromClass(UIApplication.self),
                      NSStringFromClass(AppDelegate.self))
}
