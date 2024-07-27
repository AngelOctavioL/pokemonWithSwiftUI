//
//  StatesExamples.swift
//  pokedex-swiftuf
//
//  Created by Diplomado on 26/07/24.
//

import SwiftUI

// Primer forma de manejar el estado

//struct StatesExamples: View {
//    @State private var count: Int = 0
//    // las estructuras son inmutables no se pueden cambiar el valor
//    // dentro de una estructura
//
//    //Para poder cambiar un valor tenemos las properties wrappers
//    // y una de ellas es el @State
//    
//    var body: some View {
//        VStack {
//            Button(action: {
//                count += 1
//            }, label: {
//                Text("\(count)")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            })
//            .buttonStyle(BorderedButtonStyle())
//        }
//    }
//}

// segunda forma de manejar el estado
//class MyModel: ObservedObject {
//    @Published var count = 0
//}
//
//struct StatesExamples: View {
//    @StateObject private var model = MyModel()
//    
//    var body: some View {
//        if model.count > 0 {
//            Text("Count: \(model.count)")
//        }
//        
//        Button("tap me") {
//            model.count += 1
//        }
//    }
//}


// Binding es para que la vista no sea responsable del estado si no que lo maneje otra vista
struct Counterview:View {
    @State private var tapCount = 0
    
    var body: some View {
        VStack {
            if tapCount > 0 {
                Text("Tapped: \(tapCount) times")
            }
            
            TapMeView(tapCount: $tapCount)
        }
    }
}

struct TapMeView: View {
    @Binding var tapCount: Int
    
    var body: some View {
        Button("Tap me") {
            tapCount += 1
        }
    }
}

#Preview {
    Counterview()
}

