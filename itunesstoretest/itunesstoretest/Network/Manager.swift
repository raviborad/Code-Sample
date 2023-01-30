
import UIKit

class Manager: NSObject {
    var itemLoadedBlock : ItemLoadedBlock = {_,_,_   in }
}

extension Manager {
    
    //MARK:- Shared and singleton instance of API Manager class
    class func sharedManager() -> Manager {
        var singleton: Manager? = nil
        if singleton == nil {
            singleton = Manager()
        }
        return singleton!
    }
    
    //MARK:- API Functions Feed List
    
    class func apiGetAppFeedList(block: @escaping ItemLoadedBlock) {
        
        let url = "\(kBaseUrl)\(kTopPaidApp)"
        
        let request = Request.init(url: url, method: .get) {
            (success:Bool, request:Request, message:NSString) -> (Void) in
            
            print(request)
            guard request.isSuccess, let _ = request.serverData["feed"] else {
                block("", false, "API Error")
                return
            }
            
            if let dictData = request.serverData["feed"] as? [String: Any] {
                block(dictData, true, message as String)
            } else {
                block("", false, "API Error")
            }
        }
        request.startRequest()
    }
     
}
 
