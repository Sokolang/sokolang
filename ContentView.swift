//
//  ContentView.swift
//  Moonshot2
//
//  Created by Anzhellika Sokolova on 28.01.2021.
//

import SwiftUI

struct ContentView: View {

    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State var keyPath = \Mission.formattedLaunchDate


    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission[keyPath: keyPath])

                       // Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarItems(
                trailing: Button(
                    keyPath == \.astronautNames ? "Show launch date" : "Show crew names"
                ) {
                    switch keyPath {
                        case \.formattedLaunchDate: keyPath = \.astronautNames
                        case \.astronautNames: keyPath = \.formattedLaunchDate
                        default: break
                    }
                }
            )
            .navigationTitle(Text("Moonshot"))
        } 
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
