import UIKit
import Flutter
import GoogleMaps
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var flutterResult: FlutterResult? = nil
    var flutterController: FlutterViewController? = nil
    let fairmaticManager = FairmaticManager()
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
      GMSServices.provideAPIKey("AIzaSyAzKPQ5DP8N_tIG3rdlwEqfGwASXBnEfTE")
      FirebaseApp.configure()

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
          
          else if call.method == "turnON"{
              self.fairmaticManager.trunOn()
          }
          
          else if call.method == "acceptRequest" {
              let args = call.arguments as? Dictionary<String,String>
              let tripId = args?["trip_id"]
              if  tripId != nil{
                  self.fairmaticManager.acceptTrip(tripId: tripId!)
              }
          }
          
          else if call.method == "cancelRequest"{
              self.fairmaticManager.cancleRequest()
          }
          
          else if call.method == "startTrip" {
              let args = call.arguments as? Dictionary<String,String>
              let tripId = args?["trip_id"]
              if  tripId != nil{
                  self.fairmaticManager.startTrip(tripId: tripId!)
              }
          }
          
          else if call.method == "endTrip" {
              self.fairmaticManager.endTrip()
          }
          
          else if call.method == "turnOff" {
              self.fairmaticManager.turnOff()
          }
          

          
      })
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    
}
