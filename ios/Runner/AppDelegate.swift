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

          let args = call.arguments as? Dictionary<String,String>

          if call.method  == "setup" {
              
              self.fairmaticManager.setup(driverName: args?["driver_name"] ,
                                       driverEmail:args?["driver_email"],
                                       driverPhone: args?["driver_phone"],
                                       driverId: args?["driver_id"])
          }
          
          else if call.method == "startTrip" {
              let tripId = args?["trip_id"]
              if  tripId != nil{
                  self.fairmaticManager.startTrip(tripId: tripId!)
              }
          }
          
          else if call.method == "onWay" {
              let tripId = args?["trip_id"]
              if  tripId != nil{
                  self.fairmaticManager.onWayToPickup(tripId: tripId!)
              }
          }
          
          else if call.method == "readyForTrip" {
              self.fairmaticManager.readyForTrip()
          }
          
          else if call.method == "turnOff" {
              self.fairmaticManager.turnOff()
          }
          

          
      })
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    
}
