//
//  ContentView.swift
//  PetShelter
//
//  Created by Francisco Javier Alarza Sanchez on 2/2/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
               LottieView(lottieFile: "DogAnimation")
                    .frame(width: 300, height: 200)
                ShelterButton()
                Spacer()
                    .frame(height: 32)
                
                PhysicPersonButton()
                Spacer()
            }
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
