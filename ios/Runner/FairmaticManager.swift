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
