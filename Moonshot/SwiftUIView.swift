//
//  SwiftUIView.swift
//  Moonshot
//
//  Created by APPLE on 15/05/24.
//

import SwiftUI
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}
struct SwiftUIView: View {
    var body: some View {
        //        Image(.appleOffice)
        //            .resizable()
        //            .scaledToFit()
        ////            .frame(width:300,height:800)
        //            .containerRelativeFrame(.horizontal) { size, axis in
        //                    size * 0.8
        //                }
        
        
        //        ScrollView(.horizontal){
        //         LazyHStack(spacing:10){
        //                ForEach(0..<100){
        //                    CustomText("Text \($0)")
        //                        .font(.title)
        //                }
        //            }
        //
        //        }
        
        
//        NavigationStack {
//            NavigationLink("Tap Me") {
//                Text("Detail View")
//            }
//            .navigationTitle("SwiftUI")
//        }
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
        }
        
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    
      
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            // more code to come
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
            
    }
}

#Preview {
    SwiftUIView()
}
