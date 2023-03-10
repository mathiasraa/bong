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

struct SetupView: View {
    @EnvironmentObject private var challengesvm: ChallengesViewModel
    @EnvironmentObject private var userManager: UserManager
    @EnvironmentObject private var groupManager: GroupManager
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var isShowingScanner = false
    @State private var isPresentingScanner = false
    @State private var isPresentingGroupCreator = false
    @State private var scannedCode: String?
    @State private var isInGroup = false
    
    
    var body: some View {
        if (isInGroup) {
            Text("på deg")
        } else {
            VStack(spacing: 20) {
                Text("You don't have a group.")
                    .fontDesign(.monospaced)
                
                
                //                Text(scannedCode ?? "xvzvz")
                //
                //                Text(userManager.getUserID())
                
                HStack {
                    createGroupButton
                    signOutButton
                    joinGroupButton
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .fullScreenCover(isPresented: $isPresentingGroupCreator) {
                    CreateGroupView()
                }
                .fullScreenCover(isPresented: $isPresentingScanner, content: {
                    cameraView
                })
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
    
    private var createGroupButton: some View {
        Button {
            isPresentingGroupCreator = true
        } label: {
            Text("Create a group")
                .mathiasStyle()
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
    }
    
    private var signOutButton: some View {
        Button {
            userManager.signOut()
        } label: {
            Text("Logg ut")
                .mathiasStyle()
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
    }
    
    private var joinGroupButton: some View {
        Button {
            isPresentingScanner = true
        } label: {
            Text("Join a group")
                .mathiasStyle()
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
    }
    
    private var cameraView: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topLeading) {
                CodeScannerView(codeTypes: [.qr]) { response in
                    if case let .success(result) = response {
                        scannedCode = result.string
                        if let splitCode = scannedCode?.split(separator: "_") {
                            groupManager.joinGroup(id: String(splitCode[1]))
                        }
                        
                        isPresentingScanner = false
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.all)
                
                cancelButton
            }
            
            withAnimation {
                cameraHelp
            }
        }
    }
    
    private var cancelButton: some View {
        Button {
            isPresentingScanner.toggle()
        } label: {
            Image(systemName: "xmark")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(5)
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
        .padding([.leading])
        
    }
    
    private var cameraHelp: some View {
        Text("Please scan a valid QR code to find a group.")
            .rectStyle(.black)
            .padding()
    }
    
    private func handleScan(result: Result<ScanResult, ScanError>) {
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
        SetupView()
    }
}
