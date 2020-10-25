//
//  ContentView.swift
//  Moonshot
//
//  Created by 김종원 on 2020/10/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowCrews = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, missions: self.missions)) {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                            Text(makeSubtitle(mission))
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Toggle(isOn: $isShowCrews, label: {
                Text("Crews")
            }))
        }
    }
    
    func makeSubtitle(_ mission: Mission) -> String {
        if isShowCrews {
            var crews = ""
            for crew in mission.crew {
                crews += crew.name + " "
            }
            return crews
        } else {
            return mission.formattedLaunchDate
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
