import Foundation

enum BJJBelt: Int, Comparable {
    case white
    case blue
    case purple
    case brown
    case black
    case coral
    case red
    
    static func < (lhs: BJJBelt, rhs: BJJBelt) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
