//
//  Loadingview.swift
//  LoadingAnimation
//
//  Created by Alessandro dovere on 18/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct Loadingview: View {
    @State var timeInterval1 = 0.0018
    @State var timeInterval2 = 0.0020
    @State var timeInterval3 = 0.0022
    @State var bigger1 = false
    @State var bigger2 = false
    @State var bigger3 = false
    @State var scale : CGFloat = 300.0
     @State var timer = Timer.publish(every: 0.005, on: .main, in: .common).autoconnect()
    @State var biggerEllipse = false
    @State var smallerEllipse = false
    var body: some View {
        ZStack {
            VStack {
                
                CircleView(bigger: self.$bigger1, timeInterval: self.$timeInterval1)
                CircleView(bigger: self.$bigger2, timeInterval: self.$timeInterval2)
                CircleView(bigger: self.$bigger3, timeInterval: self.$timeInterval3)
                
            }
            .frame(width: 200, height: 200)
            .onAppear{
                self.biggerEllipse = true
                self.bigger1 = true
                self.bigger2 = true
                self.bigger3 = true
            }
            Circle().stroke(lineWidth: 1.5).fill(Color.red)
                .scaleEffect(self.scale/500)
            Ellipse().stroke().fill(Color.red)
                .frame(maxHeight: self.scale)
        }
        .onReceive(self.timer){ time in
            if self.biggerEllipse{
                self.smallerEllipse = false
               self.scale += 1
            }
            if self.scale>screen.height/1.1{
                self.biggerEllipse = false
                self.smallerEllipse = true
            }
            if self.scale<screen.height/2.2{
                self.biggerEllipse = true
                self.smallerEllipse = false
            }
            if self.smallerEllipse{
                self.scale -= 1
            }
            
        }
    }
}

struct Loadingview_Previews: PreviewProvider {
    static var previews: some View {
        Loadingview()
    }
}

struct CircleView: View {
    @State var scale : CGFloat = 1
    @State var smaller = false
    @Binding var bigger : Bool
    @Binding var timeInterval : Double
    @State var timer = Timer.publish(every: 0.005, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
//            Ellipse().stroke().scaleEffect(self.scale).rotationEffect(.degrees(90))
//            Ellipse().stroke().scaleEffect(self.scale)
            Circle().stroke().scaleEffect(self.scale)
            Circle().scaleEffect(self.scale)
                .animation(.spring())
                .frame(width: screen.width/11, height: screen.height/11)
      
        }
        .onAppear{
            self.timer = Timer.publish(every: self.timeInterval, on: .main, in: .common).autoconnect()
        }
        .onReceive(self.timer){ time in
            if (self.bigger){
                self.smaller = false
                self.scale += 0.005
                
            }
            if(self.scale>2.5){
                self.bigger = false
                self.smaller = true
            }
            if self.smaller{
                self.scale -= 0.005
            }
            if (self.scale<1){
                self.bigger = true
            }
            
        }
    }
}
