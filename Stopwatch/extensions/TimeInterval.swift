import Foundation

extension TimeInterval {
    var hours: Int {
        Int((self / .secondsInHour)
            .rounded(.towardZero))
    }
    
    var minutes: Int {
        Int((self / .minutesInHour)
            .truncatingRemainder(dividingBy: .minutesInHour))
    }
    
    var seconds: Int {
        Int(truncatingRemainder(dividingBy: .secondsInMinute))
    }
    
    var milliseconds: Int {
        Int((self * .millisecondsInSecond)
            .truncatingRemainder(dividingBy: .millisecondsInSecond))
    }
    
    var hoursString: String {
        String(format: "%02d", abs(hours))
    }
    
    var minutesString: String {
        String(format: "%02d", abs(minutes))
    }
    
    var secondsString: String {
        String(format: "%02d", abs(seconds))
    }
    
    var millisecondsString: String {
        String(String(format: "%02d", abs(milliseconds))
            .prefix(2))
    }
}

private extension Double {
    static var secondsInHour: Double = secondsInMinute * minutesInHour
    static var minutesInHour: Double = 60.0
    static var secondsInMinute: Double = 60.0
    static var millisecondsInSecond: Double = 1000.0
}
