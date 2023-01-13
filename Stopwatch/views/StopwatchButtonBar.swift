import SwiftUI

struct StopwatchButtonBar: View {
    @EnvironmentObject var viewModel: StopwatchViewModel
    
    init() { }
    
    var body: some View {
        HStack {
            secondaryButton
            Spacer()
            primaryButton
        }
    }
    
    var secondaryButton: some View {
        StopwatchButton(type: viewModel.secondaryButtonState.type,
                        action: viewModel.secondaryButtonPressed)
        .disabled(viewModel.secondaryButtonState.isDisabled)
    }
    
    var primaryButton: some View {
        StopwatchButton(type: viewModel.primaryButtonState.type,
                        action: viewModel.primaryButtonPressed)
        .disabled(viewModel.primaryButtonState.isDisabled)
    }
}

struct StopwatchButtonBar_Previews: PreviewProvider {
    static var initial = StopwatchViewModel()
    static var running = StopwatchViewModel(state: .running)
    static var stopped = StopwatchViewModel(state: .stopped)
    
    static var previews: some View {
        VStack {
            StopwatchButtonBar()
                .environmentObject(initial)
            StopwatchButtonBar()
                .environmentObject(running)
            StopwatchButtonBar()
                .environmentObject(stopped)
        }
        .background(Color.black)
        .previewLayout(.sizeThatFits)
    }
}
