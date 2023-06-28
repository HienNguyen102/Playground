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

// MARK: - DataClass
class GetParametersData: BaseData {
    var parameters: [GetParameterDTO]?

    enum CodingKeys: String, CodingKey {
        case parameters = "Parameters"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parameters = try? container.decode([GetParameterDTO].self, forKey: .parameters)
        try super.init(from: decoder)
    }
}

// MARK: - Parameter
class GetParameterDTO: Codable {
    var id: Int?
    var type, name: String?
    var value: QuantumValue?
    var description: String?
    var date: Int?
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

// MARK: - Rule
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




let jsonData = JSON.data(using: .utf8)!

let res = try! JSONDecoder().decode(GetParametersResponse.self, from: jsonData)
let res1 =  res.parametersData
let res2 = res1?.parameters![0]
let res22 = res2?.value?.stringValue
let res3 = res1?.parameters![1]
let res4 = res3?.value?.parameterValue
//let res4 = res3?.rule

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
