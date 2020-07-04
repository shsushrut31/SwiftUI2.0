//
//  ContentView.swift
//  SwiftUI_IOS14_Update
//
//  Created by Sushrut Shastri on 2020-07-03.
//

import SwiftUI
import MapKit
import AVKit
import StoreKit

//MARK: - ContentView
struct ContentView: View {
    var body: some View {
        AppClips_Demo()
    }
}

//MARK: - ContentView Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - TextEditor
struct TextEditor_Demo: View {
    @State private var text = "Enter something"
    var body: some View {
        VStack {
            HStack{
                TextEditor(text: $text)
                    .cornerRadius(5.0)
                    .padding(.all, 5)
                    .frame(height: 100, alignment: .center)
            }.background(Color.black.opacity(0.3))
            .cornerRadius(5.0)
            .padding(.all, 10)
            
            Spacer()
        }
    }
}

//MARK: - Grid Demo
struct Grid_Demo: View {
    let data = (1...1000).map{ "Cell \($0)" }
    let column = [
        GridItem(.adaptive(minimum: 80)) ///.flexible, .fixed
    ]
    
    var body: some View{
        ScrollView(.horizontal) {
            LazyHGrid(rows: column){ ///LazyVGrid
                ForEach(data, id:\.self){item in
                    ZStack {
                        Color.randomColor
                        Text(item)
                            .fontWeight(.black)
                            .foregroundColor(.secondary)
                            .frame(width: 80)
                    }.cornerRadius(5.0)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

//MARK: - MapView
struct MapView_Demo: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.018137, longitude: 72.589965), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View{
        Map(coordinateRegion: $region)
            .padding(.all, 20)
    }
}

//MARK: - ColorPicker
struct ColorPicker_Demo: View {
    @State private var bgColor = Color.white
    var body: some View{
        ColorPicker("Select Background Color", selection: $bgColor)
    }
}

//MARK: - Video Player
struct VideoPlayer_Demo : View {
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)) {
            Text("Video")
                .background(Color.black.opacity(0.2))
        }
    }
}

//MARK: - Label
struct Label_Demo: View {
    var body: some View{
        VStack {
            Label("Like", systemImage: "heart.fill")
                .font(.title)
            
            Label{
                Text("Sushrut Shastri")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon : {
                Image(systemName: "person.circle")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .tile)
                    .frame(width: 64, height: 64)
                    .foregroundColor(Color.black.opacity(0.3))
                    .background(Color.green)
                    .clipShape(Circle())
            }
        }
    }
}

//MARK: - Link (Opens given URL in Safari)
struct Link_Demo: View {
    var body: some View{
        Link(destination: URL(string: "https://apple.com")!){
            Label{
                Text("Sushrut Shastri")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon : {
                Image(systemName: "person.circle")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .tile)
                    .frame(width: 64, height: 64)
                    .foregroundColor(Color.black.opacity(0.3))
                    .background(Color.green)
                    .clipShape(Circle())
            }
        }
    }
}

//MARK: - Datepicker IOS 14
struct DatePicker_Demo: View {
    @State private var date = Date()
    var body: some View{
        VStack{
            Text("Select Date")
                .font(.title)
            DatePicker("Select Date", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .frame(maxHeight: 400)
        }
    }
}

//MARK: - Disclosure Group (Collapsable view)
struct DisclosureGroup_Demo: View {
    @State private var isOpened = false
    var body: some View{
        VStack {
            DisclosureGroup("Show Terms", isExpanded : $isOpened) {
                Text("Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions Terms & Conditions")
                Button("Hide"){
                    self.isOpened.toggle()
                }
            }
            .padding()
            
            Text("some text")
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 200)
        }
    }
}

//MARK: - Toolbar Items
struct ToolBarItem_Demo: View {
    var body: some View{
        NavigationView{
            Text("Hello World").padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            Button("Button 1"){
                                print("Button 1 pressed")
                            }
                            Button(action: {
                                print("Profile tapped")
                            }, label: {
                                Image(systemName: "person.circle")
                            })
                        }
                    }
                }
        }
    }
}

//MARK: - List with expandable rows
struct Bookmark : Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?
}

