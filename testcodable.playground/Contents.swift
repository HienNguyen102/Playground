import UIKit
import CryptoKit

/*extension Data {
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
struct Payload: Encodable {
    //let sub = "1234567890"
    let UserName = "huyen101"
    let Spaces = [Space()]
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
print(token)*/

let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//print(formatter.string(from: date))
/*
let JSON = """
{
    "Code": 1,
    "Data": {
        "Parameters": [
            {
                "ID": 1,
                "Type": "WEB_CONFIGURATION",
                "Name": "UF_MGL_Limit",
                "Value": "abcde",
                "Description": "Hạn mức tối đa để gia hạn hợp đồng ký quỹ online",
                "Date": 20220825,
                "IsReadonly": false
            },
            {
                "ID": 2,
                "Type": "WEB_CONFIGURATION",
                "Name": "GroupAcountAdmin",
                "Value": {
                    "Market": "U",
                    "Rule": [
                        {
                            "StockType": "S",
                            "Min": "100.000000",
                            "Max": "0.000000",
                            "PriceStep": "100.000000",
                            "MaxVol": "999900",
                            "AssetCode": "",
                            "AssetType": "",
                            "PriceUnit": "1000.000000",
                            "VolumeUnit": "100",
                            "TradingType": "1",
                            "MinVol": "1",
                            "Multiplier": "0"
                        },
                        {
                            "StockType": "",
                            "Min": "0.000000",
                            "Max": "0.000000",
                            "PriceStep": "1.000000",
                            "MaxVol": "10000000",
                            "AssetCode": "",
                            "AssetType": "",
                            "PriceUnit": "1.000000",
                            "VolumeUnit": "100",
                            "TradingType": "8",
                            "MinVol": "1",
                            "Multiplier": "0"
                        },
                        {
                            "StockType": "E",
                            "Min": "1.000000",
                            "Max": "0.000000",
                            "PriceStep": "1.000000",
                            "MaxVol": "999900",
                            "AssetCode": "",
                            "AssetType": "",
                            "PriceUnit": "1000.000000",
                            "VolumeUnit": "100",
                            "TradingType": "1",
                            "MinVol": "1",
                            "Multiplier": "0"
                        },
                        {
                            "StockType": "U",
                            "Min": "100.000000",
                            "Max": "0.000000",
                            "PriceStep": "100.000000",
                            "MaxVol": "999900",
                            "AssetCode": "",
                            "AssetType": "",
                            "PriceUnit": "1000.000000",
                            "VolumeUnit": "100",
                            "TradingType": "1",
                            "MinVol": "1",
                            "Multiplier": "0"
                        }
                    ]
                },
                "Description": "Đưa config GroupAcountAdmin BO xuống DB",
                "Date": 20220825,
                "IsReadonly": false
            }
        ]
    }
}
"""
 */
