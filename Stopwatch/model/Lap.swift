import Foundation

struct Lap {
    let id: UUID = UUID()
    let duration: TimeInterval
    let displayString: String
}

extension Lap: Identifiable { }
extension Lap: Hashable { }
