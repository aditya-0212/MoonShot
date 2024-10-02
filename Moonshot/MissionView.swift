//
//  MissionView.swift
//  Moonshot
//
//  Created by APPLE on 19/05/24.
//

import SwiftUI

struct MissionView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
   
    let mission: Mission
  
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white)
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                VStack(alignment: .leading){
                    Text("Mission highlits")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                
            }
            .padding(.bottom)
          
          HorizontalScrollView(mission: mission, astronauts: astronauts)
//            ScrollVie(.horizontal,showsIndicators: false){
//                HStack{
//                    ForEach(crew,id:\.role){ crewMember in
//                        NavigationLink{
//                            AstronautView(astronaut: crewMember.astronaut)
//                        }label:{
//                            HStack{
//                                Image(crewMember.astronaut.id)
//                                    .resizable()
//                                    .frame(width:104,height:72)
//                                    .clipShape(.capsule)
//                                    .overlay(
//                                    Capsule()
//                                        .strokeBorder(.white,lineWidth: 1)
//                                    ) 
//                                
//                                
//                                
//                                VStack(alignment: .leading) {
//                                        Text(crewMember.astronaut.name)
//                                            .foregroundStyle(.white)
//                                            .font(.headline)
//                                        Text(crewMember.role)
//                                            .foregroundStyle(.white.opacity(0.5))
//                                    }
//                                }
//                                .padding(.horizontal)
//                            
//                        }
//                    }
//                }
//            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        
        
    }
    

}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
        
}
