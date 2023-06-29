import Foundation

extension TimeInterval {
    var desiredFormatStylePattern: Duration.TimeFormatStyle.Pattern {
        self >= .secondsInHour ? .overHourPattern : .underHourPattern
    }
    
    var displayString: String {
        Duration.seconds(self)
            .formatted(.time(pattern: desiredFormatStylePattern))
    }
}

private extension Double {
    static var secondsInHour: Double = secondsInMinute * minutesInHour
    static var minutesInHour: Double = 60.0
    static var secondsInMinute: Double = 60.0
}
