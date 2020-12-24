import UIKit


enum Total: Int {
    case deaths = 0
    case confermed = 1
    case recovered = 2
}
struct CountryViewModel {
    let countrySet: [Country]
    
    var totalDeath: Int? {
        countrySet.max { (c1, c2) -> Bool in
            c2.deaths > c1.deaths
            }?.deaths
    }
    
    var totalRecovered: Int? {
        countrySet.max { (c1, c2) -> Bool in
            c2.recovered > c1.recovered
            }?.recovered
    }
    
    func dataSet(basedOn filterCondition: (Country) -> Bool) -> [Country] {
        countrySet.filter { eachSet -> Bool in
            filterCondition(eachSet)
        }
    }
    
    
    // Excellent
    var last5Days: [Country]? {
        guard let tot = totalRecovered else { return nil }
        let myResult = countrySet.filter { (eac) -> Bool in
            eac.recovered == tot  // use && currentDay - 1 will assure to always get one item
        }
        
        let stringDate = myResult[0].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: stringDate) else { return nil}
        
        let lastStatistics = countrySet.filter { (c) -> Bool in
            guard let fromDate = dateFormatter.date(from: c.date) else { return false }
            guard let differene = Calendar.current.dateComponents([.day], from: fromDate, to: date).day  else { return false }
            
            return differene < 5
        }
        
        return lastStatistics
        
    }
    

    
    
    
    
}
