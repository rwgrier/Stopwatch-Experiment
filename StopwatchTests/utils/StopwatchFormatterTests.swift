import Foundation
import XCTest
@testable import Stopwatch

final class StopwatchFormatterTests: XCTestCase {
    private var subject: StopwatchFormatter!
    
    override func setUp() {
        super.setUp()
        
        subject = StopwatchFormatter()
    }
}

// MARK: Zero Tests

extension StopwatchFormatterTests {
    func testTimeIntervalZero() {
        let expected: String = "00:00.00"
        let test: String = subject.string(from: 0)
        
        XCTAssertEqual(expected, test)
    }
}

// MARK: Whole Second Tests

extension StopwatchFormatterTests {
    func testTimeIntervalWholeSecond() {
        let expected: String = "00:45.00"
        let test: String = subject.string(from: 45)
        
        XCTAssertEqual(expected, test)
    }
}

// MARK: Fractional Second Tests

extension StopwatchFormatterTests {
    func testTimeIntervalFractionalSecond() {
        let expected: String = "00:45.12"
        let test: String = subject.string(from: 45.12)
        
        XCTAssertEqual(expected, test)
    }
    
    func testTimeIntervalLongFractionalSecond() {
        let expected: String = "00:45.12"
        let test: String = subject.string(from: 45.12734)
        
        XCTAssertEqual(expected, test)
    }
}

// MARK: Minute Tests

extension StopwatchFormatterTests {
    func testTimeIntervalWithMinute() {
        let expected: String = "23:45.00"
        let test: String = subject.string(from: 1425)
        
        XCTAssertEqual(expected, test)
    }
}

// MARK: Hour Tests

extension StopwatchFormatterTests {
    func testTimeIntervalWithHour() {
        let expected: String = "04:23:45.00"
        let test: String = subject.string(from: 15825)
        
        XCTAssertEqual(expected, test)
    }
}
