import Foundation
import XCTest
@testable import Stopwatch

final class TimeIntervalTests: XCTestCase { }

// MARK: Milliseconds Tests

extension TimeIntervalTests {
    func testMillisecondsZero() {
        let expected: Int = 0
        let test: Int = (0 as TimeInterval).milliseconds
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsNonZero() {
        let expected: Int = 128
        let test: Int = (0.128 as TimeInterval).milliseconds
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsNegative() {
        let expected: Int = -128
        let test: Int = (-0.128 as TimeInterval).milliseconds
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsNonZeroTruncating() {
        let expected: Int = 128
        let test: Int = (0.1282354 as TimeInterval).milliseconds
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsAllNonZero() {
        let expected: Int = 128
        let test: Int = (9987656.128 as TimeInterval).milliseconds
        XCTAssertEqual(expected, test)
    }
}

// MARK: Milliseconds String Tests

extension TimeIntervalTests {
    func testMillisecondsStringZero() {
        let expected: String = "00"
        let test: String = (0 as TimeInterval).millisecondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsStringNonZero() {
        let expected: String = "12"
        let test: String = (0.128 as TimeInterval).millisecondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsStringNegative() {
        let expected: String = "12"
        let test: String = (-0.128 as TimeInterval).millisecondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsStringNonZeroTruncating() {
        let expected: String = "12"
        let test: String = (0.1282354 as TimeInterval).millisecondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMillisecondsStringAllNonZero() {
        let expected: String = "12"
        let test: String = (9987656.128 as TimeInterval).millisecondsString
        XCTAssertEqual(expected, test)
    }
}

// MARK: Seconds Tests

extension TimeIntervalTests {
    func testSecondsZero() {
        let expected: Int = 0
        let test: Int = (0 as TimeInterval).seconds
        XCTAssertEqual(expected, test)
    }
    
    func testSecondsNonZero() {
        let expected: Int = 22
        let test: Int = (22 as TimeInterval).seconds
        XCTAssertEqual(expected, test)
    }
    
    func testSecondsNegative() {
        let expected: Int = -22
        let test: Int = (-22 as TimeInterval).seconds
        XCTAssertEqual(expected, test)
    }
    
    func testSecondsNonZeroWithMinutes() {
        let expected: Int = 22
        let test: Int = (82 as TimeInterval).seconds
        XCTAssertEqual(expected, test)
    }
    
    func testFractionalSeconds() {
        let expected: Int = 22
        let test: Int = (82.64 as TimeInterval).seconds
        XCTAssertEqual(expected, test)
    }
}

// MARK: Seconds String Tests

extension TimeIntervalTests {
    func testSecondsStringZero() {
        let expected: String = "00"
        let test: String = (0 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testSecondsStringNonZero() {
        let expected: String = "22"
        let test: String = (22 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testSecondsStringNegative() {
        let expected: String = "22"
        let test: String = (-22 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testSecondsStringNonZeroWithMinutes() {
        let expected: String = "22"
        let test: String = (82 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testFractionalSecondsString() {
        let expected: String = "22"
        let test: String = (82.64 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
}

// MARK: Minutes Tests

extension TimeIntervalTests {
    func testMinutesZero() {
        let expected: Int = 0
        let test: Int = (0 as TimeInterval).minutes
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesNonZero() {
        let expected: Int = 1
        let test: Int = (60 as TimeInterval).minutes
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesNegative() {
        let expected: Int = -1
        let test: Int = (-60 as TimeInterval).minutes
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesWithSeconds() {
        let expected: Int = 1
        let test: Int = (61 as TimeInterval).minutes
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesWithHours() {
        let expected: Int = 1
        let test: Int = (3660 as TimeInterval).minutes
        XCTAssertEqual(expected, test)
    }
}

// MARK: Minutes String Tests

extension TimeIntervalTests {
    func testMinutesStringZero() {
        let expected: String = "00"
        let test: String = (0 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesStringNonZero() {
        let expected: String = "22"
        let test: String = (22 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesStringNegative() {
        let expected: String = "22"
        let test: String = (-22 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesStringNonZeroWithMinutes() {
        let expected: String = "22"
        let test: String = (82 as TimeInterval).secondsString
        XCTAssertEqual(expected, test)
    }
    
    func testMinutesStringWithHours() {
        let expected: String = "01"
        let test: String = (3660 as TimeInterval).minutesString
        XCTAssertEqual(expected, test)
    }
}

// MARK: Hours Tests

extension TimeIntervalTests {
    func testHoursZero() {
        let expected: Int = 0
        let test: Int = (0 as TimeInterval).hours
        XCTAssertEqual(expected, test)
    }
    
    func testHoursNonZero() {
        let expected: Int = 1
        let test: Int = (3600 as TimeInterval).hours
        XCTAssertEqual(expected, test)
    }
    
    func testHoursNegative() {
        let expected: Int = -1
        let test: Int = (-3600 as TimeInterval).hours
        XCTAssertEqual(expected, test)
    }
    
    func testHoursWithSeconds() {
        let expected: Int = 1
        let test: Int = (3601 as TimeInterval).hours
        XCTAssertEqual(expected, test)
    }
    
    func testHoursWithMinutes() {
        let expected: Int = 1
        let test: Int = (3660 as TimeInterval).hours
        XCTAssertEqual(expected, test)
    }
}

// MARK: Hours String Tests

extension TimeIntervalTests {
    func testHoursStringZero() {
        let expected: String = "00"
        let test: String = (0 as TimeInterval).hoursString
        XCTAssertEqual(expected, test)
    }
    
    func testHoursStringNonZero() {
        let expected: String = "02"
        let test: String = (7200 as TimeInterval).hoursString
        XCTAssertEqual(expected, test)
    }
    
    func testHoursStringNegative() {
        let expected: String = "02"
        let test: String = (-7200 as TimeInterval).hoursString
        XCTAssertEqual(expected, test)
    }
    
    func testHoursStringWithSeconds() {
        let expected: String = "02"
        let test: String = (7261 as TimeInterval).hoursString
        XCTAssertEqual(expected, test)
    }
    
    func testHoursStringWithMinutes() {
        let expected: String = "01"
        let test: String = (3660 as TimeInterval).hoursString
        XCTAssertEqual(expected, test)
    }
}
