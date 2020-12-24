import UIKit

struct CourseViewModel {
     let model: Model
    
    var getLabelColor: UIColor {
        
        switch model.courseRatingLabel {
        case .bestSeller:
            return .systemGreen
        case .highestRated:
            return .systemOrange
        case .hotNew:
            return #colorLiteral(red: 1, green: 0.2098137842, blue: 0.3239779538, alpha: 1)
        }
    }
    
    var getLabelString: String {
        switch model.courseRatingLabel {
        case .bestSeller:
            return "Bestseller"
        case .highestRated:
            return "Highest rated"
        case .hotNew:
            return "Hot & new"
        }
    }
}
