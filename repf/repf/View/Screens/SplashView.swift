import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.appBlack
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Image("TailTop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 252.29, height: 136.96)
                        .offset(x: 45, y: 95)
                }
                .padding(.trailing, 10)
                .padding(.top, 10)

                Spacer()

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 193, height: 115)
                
                Spacer()

                HStack {
                    Image("TailBottom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 197, height: 158)
                        .offset(x: -20, y: -100)
                    Spacer()
                }
                .padding(.leading, 10)
                .padding(.bottom, 10)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
