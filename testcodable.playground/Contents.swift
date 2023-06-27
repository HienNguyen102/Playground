import UIKit
import CryptoKit

extension Data {
    func urlSafeBase64EncodedString() -> String {
        return base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}

struct Header: Encodable {
    let alg = "HS256"
    let typ = "JWT"
}
var spaces = [Space]()
spaces.append(Space())
struct Payload: Encodable {
    let sub = "1234567890"
    let UserName = "huyen101"
    let Spaces = spaces
}

struct Space: Encodable {
    let Name = "mbs"
}

let secret = "Inno@123"
let privateKey = SymmetricKey(data: Data(secret.utf8))

let headerJSONData = try! JSONEncoder().encode(Header())
let headerBase64String = headerJSONData.urlSafeBase64EncodedString()

let payloadJSONData = try! JSONEncoder().encode(Payload())
let payloadBase64String = payloadJSONData.urlSafeBase64EncodedString()

let toSign = Data((headerBase64String + "." + payloadBase64String).utf8)

let signature = HMAC<SHA256>.authenticationCode(for: toSign, using: privateKey)
let signatureBase64String = Data(signature).urlSafeBase64EncodedString()

let token = [headerBase64String, payloadBase64String, signatureBase64String].joined(separator: ".")
//print(token)

let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

let JSON = """
{
    "Code": 1,
    "Data": {
        "User": {
            "UserID": "1683262616522",
            "DisplayName": "huyen101",
            "Name": "Tr%C3%BAc%20Lan",
            "Status": 1,
            "Phone": "09324234432",
            "Email": "huyen101@gmail.com",
            "Phone": "09324234432",
            "StartDate": "20230505",
            "ExpireDate": "20280531",
            "ActingUserID": "1658985363690",
            "ActingUserName": "Lan%20Hu%E1%BB%B3nh",
            "Info": {},
            "Profiles": [
                {
                    "Space": "mbs",
                    "Type": "1",
                    "Profile": {
                        "DeptID": "1",
                        "BranchID": "2",
                        "Title": "abc",
                        "OrderLimit": "0",
                        "OrderLimitTotal": "0"
                    },
                    "Role": [
                        {
                            "RoleID": "22",
                            "Status": "1",
                            "ActingUserID": "1658985363690",
                            "Timestamp": "2023-03-02 10:58:42.573"
                        }
                    ]
                }
            ],
            "CreationDate": "2023-05-05 13:11:35.239982",
            "LastUpdateDate": "2023-05-22 16:45:45.180298",
            "LastUpdateUserID": "1658985363690",
            "LastUpdateUserName": "admin"
        }
    }
}
"""

// MARK: - BaseResponse
class BaseResponse: Codable {
    var code: Int?
    var data: BaseData?

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case data = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try? container.decode(Int.self, forKey: .code)
        data = try? container.decode(BaseData.self, forKey: .data)
    }
}

class BaseData: Codable {
    
}

