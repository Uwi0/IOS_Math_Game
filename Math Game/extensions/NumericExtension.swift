import Foundation

let ordinalFormmater: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter
}()

extension Numeric {
    var ordinal: String {
        return ordinalFormmater.string(for: self) ?? String(describing: self)
    }
}
