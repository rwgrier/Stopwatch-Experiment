import Foundation
import Combine

enum StopwatchState {
    case initial
    case stopped
    case running
}

struct StopwatchButtonState {
    var type: StopwatchButtonType
    var isDisabled: Bool
    
    init(type: StopwatchButtonType, isDisabled: Bool = false) {
        self.type = type
        self.isDisabled = isDisabled
    }
    
    static var initialPrimary = StopwatchButtonState(type: .start)
    static var initialSecondary = StopwatchButtonState(type: .lap, isDisabled: true)
}

final class StopwatchViewModel: ObservableObject {
    var showCurrentLap: Bool { currentLapInterval > 0 }
    
    @Published var state: StopwatchState = .initial
    @Published private(set) var primaryButtonState: StopwatchButtonState = .initialPrimary
    @Published private(set) var secondaryButtonState: StopwatchButtonState = .initialSecondary
    @Published private(set) var overallDisplayString: String = .defaultDisplayString
    @Published private(set) var currentLapDisplayString: String = .defaultDisplayString
    @Published private(set) var laps: [Lap] = []
    
    private var date: Date?
    @Published private var overallInterval: TimeInterval = 0
    @Published private var currentLapInterval: TimeInterval = 0
    private var timerCancellable: AnyCancellable?
    
    private lazy var formatter: StopwatchFormatter = { StopwatchFormatter() }()
    
    init(state: StopwatchState = .initial) {
        setup()
        
        self.state = state
    }
    
    func primaryButtonPressed() {
        switch state {
        case .initial, .stopped:
            start()
        case .running:
            stop()
        }
    }
    
    func secondaryButtonPressed() {
        switch state {
        case .running:
            lap()
        case .stopped:
            reset()
        case .initial:
            break
        }
    }
    
    func start() {
        state = .running
        date = .now
        startTimer()
    }
    
    func stop() {
        state = .stopped
        timerCancellable?.cancel()
        timerCancellable = nil
    }
    
    func lap() {
        let displayString = formatter.string(from: currentLapInterval)
        let lap = Lap(duration: currentLapInterval, displayString: displayString)

        laps.append(lap)
        currentLapInterval = 0
    }
    
    func reset() {
        state = .initial
        laps = []
        overallInterval = 0
        currentLapInterval = 0
    }
    
    private func setup() {
        $state
            .map {
                switch $0 {
                case .initial, .stopped:
                    return .initialPrimary
                case .running:
                    return StopwatchButtonState(type: .stop)
                }
            }
            .assign(to: &$primaryButtonState)
        
        $state
            .map {
                switch $0 {
                case .initial:
                    return .initialSecondary
                case .running:
                    return StopwatchButtonState(type: .lap)
                case .stopped:
                    return StopwatchButtonState(type: .reset)
                }
            }
            .assign(to: &$secondaryButtonState)
        
        $overallInterval
            .map { [self] interval in
                formatter.string(from: interval)
            }
            .assign(to: &$overallDisplayString)
        
        $currentLapInterval
            .map { [self] interval in
                formatter.string(from: interval)
            }
            .assign(to: &$currentLapDisplayString)
    }
    
    private func startTimer() {
        timerCancellable = Timer
            .publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink { [self] newDate in
                let difference = (date ?? .now).distance(to: newDate)
                
                date = newDate
                overallInterval += difference
                currentLapInterval += difference
            }
    }
}

private extension String {
    static var defaultDisplayString = "00:00.00"
}
