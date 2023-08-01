//
//  ContentView.swift
//  WEEK2Lab3
//
//  Created by Muneera Y on 14/01/1445 AH.
//

import SwiftUI

struct ContentView: View {
    //MARK: Task 3: Using @State
    
//    In the main view, use @State to manage a variable that changes the view's appearance.
//    Implement a button in the main view to toggle the state variable and observe the UI update.
    @State var name: String = ""
    @State var showName: Bool = false
    @ObservedObject var progress = UserProgress()
    var body: some View {
        
        //MARK: Task 1: Creating Navigation Views
        //Design a SwiftUI View that serves as the main entry point of the app.
//        Implement a navigation view with a navigation bar and a title for the main view.
//        Add a button to navigate to a second view.
        NavigationStack  {
            VStack {
                //MARK: no neeed button to click
                //                NavigationLink( destination: SecondView(name: $name), isActive: $showName){
                //                    EmptyView()
                //                }
                
                    Text("Hello, Can you write your name please?").font(.largeTitle)
                //Task 2: Passing Data Between Views
                
/*               Create a second SwiftUI View to display detailed information.
                Pass data from the main view to the second view when the button is tapped.
             Display the received data in the second view.
 */
                    TextField("Full Name", text: $name, onCommit: {
                        self.showName = true
                    })
                
                NavigationLink{

                    SecondView(name: $name)


                } label:{
                    Text("Click here")
                }
              
                }
          
                .navigationTitle("Home page") .padding()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //MARK: For dark mode 
//            .preferredColorScheme(.dark)
    }
}
