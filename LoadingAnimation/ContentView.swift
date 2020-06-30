//
//  ContentView.swift
//  LoadingAnimation
//
//  Created by Alessandro dovere on 18/06/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var bigger = false
    @State var timeInterval = 0.005
    var body: some View{
        VStack {
     
                
            Loadingview()
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let screen = UIScreen.main.bounds
