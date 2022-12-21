import SwiftUI

struct FortressView: View {

    let fortressText1 = "The Bobruisk Fortress is an outstanding defense installation, one of the best surviving specimens of fortification architecture of the first half of the 19th century.In the early 1840s the Bobruisk citadel – “the elder sister” of the Brest Fortress – was the most inaccessible fortress in the Russian Empire and one of the best-equipped defense installations in Europe. The fortress witnessed the War of 1812, the Decembrist revolt, the Great Patriotic War"
    
    let fortressText2 = "In 1810 Emperor Aleksandr I approved Bobruisk as a place to build one of the citadels along the western border of the Russian Empire. Belarusian military engineer Teodor Narbut developed the first plan of the fortress that was to be built in place of the ancient castle of the 14th-17th centuries. Chief of Military Engineers, Count Carl Opperman drafted the general plan and supervised the construction works that were launched on 4 June 1810. Taking part in the construction works were thousands of soldiers and peasants. The most advanced construction solutions were utilized. The citadel was assigned the first class of fortification buildings. The fortress occupied nearly 120 hectares."

    let fortressText3 = "The fortress was surrounded by 10 meters high earthworks and ditches filled with water from the Berezina River and the Bobruika River. There were over 300 weapons of different calibers, ammunition that could last for a year and food reserves that could keep fighters alive for half a year. In 1812 the Bobruisk Fortress bore the brunt of Napoleon’s invasion. After the retreat of the Russian army led by General Bagration the garrison withstood the siege of the French army for four months. In the second phase of construction (1812-1855) the Bobruisk Fortress turned into a unique complex, famous not only for its fortifications but also beautiful architecture in the style of Classicism."

    let fortressText4 = "It was a true city with residential houses and administrative buildings, cobbled streets, the botanical garden and a square, Aleksandr Nevsky Cathedral. Military parades and fairs were held on the esplanade in front of the fortress. In 1820-1823, some of the fortress garrison staff were involved in the Decembrist movement, among them leaders of the Southern Society. It was here that they designed the legendary <Bobruisk plan> to capture Aleksandr I, which never materialized.In 1825, the fortress was turned into a jail for political prisoners and the Decembrists who served their sentences after the uprising on Senate Square."

    let fortressText5 = "In 1868, the citadel was downgraded to second class (it was already far from the borders) and in 1886 was transformed into a fortress-warehouse... But the story of the citadel, which ceased to be a strategic target, continued. During the Great Patriotic War the Nazis turned the fortress into a concentration camp for Soviet prisoners of war and killed about 40,000 soldiers and 40,000 civilians. Later it housed military barracks, warehouses. Many buildings of the legendary bastion were destroyed in the 1950s-1980s but some have survived till present days."

    let fortressText6 = "In 2002, the specimen of history and architecture <Bobruisk Fortress> was added to the state register of historical and cultural heritage of the Republic of Belarus. Bobruisk Fortress todayLess than half of the bastions of the citadel have survived. About 50 facilities, such as the tower, reduits, barracks are badly damaged. There are plans to restore the sight bridge, the Minsk Gate and a number of other installations. Under the project, the fortress will become a historical and cultural complex with museums, a sightseeing tour agency, souvenir stalls and a café. Today the fortress is open for excursions, film shooting and archeological studies."

    var body: some View {
        ZStack {
            LinearGradient(colors: [.mint, .cyan, .purple], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                .opacity(0.4)
            ScrollView {
                VStack {
                    Text("Bobruisk Fortress")
                        .foregroundColor(.indigo)
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    Image("fortress1")
                        .resizable()
                        .shadow(radius: 25)
                        .opacity(0.95)
                        .frame(width: 240, height: 220, alignment: .center)
                    Text(fortressText1)
                        .padding()
                    Image("fortress2")
                        .resizable()
                        .shadow(radius: 25)
                        .opacity(0.95)
                        .frame(width: 240, height: 220, alignment: .center)
                    Text(fortressText2)
                        .padding()
                    Image("fortress3")
                        .resizable()
                        .shadow(radius: 25)
                        .opacity(0.95)
                        .frame(width: 240, height: 220, alignment: .center)
                    Text(fortressText3)
                        .padding()
                    Image("fortress4")
                        .resizable()
                        .shadow(radius: 25)
                        .opacity(0.95)
                        .frame(width: 240, height: 220, alignment: .center)
                    Text(fortressText4)
                        .padding()
                    Image("fortress5")
                        .resizable()
                        .shadow(radius: 25)
                        .opacity(0.95)
                        .frame(width: 240, height: 220, alignment: .center)
                }
                Text(fortressText5)
                    .padding()
                Image("fortress6")
                    .resizable()
                    .shadow(radius: 25)
                    .opacity(0.95)
                    .frame(width: 240, height: 220, alignment: .center)
                Text(fortressText6)
                    .padding()
            }
        }
    }
}

struct FamousView_Previews: PreviewProvider {
    static var previews: some View {
        FortressView()
    }
}
