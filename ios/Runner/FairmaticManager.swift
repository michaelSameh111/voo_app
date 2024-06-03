//
//  FairmaticManager.swift
//  Runner
//
//  Created by Safwat Malek on 02/06/2024.
//

import Foundation
import FairmaticSDK


class FairmaticManager : NSObject {
    
    let sdkKey = "Zi7SdPnVwnmhYPVKcYrvCUUdyNEpU2kQ"
    
    
    func setup(driverName: String?,
               driverEmail:String?,
               driverPhone:String?,
               driverId:String?){
        
        let driverAttributes = DriverAttributes(name: driverName!,
                                                email: driverEmail,
                                                phoneNumber: driverPhone)
        let config = Configuration(sdkKey: sdkKey,
                                   driverId: driverId!,
                                   driverAttributes: driverAttributes)
        
       
        Fairmatic.setupWith(configuration: config, delegate: self) { success, setupError in
            if let setupError = setupError {
                print(">>> setupWithConfiguration error: \((setupError as NSError).localizedDescription)")
            } else {
                print(">>> setupWithConfiguration:success")
            }
        }
        
    }
    
    func trunOn(){
        requestP1(){success, error in
            if success {
                print(">>> driver available for new ride")
            } else if let error = error{
                print(">>> driver turn on has an error: \(error.localizedDescription)")
            }
        }
    }
    
    func acceptTrip(tripId:String){
        requestP2(tripId: tripId){success, error in
            if success {
                print(">>> driver has accept trip: \(tripId)}")
            } else if let error = error{
                print(">>> driver accept trip has an error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func cancleRequest(){
        requestP1(){success, error in
            if success {
                print(">>> driver cancel request ride")
            } else if let error = error{
                print(">>> driver request cancel has an error: \(error.localizedDescription)")
            }
        }
    }
    
    func startTrip(tripId:String){
        requestP3(tripId: tripId){success, error in
            if success {
                print(">>> trip started succesfully with id: \(tripId)}")
            } else if let error = error{
                print(">>> start trip has an error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func endTrip(){
        requestP1(){success, error in
            if success {
                print(">>> driver end trip success")
            } else if let error = error{
                print(">>> driver end trip has an error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func turnOff(){
        Fairmatic.stopPeriod(){success, error in
            if success {
                print(">>> driver turn off")
            } else if let error = error{
                print(">>> driver driver turn off error: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func requestP1(completionHandler: FairmaticSDK.InsuranceAPICompletionHandler?){
        Fairmatic.startDriveWithPeriod1(completionHandler)
    }
    private func requestP2(tripId:String, completionHandler: FairmaticSDK.InsuranceAPICompletionHandler?){
        Fairmatic.startDriveWithPeriod2(tripId,completionHandler: completionHandler)
    }
    private func requestP3(tripId:String, completionHandler: FairmaticSDK.InsuranceAPICompletionHandler?){
        Fairmatic.startDriveWithPeriod3(tripId,completionHandler: completionHandler)
    }
    private func requestStop(completionHandler: FairmaticSDK.InsuranceAPICompletionHandler?){
        Fairmatic.stopPeriod(completionHandler)
    }
    

}

 extension FairmaticManager: FairmaticDelegate {
    func processStart(ofDrive startInfo: DriveStartInfo) {
        print("Fairmatic SDK started for drive with tracking id \(startInfo.trackingId ?? "nil")")
    }
    
    func processResume(ofDrive resumeInfo: DriveResumeInfo) {
        print("Fairmatic SDK resumed for drive with tracking id \(resumeInfo.trackingId ?? "nil")")
    }
    
    func processAnalysis(ofDrive analyzedDriveInfo: AnalyzedDriveInfo) {
        print("Fairmatic SDK analyzed drive with tracking id \(analyzedDriveInfo.trackingId ?? "nil")")
    }
    
    func processPotentialAccidentDetected(_ accidentInfo: AccidentInfo) {
        print("Fairmatic SDK detected potential accident with tracking id \(accidentInfo.trackingId ?? "nil")")
    }
    
    func processAccidentDetected(_ accidentInfo: AccidentInfo) {
        print("Fairmatic SDK detected accident with tracking id \(accidentInfo.trackingId ?? "nil")")
    }
    
    func processEnd(ofDrive estimatedDriveInfo: EstimatedDriveInfo) {
       print("Fairmatic SDK ended drive with tracking id \(estimatedDriveInfo.trackingId ?? "nil")")
    }
    
    func settingsChanged(_ settings: Settings) {
        print("Settings changed from FMSDK, and \(settings.errors.count) errors were found!")
        
        settings.errors.forEach {
            print("Error from Fairmatic SDK: \($0.errorType)")
        }
    }
}
