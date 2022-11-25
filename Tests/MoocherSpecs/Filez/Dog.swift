import Foundation

protocol Wolf { }

class WildAnimal { }

enum BarkException: Error {
    case earShrikingBark
    case deafeningBark
}

enum MeowException: Error {
    case purrr
}

final class Dog: WildAnimal, Wolf, Equatable {
    // MARK: - Public properties
    
    var name = "Pancho"
    
    // MARK: - Public methods
    
    func bark(shouldThroughExceptionalBark: Bool) throws -> String {
        if shouldThroughExceptionalBark {            
            throw BarkException.earShrikingBark
        }
        
        return "Arf!"
    }
    
    // MARK: - Equatable
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.name == rhs.name
    }
}
