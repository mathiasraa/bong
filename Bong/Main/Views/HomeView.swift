//
//  HomeView.swift
//  Bong
//
//  Created by Mathias Raa on 09/02/2023.
//

import SwiftUI
import FirebaseFirestore

//var courses = [
//    Course(title: "Animations in SwiftUI", subtitle: "Build and animate an iOS app from scratch", caption: "20 sections - 3 hours", image: Image("Topic 1")),
//    Course(title: "Build Quick Apps with SwiftUI", subtitle: "Apply your Swift and SwiftUI knowledge by building real, quick and various applications from scratch", caption: "47 sections - 11 hours", image: Image("Topic 2")),
//    Course(title: "Build a SwiftUI app for iOS 15", subtitle: "Design and code a SwiftUI 3 app with custom layouts, animations and gestures using Xcode 13, SF Symbols 3, Canvas, Concurrency, Searchable and a whole lot more", caption: "21 sections - 4 hours", image: Image("Topic 1"))
//]
import CodeScanner
import FirebaseAuth

struct HomeView: View {
    @EnvironmentObject private var challengesvm: ChallengesViewModel
    @EnvironmentObject private var userManager: UserManager
    
    @State private var isShowingScanner = false
    @State private var isPresentingScanner = false
    @State private var isPresentingGroupCreator = false
    @State private var scannedCode: String?
    @State var isInGroup = false
    
    // 1
    //var userId = ""
    // 2
     //private let authenticationService = AuthenticationService()
    // 3
    //private var cancellables: Set<AnyCancellable> = []
    
//    init() {
//      // 1
//      authenticationService.$user
//        .compactMap { user in
//          user?.uid
//        }
//        .assign(to: \.userId, on: self)
//        .store(in: &cancellables)
//
//      // 2
//      authenticationService.$user
//        .receive(on: DispatchQueue.main)
//        .sink { [weak self] _ in
//          // 3
//          self?.get()
//        }
//        .store(in: &cancellables)
//    }
    
    var body: some View {
        if (isInGroup) {
            Text("på deg")
        } else {
            VStack(spacing: 20) {
                Text("You don't have a group.")
                    .fontDesign(.monospaced)
                
                Text(scannedCode ?? "xvzvz")
                
                Text(userManager.getUserID())
                
                HStack {
                    Button{
                        isPresentingGroupCreator = true
                    } label: {
                        Text("Create a group")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    
                    Button{
                        isPresentingScanner = true
                    } label: {
                        Text("Join a group")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    
                    .sheet(isPresented: $isPresentingGroupCreator) {
                        QRGeneratorView()
                    }
                    
                    .sheet(isPresented: $isPresentingScanner) {
                        CodeScannerView(codeTypes: [.qr]) { response in
                            if case let .success(result) = response {
                                scannedCode = result.string
                                isPresentingScanner = false
                            }
                        }
                    }
                }
            }
        }
        
        //        NavigationView {
        //            ScrollView {
        //                HomeCard()
        //                ForEach(viewModel.challenges) { challenge in
        //                    Card(challenge: challenge)
        //                }
        //                .onAppear() {
        //                    self.viewModel.fetchData()
        //                }
        //            }.navigationTitle("Challenges")
        //        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        // more code to come
    }
}

struct HomeCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
