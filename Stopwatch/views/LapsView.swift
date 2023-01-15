import SwiftUI

struct LapsView: View {
    @EnvironmentObject var viewModel: StopwatchViewModel

    var body: some View {
        ScrollView {
            LazyVStack {
                if viewModel.showCurrentLap {
                    LapCell(number: viewModel.laps.count + 1,
                            time: viewModel.currentLapDisplayString)
                }
                
                ForEach(Array(zip(viewModel.laps.indices.reversed(), viewModel.laps.reversed())),
                        id: \.1) { index, lap in
                    LapCell(number: index + 1,
                            time: lap.displayString)
                }
            }
        }
        .background(Color.black)
        .listStyle(.plain) 
    }
}

struct LapView_Previews: PreviewProvider {
    static var previews: some View {
        LapsView()
            .environmentObject(StopwatchViewModel())
    }
}
