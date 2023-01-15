import SwiftUI

struct StopwatchView: View {
    @EnvironmentObject var viewModel: StopwatchViewModel
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
                VStack {
                    Group {
                        DigitalView()
                            .frame(height: (reader.size.height / 2) + 45)
                        Divider()
                            .overlay(.gray)
                            .padding(.horizontal)
                        LapsView()
                            .background(Color.black)
                            .frame(height: (reader.size.height / 2) - 20)
                    }
                }
            }
            
            StopwatchButtonBar()
            .padding()
        }
        .background(Color.black)
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
            .environmentObject(StopwatchViewModel())
    }
}