extension Bookmark{
    static let apple = Bookmark(name: "Apple", icon: "link.circle")
    static let facebook = Bookmark(name: "Facebook", icon: "person.circle")
    static let twitter = Bookmark(name: "Twitter", icon: "trash")
    static let samsung = Bookmark(name: "Samsung", icon: "bolt.fill")
    
    static let example1 = Bookmark(name: "Favourites", icon: "star", items: [Bookmark.apple, Bookmark.facebook, Bookmark.twitter, Bookmark.samsung])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.facebook, Bookmark.twitter, Bookmark.samsung])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.facebook, Bookmark.twitter, Bookmark.samsung])
}

struct ExpandableList_Demo: View {
    let items: [Bookmark] = [.example1, .example2, .example3]
    var body: some View{
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}

//MARK: - MatchedGreometryEffect to achieve sleek animations
struct MatchedGeometryEffect_Demo: View {
    @State private var isZoomed = false
    @Namespace private var animation
    
    var frame: CGFloat{
        isZoomed ? 300 : 44
    }
    
    var body: some View{
        VStack{
            Spacer()
            VStack {
                HStack{
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.green)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)
                    
                    if isZoomed == false{
                        Text("Sushrut Shastri - 1992")
                            .font(.headline)
                            .matchedGeometryEffect(id: "name", in: animation)
                    }
                }
                
                if isZoomed{
                    Text("Sushrut Shastri - 1992")
                        .font(.headline)
                        .matchedGeometryEffect(id: "name", in: animation)
                        .padding(.bottom, 60)
                    
                    Spacer()
                }
            }.onTapGesture {
                withAnimation(.spring()){
                    self.isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth : .infinity)
            .frame(height: isZoomed ? 400 : 60)
            .background(Color(white: 0.9))
            Spacer()
        }
    }
}

//MARK: - ScrollViewReader to scroll to particular item
struct ScrollViewReader_Demo : View {
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View{
        ScrollView{
            ScrollViewReader{ value in
                Button("Jump to 6th"){
                    withAnimation{
                        value.scrollTo(6, anchor: .center)
                    }
                }
                ForEach(0..<10){ i in
                    Text("\(i)th Element")
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
    }
}

//MARK: - Full Screen Cover (Present view which covers up whole screen)
struct FullScreenCover_Demo: View {
    @State private var isPresented = false
    
    var body: some View{
        Button("Present"){
            self.isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: DateFormating_Demo.init)
    }
}

//MARK: - Date Formatting
struct DateFormating_Demo : View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            Spacer()
            
            HStack{
                Spacer()
                Text("Date")
                    .fontWeight(.bold)
                Text(Date().addingTimeInterval(600), style: .date)
                    .frame(width: 200)
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("Time")
                    .fontWeight(.bold)
                Text(Date().addingTimeInterval(600), style: .time)
                    .frame(width: 200)
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("Relative")
                    .fontWeight(.bold)
                Text(Date().addingTimeInterval(600), style: .relative)
                    .frame(width: 200)
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("Timer")
                    .fontWeight(.bold)
                Text(Date().addingTimeInterval(600), style: .timer)
                    .frame(width: 200)
                Spacer()
            }
            Button("Dismiss"){
                presentationMode.wrappedValue.dismiss()
            }
            
            Spacer()
        }
        .background(Color.green.opacity(0.4))
        .edgesIgnoringSafeArea(.all)
    }
}

//MARK: - App Clips & Colored SFSymbols
struct AppClips_Demo: View {
    @State private var showRecommended = false
    @ScaledMetric var imageSize: CGFloat = 100
    var body: some View{
        VStack {
            ///Scaled Image
            Image(systemName: "cloud.sun.bolt.fill")
                .resizable()
                .frame(width: imageSize, height: imageSize)
            
            ///Colored Image
            Image(systemName: "cloud.sun.bolt.fill")
                .renderingMode(.original)
                .font(.largeTitle)
                .padding()
                .background(Color.black)
                .clipShape(Circle())
            
            ///Show App Clips
            Button("Show Recomended App"){
                self.showRecommended.toggle()
            }
            .appStoreOverlay(isPresented: $showRecommended){
                SKOverlay.AppConfiguration(appIdentifier: "1440611372", position: .bottom)
        }
        }
    }
}


