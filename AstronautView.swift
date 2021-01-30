//
//  AstronautView.swift
//  Moonshot2
//
//  Created by Anzhellika Sokolova on 28.01.2021.
//

import SwiftUI

struct AstronautView: View {

  //  struct NewMatchMissionsStruct {
 //       let matchMission: Mission
 //   }
    
    let astronaut: Astronaut
   // let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission]

    private static let allMissions: [Mission] = Bundle.main
        .decode("missions.json")

    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
        self.missions = Self.allMissions.filter { mission in
            mission.crew.map(\.name).contains(astronaut.id)
        }
    }
   // let missions: [Mission]
  //  let arrayOfMatchMissions: [NewMatchMissionsStruct]
    
  //  init (innerAstronaut: Astronaut, innerMissions: [Mission]) {
    //    self.astronaut = innerAstronaut
  //      var matchesMissions = [arrayOfMatchMissions]
        //ForEach(missionsAll, id: \.id) {mission in
      //      for i in 0...4 {
      //          matchesMissions.append(NewMatchMissionsStruct()
      //      }
            // for member in missionsAll.crew {
                
             //   if let matchNameMis = //innerMissions.first(where: {$0.id == //member.name}) {
             //       matchesMissions//.append(NewMatchMissionsStruct//(matchMission: matchNameMis))
              //  } else {
               //     fatalError("Missing mission")
                    
               // }
         //   }
        //}
        
      //  self.arrayOfMatchMissions = matchesMissions
   // }
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(missions) { mission in
                     //   NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                            HStack {
                                
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 44)

                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                       // }
                    }
                    Spacer(minLength: 25)
                    }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
  //  static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronauts[0])
    }
}
