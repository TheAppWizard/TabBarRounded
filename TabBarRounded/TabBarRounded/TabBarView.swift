//
//  TabBarView.swift
//  TabBarRounded
//
//  Created by Shreyas Vilaschandra Bhike on 21/04/22.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab = "monkey1"
    @Binding var pages: [TabBarPage]

    
    
    var body: some View {
        
        ZStack{
        Color.black.edgesIgnoringSafeArea(.all)
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                        
                        .tabItem{
                            EmptyView()
                        }.tag(item.tag)
                }
            }
            
            HStack {
                ForEach(pages) { item in
                    Button(action: {
                        self.selectedTab = item.tag
                    }) {
                        ZStack {

                            
                            Image(item.icon)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .opacity(selectedTab == item.tag ? 1 : 0.2 )
                              
                               
                            
     
                            if( selectedTab == item.tag){
                               
                                ZStack{
                                Triangle()
                                    .fill(.white)
                                    .frame(width: 50, height: 30)
                                    .offset(x: 0, y: 50)
                                    .rotationEffect(.degrees(180))
                                }
                            }
                           
                        
                                
                        }
                    }
                    .frame(width: 140, height: 100)
                    
                  
                    
                }
            }
            .padding(5)
            .background(BlurBG())
            .clipShape(
                CustomShape(
                    corner: [.topRight,.topLeft], radii: 50
                    ))
            .padding()
            .offset(x: 0, y: 50)
           
        }
        }
        
        
    }
}

    
    

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(pages: .constant([
            
            TabBarPage(page: MonkeyView(),
                       
                       icon: "monkey1",
                       tag: "monkey1",
                       color: .white.opacity(0) ),
            TabBarPage(page: LionView(),
                       
                       icon: "lion",
                       tag: "lion2",
                       color:  .white.opacity(0) ),
                                     
            
            TabBarPage(page: OwlView(),
                       icon: "owl",
                       tag: "owl3",
                       color:  .white.opacity(0) ),
            
            
        
        ]))
        
        
    }
}


struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var tag: String
    var color: Color
}


struct MonkeyView: View {
    var body: some View {
        ZStack{
        
            Color.black.edgesIgnoringSafeArea(.all)
            
            
            VStack{
            Header(imgURL: "monkey1", name: "MONKEY")
                ForEach(0 ..< 10) {
                        Rectangle()
                            .frame(width: 400, height: 30, alignment: .center)
                            .opacity(0.2)
                            .foregroundColor(.white)
                            .opacity(0.3)
                            .rotationEffect(.degrees(Double($0) * 0))
                     }
                
            }.padding()

            
            
        }
    }
}


struct LionView: View {
    var body: some View {
        ZStack{
        Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                
                Header(imgURL: "lion", name: "LION")
                
                ForEach(0 ..< 10) {
                        Rectangle()
                            .frame(width: 400, height: 30, alignment: .center)
                            .opacity(0.2)
                            .foregroundColor(.white)
                            .opacity(0.3)
                            .rotationEffect(.degrees(Double($0) * 0))
                     }
            }.padding()

        }
    }
}


struct OwlView: View {
    var body: some View {
        ZStack{
        Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                
                Header(imgURL: "owl", name: "OWL")
                
                ForEach(0 ..< 10) {
                        Rectangle()
                            .frame(width: 400, height: 30, alignment: .center)
                            .opacity(0.2)
                            .foregroundColor(.white)
                            .opacity(0.3)
                            .rotationEffect(.degrees(Double($0) * 0))
                     }
            }.padding()
        }
    }
}









struct CustomShape: Shape {
    var corner : UIRectCorner
    var radii : CGFloat

    func path(in rect : CGRect) -> Path{
        let path = UIBezierPath(
            roundedRect : rect,
            byRoundingCorners: corner,
            cornerRadii: CGSize(
            width: radii, height: radii))

        return Path(path.cgPath)
    }
}


struct BlurBG : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        // for dark mode adoption...
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
///

struct Header: View {
    
    @State private var animCharacter = false
    @State var imgURL = "";
    @State var name = "";
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    
                    Image(imgURL)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .rotationEffect(.degrees(animCharacter ? 5 : -5))
                                .onAppear {
                                    withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                                        {
                                        animCharacter.toggle()
                                                }
                                        }
                
                    
               VStack{
                  HStack{
                    Text("It's a")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                    
                Spacer()
                }
                HStack{
          
                Text(name)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                    
                    Spacer()
                   
                  }
                
                }
                    
                }.padding()
                
                
            }
            
        }
    }
}




///
