import Foundation

protocol Wolf { }

final class Dog: Wolf, Equatable {
    var name = "Pancho"
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.name == rhs.name
    }
}