class LogonResponse: BaseResponse {
    var logonData : LogonData?
    override var data : BaseData? {
        get{
            return logonData
        }
        set {
            if let newRacingChassis = newValue as? LogonData {
                logonData = newRacingChassis
            } else {
                print("incorrect chassis type for racecar")
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case logonData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        logonData = try? container.decode(LogonData.self, forKey: .logonData)
        try super.init(from: decoder)
    }
}

// MARK: - LogonData
class LogonData: BaseData {
    var userID, user, name, sessionKey: String?
    var profile: Profile?

    enum CodingKeys: String, CodingKey {
        case userID = "UserID"
        case user = "User"
        case name = "Name"
        case sessionKey = "SessionKey"
        case profile = "Profile"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userID = try container.decode(String.self, forKey: .userID)
        user = try container.decode(String.self, forKey: .user)
        try super.init(from: decoder)
    }
}

// MARK: - Profile
class Profile: Codable {
    var mbs: Mbs

    init(mbs: Mbs) {
        self.mbs = mbs
    }
}

// MARK: - Mbs
class Mbs: Codable {
    var deptID, branchID, title, orderLimit: String
    var orderLimitTotal, type: String
    var features: [Feature]

    enum CodingKeys: String, CodingKey {
        case deptID = "DeptID"
        case branchID = "BranchID"
        case title = "Title"
        case orderLimit = "OrderLimit"
        case orderLimitTotal = "OrderLimitTotal"
        case type = "Type"
        case features = "Features"
    }

    init(deptID: String, branchID: String, title: String, orderLimit: String, orderLimitTotal: String, type: String, features: [Feature]) {
        self.deptID = deptID
        self.branchID = branchID
        self.title = title
        self.orderLimit = orderLimit
        self.orderLimitTotal = orderLimitTotal
        self.type = type
        self.features = features
    }
}

// MARK: - Feature
class Feature: Codable {
    var featureID, featureCode: String
    var hotKeyAllow: Int
    var workSpace: String?
    var authorizationDetail: [String]

    enum CodingKeys: String, CodingKey {
        case featureID = "FeatureID"
        case featureCode = "FeatureCode"
        case hotKeyAllow = "HotKeyAllow"
        case workSpace = "WorkSpace"
        case authorizationDetail = "AuthorizationDetail"
    }

    init(featureID: String, featureCode: String, hotKeyAllow: Int, workSpace: String?, authorizationDetail: [String]) {
        self.featureID = featureID
        self.featureCode = featureCode
        self.hotKeyAllow = hotKeyAllow
        self.workSpace = workSpace
        self.authorizationDetail = authorizationDetail
    }
}


class BlogPost: BaseResponse {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    
    var title: String?
    var url: URL?
    var category: Category?
    var views: Int?
    var arrData: [String]?
    
    private enum CodingKeys : String, CodingKey {
        case title, url, category, views, arrData
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        arrData = try container.decode([String].self, forKey: .arrData)
        try super.init(from: decoder)
    }
}



// MARK: - GetUserResponse
class GetUserResponse: BaseResponse {

    var getUserData : GetUserData?
    override var data : BaseData? {
        get{
            return getUserData
        }
        set {
            if let newUserData = newValue as? GetUserData {
                getUserData = newUserData
            } else {
                print("incorrect chassis type for racecar")
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case getUserData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        getUserData = try? container.decode(GetUserData.self, forKey: .getUserData)
        try super.init(from: decoder)
    }
}

// MARK: - GetUserData
class GetUserData: BaseData {
    var user: UserDataDTO?

    enum CodingKeys: String, CodingKey {
        case user = "User"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try? container.decode(UserDataDTO.self, forKey: .user)
        try super.init(from: decoder)
    }
}

// MARK: - UserDataDTO
class UserDataDTO: Codable {
    var userID, displayName, name: String?
    var status: Int?
    var phone, email, startDate, expireDate: String?
    var actingUserID, actingUserName: String?
    //var info: Info?
    var profiles: [UserDataProfileElement]?
    var creationDate, lastUpdateDate, lastUpdateUserID, lastUpdateUserName: String?

    enum CodingKeys: String, CodingKey {
        case userID = "UserID"
        case displayName = "DisplayName"
        case name = "Name"
        case status = "Status"
        case phone = "Phone"
        case email = "Email"
        case startDate = "StartDate"
        case expireDate = "ExpireDate"
        case actingUserID = "ActingUserID"
        case actingUserName = "ActingUserName"
        //case info = "Info"
        case profiles = "Profiles"
        case creationDate = "CreationDate"
        case lastUpdateDate = "LastUpdateDate"
        case lastUpdateUserID = "LastUpdateUserID"
        case lastUpdateUserName = "LastUpdateUserName"
    }
}

// MARK: - Info
/*class Info: Codable {

    init() {
    }
}*/

// MARK: - UserDataProfileElement
class UserDataProfileElement: Codable {
    var space, type: String?
    var profile: UserDataProfileProfile?
    var role: [UserDataRole]?

    enum CodingKeys: String, CodingKey {
        case space = "Space"
        case type = "Type"
        case profile = "Profile"
        case role = "Role"
    }
}

// MARK: - UserDataProfileProfile
class UserDataProfileProfile: Codable {
    var deptID, branchID, title, orderLimit: String?
    var orderLimitTotal: String?

    enum CodingKeys: String, CodingKey {
        case deptID = "DeptID"
        case branchID = "BranchID"
        case title = "Title"
        case orderLimit = "OrderLimit"
        case orderLimitTotal = "OrderLimitTotal"
    }

    init(deptID: String?, branchID: String?, title: String?, orderLimit: String?, orderLimitTotal: String?) {
        self.deptID = deptID
        self.branchID = branchID
        self.title = title
        self.orderLimit = orderLimit
        self.orderLimitTotal = orderLimitTotal
    }
}

// MARK: - UserDataRole
class UserDataRole: Codable {
    var roleID, status, actingUserID, timestamp: String?

    enum CodingKeys: String, CodingKey {
        case roleID = "RoleID"
        case status = "Status"
        case actingUserID = "ActingUserID"
        case timestamp = "Timestamp"
    }

    init(roleID: String?, status: String?, actingUserID: String?, timestamp: String?) {
        self.roleID = roleID
        self.status = status
        self.actingUserID = actingUserID
        self.timestamp = timestamp
    }
}




let jsonData = JSON.data(using: .utf8)!

let userRes = try! JSONDecoder().decode(GetUserResponse.self, from: jsonData)
let userData =  userRes.getUserData
let user = userData?.user

print(formatter.string(from: date))


class Person : Codable {
    var name: String?
    
    private enum CodingKeys : String, CodingKey {
        case name
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

class Employee : Person {
    var employeeID: String?
    var age: Int?
    
    private enum CodingKeys : String, CodingKey {
        case age = "age"
        case employeeID = "employeeID"
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(employeeID, forKey: .employeeID)
        try container.encode(age, forKey: .age)
    }
}

let employee = Employee()
employee.employeeID = "emp123"
employee.name = "Ha"
employee.age = 20

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let data = try! encoder.encode(employee)
print(String(data: data, encoding: .utf8)!)