let JSON = """
{
    "Code": 1,
    "Data": {
        "AccID": "999C010053",
        "SubAccID": "1",
        "SubAcc": {
            "ID": "1",
            "Status": 1,
            "ControllerID": "Simple",
            "Assets": [
                {
                    "Type": 0,
                    "Side": "1",
                    "Symbol": "VND",
                    "Init": 0,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 0.0
                },
                {
                    "Type": 1,
                    "Side": "1",
                    "Symbol": "VND",
                    "Init": 428843000,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 0.0
                },
                {
                    "Type": 2,
                    "Side": "1",
                    "Symbol": "VND",
                    "Init": 0,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 0.0
                },
                {
                    "Type": 6,
                    "Side": "1",
                    "Symbol": "VND",
                    "Init": 0,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 0.0
                },
                {
                    "Type": 8,
                    "Side": "1",
                    "Symbol": "VND",
                    "Init": 0,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 0.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "ACB",
                    "Init": 1800,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 21900.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "SBT",
                    "Init": 100,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 15450.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "GAS",
                    "Init": 2000,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 94600.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "CFPT2210",
                    "Init": 700100,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 350.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "CEO",
                    "Init": 900,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 24900.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "AAA",
                    "Init": 100,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 10700.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "BVS",
                    "Init": 2500,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 23600.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "SSI",
                    "Init": 500,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 25450.0
                },
                {
                    "Type": 1,
                    "Side": "2",
                    "Symbol": "BID",
                    "Init": 100,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 44500.0
                },
                {
                    "Type": 4,
                    "Side": "2",
                    "Symbol": "BID",
                    "Init": 100,
                    "Added": {
                        "P": 0,
                        "C": 0
                    },
                    "Substracted": {
                        "P": 0,
                        "C": 0
                    },
                    "Shorted": {
                        "P": 0,
                        "C": 0
                    },
                    "MidPx": 0.0
                }
            ]
        },
        "Extension": [
            {
                "Key": "PPBasicTotal",
                "Value": 428843000
            },
            {
                "Key": "PPBasic",
                "Value": 428843000
            }
        ]
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


// MARK: - GetAccountsResponse
class GetAccountsResponse: BaseResponse {
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





// MARK: - GetTradeableQtyResponse
class GetTradeableQtyResponse: BaseResponse {
    
    var tradeableData: GetTradeableQtyData?
    
    override var data: BaseData? {
        get{
            return tradeableData
        }
        set {
            if let newTradeable = newValue as? GetTradeableQtyData {
                tradeableData = newTradeable
            } else {
                print("inncorrect")
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case tradeableData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tradeableData = try? container.decode(GetTradeableQtyData.self, forKey: .tradeableData)
        try super.init(from: decoder)
    }
}

// MARK: - GetTradeableQtyData
class GetTradeableQtyData: BaseData {
    var subAccs: [TradeableQtySubAcc]?

    enum CodingKeys: String, CodingKey {
        case subAccs = "SubAccs"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        subAccs = try? container.decode([TradeableQtySubAcc].self, forKey: .subAccs)
        try super.init(from: decoder)
    }
}

// MARK: - TradeableQtySubAcc
class TradeableQtySubAcc: Codable {
    var accID, subAccID, symbol: String?
    var refPrice: Int?
    var side, price, controllerID: String?
    var tradeableQty: [String: Int]?
    var subAccExtension: [TradeableQtyExtension]?

    enum CodingKeys: String, CodingKey {
        case accID = "AccID"
        case subAccID = "SubAccID"
        case symbol = "Symbol"
        case refPrice = "RefPrice"
        case side = "Side"
        case price = "Price"
        case controllerID = "ControllerID"
        case tradeableQty = "TradeableQty"
        case subAccExtension = "Extension"
    }
}

// MARK: - TradeableQty
class TradeableQtyExtension: Codable {
    var key: String?
    var value: Int?

    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case value = "Value"
    }
}


// MARK: - GetDataChartResponse
class GetDataChartResponse: BaseResponse {
    
    var getDataChartData: GetDataChartData?
    
    override var data: BaseData? {
        get {
            return getDataChartData
        }
        set {
            if let newData = newValue as? GetDataChartData {
                getDataChartData = newData
            } else {
                print("incorrect")
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case getDataChartData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        getDataChartData = try? container.decode(GetDataChartData.self, forKey: .getDataChartData)
        try super.init(from: decoder)
    }
}

// MARK: - GetDataChartData
class GetDataChartData: BaseData {
    var e: [String]?
    var t, v, a, o, c, h, l: [Double]?
    var s: String?
    
    enum CodingKeys : String, CodingKey {
        case e, t, v, a, o, c, h, l, s
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        e = try? container.decode([String].self, forKey: .e)
        s = try? container.decode(String.self, forKey: .s)
        t = try? container.decode([Double].self, forKey: .t)
        v = try? container.decode([Double].self, forKey: .v)
        a = try? container.decode([Double].self, forKey: .a)
        o = try? container.decode([Double].self, forKey: .o)
        c = try? container.decode([Double].self, forKey: .c)
        h = try? container.decode([Double].self, forKey: .h)
        l = try? container.decode([Double].self, forKey: .l)
        try super.init(from: decoder)
    }
}



// MARK: - GetOrderBookResponse
class GetOrderBookResponse: BaseResponse {
    var orderBookData: GetOrderBookData?

    override var data: BaseData? {
        get {
            return orderBookData
        }
        
        set {
            if let newOrderData = newValue as? GetOrderBookData {
                orderBookData = newOrderData
            } else {
                print("incorrect")
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case orderBookData = "Data"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        orderBookData = try? container.decode(GetOrderBookData.self, forKey: .orderBookData)
        try super.init(from: decoder)
    }
}

// MARK: - GetOrderBookData
class GetOrderBookData: BaseData {
    var orders: [OrderBookDTO]?

    enum CodingKeys: String, CodingKey {
        case orders = "Orders"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        orders = try? container.decode([OrderBookDTO].self, forKey: .orders)
        try super.init(from: decoder)
    }
}

// MARK: - OrderBookDTO
class OrderBookDTO: Codable {
    var msgSeqNum, senderSubID, senderLocationID, startDate: String?
    var tradeDate, endDate, orderID, clOrdID: String?
    var refClOrdID, side, symbol, orderQty: String?
    var price, ordType, timeInForce, ordStatus: String?
    var handlInst, solicitedFlag, startTransactTime, lastTransactTime: String?
    var account, allocAccount, exDestination, lastQty: String?
    var lastPx, cumQty, leavesQty, avgPx: String?
    var execID, execType: String?

    enum CodingKeys: String, CodingKey {
        case msgSeqNum = "MsgSeqNum"
        case senderSubID = "SenderSubID"
        case senderLocationID = "SenderLocationID"
        case startDate = "StartDate"
        case tradeDate = "TradeDate"
        case endDate = "EndDate"
        case orderID = "OrderID"
        case clOrdID = "ClOrdID"
        case refClOrdID = "RefClOrdID"
        case side = "Side"
        case symbol = "Symbol"
        case orderQty = "OrderQty"
        case price = "Price"
        case ordType = "OrdType"
        case timeInForce = "TimeInForce"
        case ordStatus = "OrdStatus"
        case handlInst = "HandlInst"
        case solicitedFlag = "SolicitedFlag"
        case startTransactTime = "StartTransactTime"
        case lastTransactTime = "LastTransactTime"
        case account = "Account"
        case allocAccount = "AllocAccount"
        case exDestination = "ExDestination"
        case lastQty = "LastQty"
        case lastPx = "LastPx"
        case cumQty = "CumQty"
        case leavesQty = "LeavesQty"
        case avgPx = "AvgPx"
        case execID = "ExecID"
        case execType = "ExecType"
    }
}


// MARK: - GetGetParametersResponse
class GetParametersResponse: BaseResponse {
    var parametersData: GetParametersData?

    enum CodingKeys: String, CodingKey {
        case parametersData = "Data"
    }
    
    override var data: BaseData? {
        get {
            return parametersData
        }
        
        set {
            if let newPara = newValue as? GetParametersData {
                parametersData = newPara
            } else {
                print("incorrect")
            }
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parametersData = try? container.decode(GetParametersData.self, forKey: .parametersData)
        try super.init(from: decoder)
    }
}

// MARK: - GetParametersData
class GetParametersData: BaseData {
    var parameters: [GetParameterDTO]?

    enum CodingKeys: String, CodingKey {
        case parameters = "Parameters"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            parameters = try container.decode([GetParameterDTO].self, forKey: .parameters)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        try super.init(from: decoder)
    }
}

// MARK: - GetParameterDTO
class GetParameterDTO: Codable {
    var id: Double?
    var type, name: String?
    var value: QuantumValue?
    var description: String?
    var date: Double?
    var isReadonly: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case type = "Type"
        case name = "Name"
        case value = "Value"
        case description = "Description"
        case date = "Date"
        case isReadonly = "IsReadonly"
    }
}

enum QuantumValue: Codable {
    
    case parameterDto(GetParameterDTOValue), string(String)
    
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(GetParameterDTOValue.self) {
            self = .parameterDto(int)
            return
        }
        
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        throw QuantumError.missingValue
    }
    
    enum QuantumError:Error {
        case missingValue
    }
}
extension QuantumValue {
    var stringValue: String? {
        switch self {
        case .parameterDto(_): return nil
        case .string(let value): return value
        }
    }
    
    var parameterValue: GetParameterDTOValue? {
        switch self {
        case .parameterDto(let value): return value
        case .string(_): return nil
        }
    }
}

// MARK: - GetParameterDTOValue
class GetParameterDTOValue: Codable {
    var market: String?
    var rule: [GetParameterDTORule]?

    enum CodingKeys: String, CodingKey {
        case market = "Market"
        case rule = "Rule"
    }

    init(market: String?, rule: [GetParameterDTORule]?) {
        self.market = market
        self.rule = rule
    }
}

// MARK: - GetParameterDTORule
class GetParameterDTORule: Codable {
    var stockType, min, max, priceStep: String?
    var maxVol, assetCode: String?
    var assetType: GetParameterDTOAssetType?
    var priceUnit, volumeUnit, tradingType, minVol: String?
    var multiplier: String?

    enum CodingKeys: String, CodingKey {
        case stockType = "StockType"
        case min = "Min"
        case max = "Max"
        case priceStep = "PriceStep"
        case maxVol = "MaxVol"
        case assetCode = "AssetCode"
        case assetType = "AssetType"
        case priceUnit = "PriceUnit"
        case volumeUnit = "VolumeUnit"
        case tradingType = "TradingType"
        case minVol = "MinVol"
        case multiplier = "Multiplier"
    }
}

enum GetParameterDTOAssetType: String, Codable {
    case b = "B"
    case empty = ""
    case i = "I"
}



// MARK: - GetTransactionsResponse
class GetTransactionsResponse: BaseResponse {
    var getTransactionData: GetTransactionsData?

    override var data: BaseData? {
        get {
            return getTransactionData
        }
        
        set {
            if let newTransData = newValue as? GetTransactionsData {
                getTransactionData = newTransData
            } else {
                print("incorrect")
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case getTransactionData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        getTransactionData = try? container.decode(GetTransactionsData.self, forKey: .getTransactionData)
        try super.init(from: decoder)
    }
}

// MARK: - GetTransactionsData
class GetTransactionsData: BaseData {
    //var marketID, uid, symbol: String?
    var transactions: [TransactionDTO]?

    enum CodingKeys: String, CodingKey {
        /*case marketID = "MarketID"
        case uid = "UID"
        case symbol = "Symbol"*/
        case transactions = "Transactions"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transactions = try? container.decode([TransactionDTO].self, forKey: .transactions)
        try super.init(from: decoder)
    }
}

// MARK: - TransactionDTO
class TransactionDTO: Codable {
    var i: Double?
    var t: String?
    var r, p, q: Double?
    var sb: String?
    var l, nq, nv: Double?

    enum CodingKeys: String, CodingKey {
        case i = "I"
        case t = "T"
        case r = "R"
        case p = "P"
        case q = "Q"
        case sb = "SB"
        case l = "L"
        case nq = "NQ"
        case nv = "NV"
    }
}



// MARK: - GetSnapshotResponse
class GetSnapshotResponse: BaseResponse {
    var snapshotData : GetSnapshotData?
    override var data : BaseData? {
        get{
            return snapshotData
        }
        set {
            if let newRacingChassis = newValue as? GetSnapshotData {
                snapshotData = newRacingChassis
            } else {
                print("incorrect chassis type for racecar")
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case snapshotData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        snapshotData = try? container.decode(GetSnapshotData.self, forKey: .snapshotData)
        try super.init(from: decoder)
    }
}

class GetSnapshotData: BaseData {
    var stocks: [GetSnapshotStocksDTO]?
    var indexes: [GetSnapshotIndexDTO]?
    enum CodingKeys: String, CodingKey {
        case stocks = "Stocks"
        case indexes = "Indexes"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stocks = try? container.decode([GetSnapshotStocksDTO].self, forKey: .stocks)
        indexes = try? container.decode([GetSnapshotIndexDTO].self, forKey: .indexes)
        try super.init(from: decoder)
    }
}


// MARK: - GetSnapshotStocksDTO
class GetSnapshotStocksDTO: Codable {
    var the0: String?
    var the1, the2: Double?
    var the8: String?
    var the9: Double?
    var st, rt: String?
    var m, i: Double?
    var s, tt: String?
    var c, f, r, sh: Double?
    var o: Double?
    var t: String?
    var p, q, l, e: Double?
    var u, uv, nq, nv: Double?
    var pq, pv, oq, ov: Double?
    var v: Double?
    var h, w, g, x: Double?
    var d, k, tp: Double?
    var b, a: [Double]?
    
    //var et: Et?

    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the1 = "1"
        case the2 = "2"
        case the8 = "8"
        case the9 = "9"
        case st = "ST"
        case rt = "RT"
        case m = "M"
        case i = "I"
        case s = "S"
        case tt = "TT"
        case c = "C"
        case f = "F"
        case r = "R"
        case sh = "SH"
        case o = "O"
        case t = "T"
        case p = "P"
        case q = "Q"
        case l = "L"
        case e = "E"
        case u = "U"
        case uv = "UV"
        case nq = "NQ"
        case nv = "NV"
        case pq = "PQ"
        case pv = "PV"
        case oq = "OQ"
        case ov = "OV"
        case v = "V"
        case h = "H"
        case w = "W"
        case g = "G"
        case x = "X"
        case d = "D"
        case k = "K"
        case tp = "TP"
        case b = "B"
        case a = "A"
        //case et = "ET"
    }
}

// MARK: - Et
/*class Et: Codable {
    var st: String?

    enum CodingKeys: String, CodingKey {
        case st = "ST"
    }

    init(st: String?) {
        self.st = st
    }
}*/

class GetSnapshotIndexDTO: Codable {
    var the0: String?
    var the1, the2, the3, the4: Double?
    var the5, the6, the7: Double?
    var the8: String?
    var the9, i: Double?
    var s: String?
    var m: Double?
    var st, z: String?
    var r, o: Double?
    var t: String?
    var p, q, l: Double?
    var e: Double?
    var u, uv, nq, nv: Double?
    var pq, pv, oq, ov: Double?
    var h, w, tt, nc: Double?
    var nf, uq: Double?

    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
        case the6 = "6"
        case the7 = "7"
        case the8 = "8"
        case the9 = "9"
        case i = "I"
        case s = "S"
        case m = "M"
        case st = "ST"
        case z = "Z"
        case r = "R"
        case o = "O"
        case t = "T"
        case p = "P"
        case q = "Q"
        case l = "L"
        case e = "E"
        case u = "U"
        case uv = "UV"
        case nq = "NQ"
        case nv = "NV"
        case pq = "PQ"
        case pv = "PV"
        case oq = "OQ"
        case ov = "OV"
        case h = "H"
        case w = "W"
        case tt = "TT"
        case nc = "NC"
        case nf = "NF"
        case uq = "UQ"
    }
}




// MARK: - GetSubAccInfoResponse
class GetSubAccInfoResponse: BaseResponse {
    var subData: GetSubAccInfoData?
    
    override var data: BaseData? {
        get {
            return subData
        }
        set {
            if let newSubData = newValue as? GetSubAccInfoData{
                subData = newSubData
            } else {
                print("incorrect")
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case subData = "Data"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        subData = try? container.decode(GetSubAccInfoData.self, forKey: .subData)
        try super.init(from: decoder)
    }
}

// MARK: - GetSubAccInfoData
class GetSubAccInfoData: BaseData {
    var accID, subAccID: String?
    var subAcc: SubAccDTO?
    var dataExtension: [SubAccInfoExtension]?

    enum CodingKeys: String, CodingKey {
        case accID = "AccID"
        case subAccID = "SubAccID"
        case subAcc = "SubAcc"
        case dataExtension = "Extension"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accID = try? container.decode(String.self, forKey: .accID)
        subAccID = try? container.decode(String.self, forKey: .subAccID)
        subAcc = try? container.decode(SubAccDTO.self, forKey: .subAcc)
        dataExtension = try? container.decode([SubAccInfoExtension].self, forKey: .subAcc)
        try super.init(from: decoder)
    }
}

// MARK: - SubAccInfoExtension
class SubAccInfoExtension: Codable {
    var key: String?
    var value: Int?

    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case value = "Value"
    }
}

// MARK: - SubAcc
class SubAccDTO: Codable {
    var id: String?
    var status: Int?
    var controllerID: String?
    var assets: [SubAccAssetDTO]?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case status = "Status"
        case controllerID = "ControllerID"
        case assets = "Assets"
    }
}

// MARK: - Asset
class SubAccAssetDTO: Codable {
    var type: Int?
    var side, symbol: String?
    var assetInit: Int?
    var added, substracted, shorted: SubAccAssetAdded?
    var midPx: Int?

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case side = "Side"
        case symbol = "Symbol"
        case assetInit = "Init"
        case added = "Added"
        case substracted = "Substracted"
        case shorted = "Shorted"
        case midPx = "MidPx"
    }
}

// MARK: - Added
class SubAccAssetAdded: Codable {
    var p, c: Int?

    enum CodingKeys: String, CodingKey {
        case p = "P"
        case c = "C"
    }
}




let jsonData = JSON.data(using: .utf8)!

let res = try! JSONDecoder().decode(GetSubAccInfoResponse.self, from: jsonData)
let res1 =  res.subData
let res2 = res1?.subAcc
let res3 = res2?.assets

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
