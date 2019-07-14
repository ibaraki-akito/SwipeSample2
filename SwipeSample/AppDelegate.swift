import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let userdef=UserDefaults.standard

    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ViewController()//SummaryReportController()//LogViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    //リモート通知
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        // そのままだと「32bit」という文字列なので以下の処理を行います
        let deviceTokenString: String = deviceToken.map { String(format: "%.2hhx", $0) }.joined()
        print("deviceTokenString \(deviceTokenString)")
        userdef.set(deviceTokenString,forKey:"deviceToken")
        userdef.synchronize()
     }

    
}

class TestingAppDelegate: UIResponder, UIApplicationDelegate { }
