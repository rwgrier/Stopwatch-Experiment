import Foundation
import XCTest
@testable import Stopwatch

final class StopwatchViewModelTests: XCTestCase {
    var initialSubject: StopwatchViewModel!
    var runningSubject: StopwatchViewModel!
    var stoppedSubject: StopwatchViewModel!
    
    override func setUp() {
        super.setUp()
        
        initialSubject = StopwatchViewModel()
        runningSubject = StopwatchViewModel(state: .running)
        stoppedSubject = StopwatchViewModel(state: .stopped)
    }
    
    override func tearDown() {
        super.tearDown()
        
        initialSubject = nil
        runningSubject = nil
        stoppedSubject = nil
    }
}

// MARK: - Initializer State Tests

extension StopwatchViewModelTests {
    func testInitState() {
        let expected: StopwatchState = .initial
        let test: StopwatchState = initialSubject.state
        XCTAssertEqual(expected, test)
    }
    
    func testInitStateWithRunning() {
        let expected: StopwatchState = .running
        let test: StopwatchState = runningSubject.state
        XCTAssertEqual(expected, test)
    }
    
    func testInitStateWithStopped() {
        let expected: StopwatchState = .stopped
        let test: StopwatchState = stoppedSubject.state
        XCTAssertEqual(expected, test)
    }
}

// MARK: - Initializer Primary Button State Tests

extension StopwatchViewModelTests {
    func testInitPrimaryButtonState() {
        let expected: StopwatchButtonState = .initialPrimary
        let test: StopwatchButtonState = initialSubject.primaryButtonState
        XCTAssertEqual(expected, test)
    }
    
    func testInitPrimaryButtonStateWithRunning() {
        let expected: StopwatchButtonState = StopwatchButtonState(type: .stop)
        let test: StopwatchButtonState = runningSubject.primaryButtonState
        XCTAssertEqual(expected, test)
    }
    
    func testInitPrimaryButtonStateWithStopped() {
        let expected: StopwatchButtonState = StopwatchButtonState(type: .start)
        let test: StopwatchButtonState = stoppedSubject.primaryButtonState
        XCTAssertEqual(expected, test)
    }
}

// MARK: - Start Action State Tests

extension StopwatchViewModelTests {
    func testStateFromStart() {
        let expected: StopwatchState = .running
        initialSubject.start()
        XCTAssertEqual(expected, initialSubject.state)
    }
    
    func testStartWithRunning() {
        let expected: StopwatchState = .running
        runningSubject.start()
        XCTAssertEqual(expected, runningSubject.state)
    }
    
    func testStartWithStopped() {
        let expected: StopwatchState = .running
        stoppedSubject.start()
        XCTAssertEqual(expected, stoppedSubject.state)
    }
}

// MARK: - Stop Action State Tests

extension StopwatchViewModelTests {
    func testStateFromStop() {
        let expected: StopwatchState = .stopped
        initialSubject.stop()
        XCTAssertEqual(expected, initialSubject.state)
    }
    
    func testStopWithRunning() {
        let expected: StopwatchState = .stopped
        runningSubject.stop()
        XCTAssertEqual(expected, runningSubject.state)
    }
    
    func testStopWithStopped() {
        let expected: StopwatchState = .stopped
        stoppedSubject.stop()
        XCTAssertEqual(expected, stoppedSubject.state)
    }
}

// MARK: - Lap Action State Tests

extension StopwatchViewModelTests {
    func testStateFromLap() {
        let expected: StopwatchState = .initial
        initialSubject.lap()
        XCTAssertEqual(expected, initialSubject.state)
    }
    
    func testLapWithRunning() {
        let expected: StopwatchState = .running
        runningSubject.lap()
        XCTAssertEqual(expected, runningSubject.state)
    }
    
    func testLapWithStopped() {
        let expected: StopwatchState = .stopped
        stoppedSubject.lap()
        XCTAssertEqual(expected, stoppedSubject.state)
    }
}

// MARK: - Reset Action State Tests

extension StopwatchViewModelTests {
    func testStateFromReset() {
        let expected: StopwatchState = .initial
        initialSubject.reset()
        XCTAssertEqual(expected, initialSubject.state)
    }
    
    func testResetWithRunning() {
        let expected: StopwatchState = .initial
        runningSubject.reset()
        XCTAssertEqual(expected, runningSubject.state)
    }
    
    func testResetWithStopped() {
        let expected: StopwatchState = .initial
        stoppedSubject.reset()
        XCTAssertEqual(expected, stoppedSubject.state)
    }
}

// MARK: - Primary Button Action Tests

extension StopwatchViewModelTests {
    func testStateFromPrimaryAction() {
        let expected: StopwatchState = .running
        initialSubject.primaryButtonPressed()
        XCTAssertEqual(expected, initialSubject.state)
    }
    
    func testPrimaryActionWithRunning() {
        let expected: StopwatchState = .stopped
        runningSubject.primaryButtonPressed()
        XCTAssertEqual(expected, runningSubject.state)
    }
    
    func testPrimaryActionWithStopped() {
        let expected: StopwatchState = .running
        stoppedSubject.primaryButtonPressed()
        XCTAssertEqual(expected, stoppedSubject.state)
    }
}

// MARK: - Secondary Button Action Tests

extension StopwatchViewModelTests {
    func testStateFromSecondaryAction() {
        let expected: StopwatchState = .initial
        initialSubject.secondaryButtonPressed()
        XCTAssertEqual(expected, initialSubject.state)
    }
    
    func testSecondaryActionWithRunning() {
        let expected: StopwatchState = .running
        runningSubject.secondaryButtonPressed()
        XCTAssertEqual(expected, runningSubject.state)
    }
    
    func testSecondaryActionWithStopped() {
        let expected: StopwatchState = .initial
        stoppedSubject.secondaryButtonPressed()
        XCTAssertEqual(expected, stoppedSubject.state)
    }
}

// MARK: - Laps

extension StopwatchViewModelTests {
    func testLaps() {
        initialSubject.start()
        XCTAssertEqual(0, initialSubject.laps.count)
        
        initialSubject.lap()
        XCTAssertEqual(1, initialSubject.laps.count)
        
        initialSubject.lap()
        XCTAssertEqual(2, initialSubject.laps.count)
    }
    
    func testLapsReset() {
        initialSubject.start()
        XCTAssertEqual(0, initialSubject.laps.count)
        
        initialSubject.lap()
        XCTAssertEqual(1, initialSubject.laps.count)
        
        initialSubject.reset()
        XCTAssertEqual(0, initialSubject.laps.count)
    }
}

// MARK: - Initializer Secondary Button State Tests

extension StopwatchButtonState: Equatable {
    public static func == (lhs: StopwatchButtonState, rhs: StopwatchButtonState) -> Bool {
        lhs.isDisabled == rhs.isDisabled && lhs.type == rhs.type
    }
}
