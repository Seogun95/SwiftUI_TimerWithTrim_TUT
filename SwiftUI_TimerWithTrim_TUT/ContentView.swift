//
//  ContentView.swift
//  SwiftUI_TimerWithTrim_TUT
//
//  Created by 김선중 on 2021/03/13.
//

import SwiftUI

struct ContentView: View {
    @State private var completionAmount: CGFloat = 0.0
    
    //타이머 설정
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Circle()
            .trim(from: 0, to: completionAmount)
            .stroke(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center),lineWidth: 20)
            
            .frame(width: 200, height: 200)
            
            //시계방향으로 돌아갈수 있도록
            .rotationEffect(.degrees(-90))
            
            //타이머를 표현할때 onReceive는 필수이다.
            .onReceive(timer) { _ in
                withAnimation {
                    if completionAmount == 1 {
                        completionAmount = 0
                    } else {
                        completionAmount += 0.2
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
