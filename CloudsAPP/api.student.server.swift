import Foundation
import Alamofire
import Gloss

struct  ApiStudentServer: Decodable {
    
    let id: String?
    let name: String?
    let gender: String?
    let birth: String?
    let email: String?
    let phone: String?
    let address: String?

    init?(json: JSON) {
        self.id = "cID" <~~ json
        self.name = "cName" <~~ json
        self.gender = "cSex" <~~ json
        self.birth = "cBirthday" <~~ json
        self.email = "cEmail" <~~ json
        self.phone = "cPhone" <~~ json
        self.address = "cAddr" <~~ json
    }
}

extension ApiStudentServer {
    
    static func fetch(completion: @escaping ([ApiStudentServer]) -> Void) {
        request("http://192.168.62.3:6080/api/read_data.php").responseJSON { response in
            
            guard let dataTransfer = [ApiStudentServer].from(jsonArray: response.result.value as! [JSON]) else {
                return
            }
            
            //之後再用到全域變數
//            let helper = Helper.sharedInstance
//            helper.apiStudentServer = dataTransfer
            
            completion(dataTransfer)
        }
    }
}

