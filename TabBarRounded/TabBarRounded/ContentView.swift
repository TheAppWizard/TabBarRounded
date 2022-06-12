//
//  ContentView.swift
//  TabBarRounded
//
//  Created by Shreyas Vilaschandra Bhike on 21/04/22.

//  MARK: Instagram
//  TheAppWizard
//  theappwizard2408

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ZStack{
            FinalView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}























struct FinalView: View {
    
    
    var body: some View {
        ZStack
            {
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
                               color:  .white.opacity(0) )]))
            }
        }
        
    }
    

