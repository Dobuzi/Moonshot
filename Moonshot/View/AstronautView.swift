//
//  AstronautView.swift
//  Moonshot
//
//  Created by 김종원 on 2020/10/25.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
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
                    HStack {
                        Text("Missions : ")
                            .font(.headline)
                        Spacer()
                        ForEach(self.missions) { mission in
                            Text("Apollo \(mission.id)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(10)
                                .overlay(Capsule().stroke(Color.blue, lineWidth: 1.0))
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            for crew in mission.crew {
                if astronaut.id == crew.name {
                    matches.append(mission)
                }
            }
        }
        
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
