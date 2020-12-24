import UIKit

struct AppStoreManager: Codable {
    let categories: [Categories]
}

struct Categories: Codable {
    let name: String?
    let apps: [App]?
}

struct App: Codable {
    
    let Id: Int?
    let Name: String?
    let Category: String?
    let imageName: String?
    let Price: Double?
}


struct CovidManager: Codable {
    let saudi: [Country]
    let amrica: [Country]
    
    private enum CodingKeys : String, CodingKey {
        case saudi = "Saudi Arabia"  // this is to make it more friendly json decoding custom
        case amrica = "US"
    }
}

struct Country: Codable {
    let date: String
    let confirmed, deaths, recovered: Int
}
