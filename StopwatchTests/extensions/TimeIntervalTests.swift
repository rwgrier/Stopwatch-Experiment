import Foundation
import XCTest
@testable import Stopwatch

final class TimeIntervalTests: XCTestCase { }

// MARK: Pattern Tests

extension TimeIntervalTests {
    func test_desiredFormatStylePattern_zero() {
        let expected: Duration.TimeFormatStyle.Pattern = .underHourPattern
        let test: Duration.TimeFormatStyle.Pattern = (0 as TimeInterval).desiredFormatStylePattern
        XCTAssertEqual(expected, test)
    }
    
    func test_desiredFormatStylePattern_nonZero() {
        let expected: Duration.TimeFormatStyle.Pattern = .underHourPattern
        let test: Duration.TimeFormatStyle.Pattern = (128 as TimeInterval).desiredFormatStylePattern
        XCTAssertEqual(expected, test)
    }
    
    func test_desiredFormatStylePattern_oneHour() {
        let expected: Duration.TimeFormatStyle.Pattern = .overHourPattern
        let test: Duration.TimeFormatStyle.Pattern = (3_600 as TimeInterval).desiredFormatStylePattern
        XCTAssertEqual(expected, test)
    }
    
    func test_desiredFormatStylePattern_overOneHour() {
        let expected: Duration.TimeFormatStyle.Pattern = .overHourPattern
        let test: Duration.TimeFormatStyle.Pattern = (86_401 as TimeInterval).desiredFormatStylePattern
        XCTAssertEqual(expected, test)
    }
}

// MARK: Display String Tests

extension TimeIntervalTests {
    func test_displayString_zero() {
        let expected: String = "00:00.00"
        let test: String = (0 as TimeInterval).displayString
        XCTAssertEqual(expected, test)
    }
    
    func test_displayString_nonZero() {
        let expected: String = "00:00.22"
        let test: String = (0.222 as TimeInterval).displayString
        XCTAssertEqual(expected, test)
    }
    
    func test_displayString_secondsNonZero() {
        let expected: String = "00:45.23"
        let test: String = (45.226 as TimeInterval).displayString
        XCTAssertEqual(expected, test)
    }
    
    func test_displayString_minutesNonZero() {
        let expected: String = "04:05.23"
        let test: String = (245.226 as TimeInterval).displayString
        XCTAssertEqual(expected, test)
    }
    
    func test_displayString_oneHour() {
        let expected: String = "1:00:00.00"
        let test: String = (3_600 as TimeInterval).displayString
        XCTAssertEqual(expected, test)
    }
    
    func test_displayString_overOneHour() {
        let expected: String = "1:00:01.34"
        let test: String = (3_601.34 as TimeInterval).displayString
        XCTAssertEqual(expected, test)
    }
}
