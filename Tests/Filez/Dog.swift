import Foundation

protocol Wolf { }

class WildAnimal { }

final class Dog: WildAnimal, Wolf, Equatable {
    var name = "Pancho"
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.name == rhs.name
    }
}
