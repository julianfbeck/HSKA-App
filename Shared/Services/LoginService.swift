//
//  LoginService.swift
//  Shared
//
//  Created by Julian Beck on 17.09.20.
//

import Foundation

public struct LoginService {
    
    public static var isLogedIn :Bool {
        if let token = getAccessToken(){
            return token != ""
        }
        return false
    }
    
    public static func tryLogin(user: String, password: String, completion: @escaping (Bool) -> ()) {
        let accessToken = "\(user.lowercased()):\(password)".toBase64()
        HSKAService.getGrades(client: NetworkClient(), accessToken: accessToken) { grades in
            
            if grades == nil {
                self.resetAccessToken()
            } else {
                if let userDefaults = UserDefaults(suiteName: Constants.appGroup) {
                    userDefaults.set(accessToken as AnyObject, forKey: "accessToken")
                    userDefaults.synchronize()
                }
            }
            
            completion(isLogedIn)
            
        }
    }
    
    public static func getAccessToken() -> String? {
        if let userDefaults = UserDefaults(suiteName: Constants.appGroup) {
            let accessToken = userDefaults.string(forKey: "accessToken")
            return accessToken
        }
        return nil
    }
    
    public static func resetAccessToken(){
        if let userDefaults = UserDefaults(suiteName: Constants.appGroup) {
            userDefaults.set("" as AnyObject, forKey: "accessToken")
            userDefaults.synchronize()
        }
    }
}
