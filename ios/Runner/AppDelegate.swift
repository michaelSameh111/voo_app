import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var flutterResult: FlutterResult? = nil
    var flutterController: FlutterViewController? = nil
    let fairmaticManager = FairmaticManager()
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
      GMSServices.provideAPIKey("AIzaSyC0vwuoMC2YaegAD6xJEomD0VjNRVXYh60")
      
      GeneratedPluginRegistrant.register(with: self)
    
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      flutterController = controller
      
      
      let fairmaticChannel = FlutterMethodChannel(name: "fairmatic_channel",  binaryMessenger:controller.binaryMessenger)
      
      fairmaticChannel.setMethodCallHandler({
          (call: FlutterMethodCall,result: @escaping FlutterResult) -> Void in
          
          if call.method  == "setup" {
              let args = call.arguments as? Dictionary<String,String>

              self.fairmaticManager.setup(driverName: args?["driver_name"] ,
                                       driverEmail:args?["driver_email"],
                                       driverPhone: args?["driver_phone"],
                                       driverId: args?["driver_id"])
          }
          
          
          
      })
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    
}
