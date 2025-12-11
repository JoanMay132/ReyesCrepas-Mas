//
//  RootView.swift
//  Reyes Crepas
//
//  Created by Joan May on 05/07/25.
//

import SwiftUI

struct RootView : View  {
    @State private var showSignInView: Bool = false
    
     var body: some View {
         
         ZStack {
             if !showSignInView {
                 NavigationStack{
                     SettingsView(showSignInView: $showSignInView)
                 }
             }
         }
         
         .onAppear {
             let authUser =  try? AuthenticationManager.shared.getAuthenticatedUser()
             self.showSignInView = authUser == nil ? true : false

         }
         
         .fullScreenCover(isPresented: $showSignInView) {
             NavigationStack{
                 AuthenticationView(showSignInView: $showSignInView)
             }
         }
         
   
    }
}

//struct RootView: View {
//    @Binding var showSignInView: Bool
//
//    var body: some View {
//        ZStack {
//            NavigationStack {
//                ContentView()
//            }
//        }
//        .onAppear {
//            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
//            self.showSignInView = authUser == nil
//        }
//        .fullScreenCover(isPresented: $showSignInView) {
//            NavigationStack {
//                AuthenticationView(showSignInView: $showSignInView)
//            }
//        }
//    }
//}
//
//struct RootView_Previews: PreviewProvider {
//    @State static var show = false
//
//    static var previews: some View {
//        RootView(showSignInView: $show)
//    }
//}

struct RootView_Previews: PreviewProvider {
    @State static var show = false
    static var previews: some View {
        RootView()
    }
}
