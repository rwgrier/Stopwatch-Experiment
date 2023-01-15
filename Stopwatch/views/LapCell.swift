import SwiftUI

struct LapCell: View {
    var number: Int
    var time: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Lap \(number)")
                Spacer()
                Text(time)
            }
            
            Divider()
                .overlay(.gray)
        }
        .foregroundColor(.white)
        .background(Color.black)
        .padding(.horizontal)
    }
}

struct LapCell_Previews: PreviewProvider {
    static var previews: some View {
        LapCell(number: 1, time: "00:00.00")
    }
}
