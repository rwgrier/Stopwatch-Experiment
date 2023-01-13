import SwiftUI

struct DigitalView: View {
    @EnvironmentObject var viewModel: StopwatchViewModel
    
    var body: some View {
        Text(viewModel.overallDisplayString)
            .font(.system(size: 60, weight: .regular))
            .foregroundColor(.white)
    }
}

struct DigitalView_Previews: PreviewProvider {
    static var previews: some View {
        DigitalView()
            .background(Color.black)
            .environmentObject(StopwatchViewModel())
    }
}
