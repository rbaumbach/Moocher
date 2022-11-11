import Foundation

final class Dog: Equatable {
    var name = "Pancho"
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.name == rhs.name
    }
}
