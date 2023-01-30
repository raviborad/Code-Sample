//
//  ApiClient.swift

import Foundation

public struct ApiClient {
 
    static func getTopPaidAppDataFeed( complete: @escaping (_ success: Bool, _ data: [Entry]? )->() ){
        DispatchQueue.global().async {
            sleep(2)
            Manager.apiGetAppFeedList() { [self] (response, isSuccess, message) -> (Void) in
                 if isSuccess {
                     if let dataValue = Feed(dictionary: response as! NSDictionary) {
                         let entryData = dataValue.entry
                         complete(true, entryData)
                     }
                } else {
                    complete(false, [])
                }
            }
        }
    }
    
}
