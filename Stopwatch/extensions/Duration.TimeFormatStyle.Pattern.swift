import Foundation

extension Duration.TimeFormatStyle.Pattern {
    static var overHourPattern: Duration.TimeFormatStyle.Pattern {
        .hourMinuteSecond(padHourToLength: 1, fractionalSecondsLength: 2)
    }
    
    static var underHourPattern: Duration.TimeFormatStyle.Pattern {
        .minuteSecond(padMinuteToLength: 2, fractionalSecondsLength: 2)
    }
}
