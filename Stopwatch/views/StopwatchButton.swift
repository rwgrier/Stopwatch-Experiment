import SwiftUI

enum ButtonState {
    case `default`
    case disabled
}

enum StopwatchButtonType: String {
    case lap, reset, start, stop
    
    var title: String { rawValue.capitalized }
    var color: Color {
        switch self {
            
        case .lap, .reset:
            return Color.gray
        case .start:
            return Color.green
        case .stop:
            return Color.red
        }
    }
    
    var foregroundColor: Color {
        color
    }
    
    var backgroundColor: Color {
        color.opacity(0.5)
    }
}

struct StopwatchButton: View {
    typealias StopwatchButtonAction = () -> Void
    
    private let type: StopwatchButtonType
    private let action: StopwatchButtonAction
    
    @State private var state: ButtonState = .default
    init(type: StopwatchButtonType, action: @escaping StopwatchButtonAction) {
        self.type = type
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            Text(type.title)
                .frame(width: 65, height: 65)
                .foregroundColor(type.foregroundColor.opacity(colorOpacity))
                .background(type.backgroundColor.opacity(colorOpacity))
                .clipShape(Circle())
                .padding(2)
                .overlay(Circle()
                    .stroke(type.backgroundColor.opacity(colorOpacity),
                            lineWidth: 1))
        })
        .disabled(state == .disabled)
    }
    
    var colorOpacity: CGFloat {
        (state == .disabled) ? 0.60 : 1.0
    }
    
    func state(_ state: ButtonState) -> StopwatchButton {
        var view = self
        view._state = State(initialValue: state)
        return view
    }
}

struct StopwatchButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StopwatchButton(type: .lap, action: { })
            StopwatchButton(type: .reset, action: { })
            StopwatchButton(type: .start, action: { })
            StopwatchButton(type: .stop, action: { })
        }
        .background(Color.black)
        .previewLayout(.sizeThatFits)
    }
}
