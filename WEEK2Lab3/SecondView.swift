
import SwiftUI
struct CardData: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subTitle: String
    let minutes: String

    let imageURL: URL?
}
struct SecondView: View {
    let categories: Array<String> = [
        "Calm",
        "Sleep",
        "Anxious",
        "Music"
    ]
  
 

    let cardArray: Array<CardData> = Array(
        repeating: CardData(
            title: "first s",
            subTitle: "Description",
            minutes: "10",
            imageURL: URL(string: "https://source.unsplash.com/200x200/?[people]")
        ),
        count: 10
        )
    @State var title: String = "Calm"
    @State var  filtterCategory : Array<CardData> = []
    @State private var isToggleOn = true
    @ObservedObject var progress = UserProgress()
    //MARK: Task 4: Using @binding
    
//    Create a custom SwiftUI View that contains a text field and a button.
//    Use @Binding to allow the parent view to modify the text field value.
//    Update the main view to include this custom view and showcase the two-way binding.
    @Binding var name: String
    var body: some View {
//        Text(self.name)
        NavigationStack  {
            VStack {
                
                
                

         
                Text("Wlcome \(self.name)").font(.system(.largeTitle))
                NavigationLink{
                 
                    Text(progress.score)

                    
                } label:{
                    Text("userName here")
                }
            
                HStack {

                    Text("How are you feeling today?")
                        .font(.system(.title))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                    
          

                ScrollView(.horizontal){
                    HStack {
                        ForEach(categories, id:
                                    \.self) { category in
                            Button(action: {
 
                                title = category
                               
                                print(category)
                            }, label: {
                                Text(category)
                            })
                            .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(16)
                                .foregroundColor(Color.black)
                            
                        }
                    }}
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
        
                ScrollView{
                    // MARK: Headline Card
                    CardView(data: CardData(
                        title: "Ready to start Your First Session?",
                        subTitle: "",
                        minutes: "20 Minutes",
                        imageURL: URL(string: "https://source.unsplash.com/200x200/?[people]")))
                    .frame(height: 200 )
                    .cornerRadius(16)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                
                    // MARK: Popular Cards
                    HStack {
                        Text("Meditations").padding(2)
                        Spacer()
              
                        
                    }
                    ScrollView (.horizontal){
                        HStack (spacing: 10) {
                            
                            ForEach(cardArray) { card in
                                CardView(data: CardData(title: card.title, subTitle: card.subTitle, minutes: card.minutes ,imageURL: card.imageURL))
                                
                                    .frame(width: 100, height: 200)
                                
                            }.cornerRadius(16)
                            Spacer()
                            //
                            
                        }
                        
                        
                    }
              
                    Toggle("Nignt Mode", isOn: $isToggleOn)
                        .preferredColorScheme(isToggleOn ? .dark : .light)
                    
                }
            }
           
            .padding()
            .navigationTitle(title)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing){
                    // when you click here the save the name of user
                    Button(action:{
                        progress.score = name
                    }) {
                        
                        Image(systemName: "person.crop.circle.fill")
                            .padding(.horizontal)
                            
                    }.foregroundColor(Color.red)
                    
                }
            }
           
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    @State static var name:String = ""
    static var previews: some View {
        SecondView(name: $name)
    }
}
