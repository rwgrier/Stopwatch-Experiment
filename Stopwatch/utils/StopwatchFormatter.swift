import Foundation

class StopwatchFormatter: Formatter {
    func string(from timeInterval: TimeInterval) -> String {
        var components: [String] = []
        
        if timeInterval.hours > 0 {
            components.append(timeInterval.hoursString)
        }
        
        components.append(timeInterval.minutesString)
        components.append(timeInterval.secondsString)
        
        return components.joined(separator: ":") + "." + timeInterval.millisecondsString
    }
}
