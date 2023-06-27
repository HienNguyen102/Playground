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
    "Data": {
        "Accounts": [
            {
                "UserID": "9001005",
                "DisplayName": "999C001005",
                "Name": "account%20name%209001005",
                "AccountID": "999C001005",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001007",
                "DisplayName": "999C001007",
                "Name": "account name 9001007",
                "AccountID": "999C001007",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001009",
                "DisplayName": "999C001009",
                "Name": "account name 9001009",
                "AccountID": "999C001009",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001008",
                "DisplayName": "999C001008",
                "Name": "account name 9001008",
                "AccountID": "999C001008",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001002",
                "DisplayName": "999C001002",
                "Name": "account name 9001002",
                "AccountID": "999C001002",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001001",
                "DisplayName": "999C001001",
                "Name": "account name 9001001",
                "AccountID": "999C001001",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001010",
                "DisplayName": "999C001010",
                "Name": "account name 9001010",
                "AccountID": "999C001010",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001012",
                "DisplayName": "999C001012",
                "Name": "account name 9001012",
                "AccountID": "999C001012",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001013",
                "DisplayName": "999C001013",
                "Name": "account name 9001013",
                "AccountID": "999C001013",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001014",
                "DisplayName": "999C001014",
                "Name": "account name 9001014",
                "AccountID": "999C001014",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001015",
                "DisplayName": "999C001015",
                "Name": "account name 9001015",
                "AccountID": "999C001015",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001016",
                "DisplayName": "999C001016",
                "Name": "account name 9001016",
                "AccountID": "999C001016",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001017",
                "DisplayName": "999C001017",
                "Name": "account name 9001017",
                "AccountID": "999C001017",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9000003",
                "DisplayName": "999C000003",
                "Name": "account name 9000003",
                "AccountID": "999C000003",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001018",
                "DisplayName": "999C001018",
                "Name": "account name 9001018",
                "AccountID": "999C001018",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9000054",
                "DisplayName": "999C000054",
                "Name": "account name 9000054",
                "AccountID": "999C000054",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001030",
                "DisplayName": "999C001030",
                "Name": "account name 9001030",
                "AccountID": "999C001030",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001031",
                "DisplayName": "999C001031",
                "Name": "account name 9001031",
                "AccountID": "999C001031",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001032",
                "DisplayName": "999C001032",
                "Name": "account name 9001032",
                "AccountID": "999C001032",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001033",
                "DisplayName": "999C001033",
                "Name": "account name 9001033",
                "AccountID": "999C001033",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001034",
                "DisplayName": "999C001034",
                "Name": "account name 9001034",
                "AccountID": "999C001034",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001035",
                "DisplayName": "999C001035",
                "Name": "account name 9001035",
                "AccountID": "999C001035",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001036",
                "DisplayName": "999C001036",
                "Name": "account name 9001036",
                "AccountID": "999C001036",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001037",
                "DisplayName": "999C001037",
                "Name": "account name 9001037",
                "AccountID": "999C001037",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001019",
                "DisplayName": "999C001019",
                "Name": "account name 9001019",
                "AccountID": "999C001019",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9001039",
                "DisplayName": "999C001039",
                "Name": "account name 9001039",
                "AccountID": "999C001039",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "9000051",
                "DisplayName": "999C000051",
                "Name": "account name 9000051",
                "AccountID": "999C000051",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "0990915100",
                "DisplayName": "915100",
                "Name": "Mr. Inno Test 100 Inno Test",
                "AccountID": "915100",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            },
            {
                "UserID": "0990915101",
                "DisplayName": "915101",
                "Name": "Mr. Inno Test 101 Inno Test",
                "AccountID": "915101",
                "SubAccounts": [
                    "1",
                    "6"
                ]
            },
            {
                "UserID": "0990910001",
                "DisplayName": "910001",
                "Name": "Ms. Test",
                "AccountID": "910001",
                "SubAccounts": [
                    "1"
                ]
            },
            {
                "UserID": "0990910002",
                "DisplayName": "910002",
                "Name": "Ms. Test",
                "AccountID": "910002",
                "SubAccounts": [
                    "1"
                ]
            },
            {
                "UserID": "0990910003",
                "DisplayName": "910003",
                "Name": "Mr. Test",
                "AccountID": "910003",
                "SubAccounts": [
                    "1"
                ]
            },
            {
                "UserID": "0990910004",
                "DisplayName": "910004",
                "Name": "Ms. Test",
                "AccountID": "910004",
                "SubAccounts": [
                    "1"
                ]
            },
            {
                "UserID": "0990910006",
                "DisplayName": "910006",
                "Name": "Mr. Test",
                "AccountID": "910006",
                "SubAccounts": [
                    "1"
                ]
            },
            {
                "UserID": "0990910007",
                "DisplayName": "910007",
                "Name": "Ms. Test",
                "AccountID": "910007",
                "SubAccounts": [
                    "1"
                ]
            },
            {
                "UserID": "0990910008",
                "DisplayName": "910008",
                "Name": "Mr Test",
                "AccountID": "910008",
                "SubAccounts": [
                    "1"
                ]
            },
            {
                "UserID": "9001038",
                "DisplayName": "999C001038",
                "Name": "account name 9001038",
                "AccountID": "999C001038",
                "SubAccounts": [
                    "1",
                    "6",
                    "8"
                ]
            }
        ]
    },
    "Code": 1
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


// MARK: - GetAccountsResponse
class GetAccountsResponse: BaseResponse {
    /*var data: GetAccountsData?

    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }*/
    var getAccountsData : GetAccountsData?
    override var data : BaseData? {
        get{
            return getAccountsData
        }
        set {
            if let newAccData = newValue as? GetAccountsData {
                getAccountsData = newAccData
            } else {
                print("incorrect")
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case getAccountsData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        getAccountsData = try? container.decode(GetAccountsData.self, forKey: .getAccountsData)
        try super.init(from: decoder)
    }
    
}

// MARK: - DataClass
class GetAccountsData: BaseData {
    var accounts: [AccountDTO]?

    enum CodingKeys: String, CodingKey {
        case accounts = "Accounts"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accounts = try? container.decode([AccountDTO].self, forKey: .accounts)
        try super.init(from: decoder)
    }
}

// MARK: - AccountDTO
class AccountDTO: Codable {
    var userID, displayName, name, accountID: String?
    var subAccounts: [String]?

    enum CodingKeys: String, CodingKey {
        case userID = "UserID"
        case displayName = "DisplayName"
        case name = "Name"
        case accountID = "AccountID"
        case subAccounts = "SubAccounts"
    }
}




let jsonData = JSON.data(using: .utf8)!

let userRes = try! JSONDecoder().decode(GetAccountsResponse.self, from: jsonData)
let userData =  userRes.getAccountsData
let user = userData?.accounts

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
//Test comment
