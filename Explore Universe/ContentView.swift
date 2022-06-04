//
//  ContentView.swift
//  Explore Universe
//
//  Created by Mohammed Alsaleh on 05/11/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @State var showPlanetView = false
    var body: some View {
        ZStack {
                ZStack {
                 Image("firstView")
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width,maxHeight: .infinity)
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Explore The")
                                .font(.system(size: 50,weight: .bold))
                                .foregroundColor(.white)
                            HStack {
                                Text("Solar")
                                    .font(.system(size: 50,weight: .bold))
                                .foregroundColor(.textC)
                                Text("System.")
                                    .font(.system(size: 50,weight: .bold))
                                    .foregroundColor(.white)
                            }
                                
                        }.frame(width: UIScreen.main.bounds.width).padding(.top ,50).padding().background(RoundedRectangle(cornerRadius: 15).fill(Color.bgC)).edgesIgnoringSafeArea(.top)
                        Spacer()
                    }

                }.ignoresSafeArea()
            VStack {
                Spacer()
                Button {
                    withAnimation {
                        self.showPlanetView = true
                    }
                } label: {
                    Text("FLY")
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(.white)
                        .padding(4)
                        .frame(width: 150)
                        .background(RoundedRectangle(cornerRadius: 30)
                            .fill(
                                LinearGradient(colors: [.bgC,.BGButtonC], startPoint: .topTrailing, endPoint: .bottomLeading)
                            )
                        )
                }.padding()

            }
            if self.showPlanetView {
                planetView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
            
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct planetView: View {
    @State var planets:[Planet] = [
        Planet(imageName: "Mercury", planetName: "Mercury", planetDes: """
Mercury is the smallest planet in the Solar System and the closest to the Sun.
                   
Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun's planets.

Two spacecraft have visited Mercury: Mariner 10 flew by in 1974 and 1975; and MESSENGER, launched in 2004, orbited Mercury over 4,000 times in four years before exhausting its fuel and crashing into the planet's surface on April 30, 2015.
"""),
        Planet(imageName: "Venus", planetName: "Venus", planetDes: """
Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty.

Venus orbits the Sun every 224.7 Earth days.

Its proximity to Earth has made Venus a prime target for early interplanetary exploration. It was the first planet beyond Earth visited by a spacecraft (Mariner 2 in 1962), and the first to be successfully landed on (by Venera 7 in 1970).
"""),
        Planet(imageName: "Earth", planetName: "Earth", planetDes: """
Earth is the third planet from the Sun and the only astronomical object known to harbor and support life.

Earth orbits around the Sun in about 365.25 days.

According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago. Within the first billion years of Earth's history, life appeared in the oceans and began to affect Earth's atmosphere and surface, leading to the proliferation of anaerobic and, later, aerobic organisms.
""")
    ]
    @State var currentPlanet : Planet = Planet(imageName: "Mercury", planetName: "Mercury", planetDes: """
Mercury is the smallest planet in the Solar System and the closest to the Sun.
                   
Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun's planets.

Two spacecraft have visited Mercury: Mariner 10 flew by in 1974 and 1975; and MESSENGER, launched in 2004, orbited Mercury over 4,000 times in four years before exhausting its fuel and crashing into the planet's surface on April 30, 2015.
""")
    var body: some View {
        ZStack {
            ZStack {
            Color.BGplanetVC
            
            VStack {
                Color.BGplanetImageC
                    .cornerRadius(15)
                    .frame(height:UIScreen.main.bounds.height / 2.4)
                Image("stars")
                    .resizable()
                    .scaledToFit()
            }
            }.ignoresSafeArea()
            VStack {
                Image(currentPlanet.imageName)
                    .resizable()
                    .frame(maxWidth:.infinity,alignment: .center)
                    .edgesIgnoringSafeArea(.top)
                VStack(alignment:.leading) {
                    Text(currentPlanet.planetName)
                        .font(.system(size: 40,weight: .bold))
                        .padding(.bottom)
                    Text(currentPlanet.planetDes)
                        .font(.system(size: 16))
                }.frame(height:400).foregroundColor(.white).padding(.horizontal).background(RoundedRectangle(cornerRadius: 20).fill(Color.BGCardC))
                    .padding(.horizontal)
                    .offset(y: -50)
                HStack {
                    ForEach(self.planets,id:\.id) { plante in
                        Image(plante.imageName)
                            .resizable()
                            .frame(width: 70, height: 60)
                            .onTapGesture {
                                withAnimation {
                                    self.currentPlanet = plante
                                }
                            }
                    }
                }.background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.BGButtonC))
                Spacer()
                
            }.padding(.horizontal)
        }
    }
}



extension Color {
    static var bgC : Color {
        return Color(#colorLiteral(red: 0.1972422302, green: 0.212246865, blue: 0.3218928277, alpha: 1))
    }
    static var textC : Color {
        return Color(#colorLiteral(red: 1, green: 0.8600150943, blue: 0.4452719092, alpha: 1))
    }
    static var BGButtonC : Color {
        return Color(#colorLiteral(red: 0.4559365511, green: 0.466940701, blue: 0.5521644354, alpha: 0.5))
    }
    static var BGplanetVC :Color {
        return Color(#colorLiteral(red: 0.1723626852, green: 0.1987386644, blue: 0.3281776309, alpha: 1))
    }
    static var BGplanetImageC : Color {
        return Color(#colorLiteral(red: 0.2076754868, green: 0.2322691977, blue: 0.3497119546, alpha: 1))
    }
    static var BGCardC :Color {
        return Color(#colorLiteral(red: 0.8817101121, green: 0.36717695, blue: 0.3940322995, alpha: 1))
    }
}

struct Planet : Identifiable {
    var id = UUID()
    var imageName : String
    var planetName : String
    var planetDes : String
}

