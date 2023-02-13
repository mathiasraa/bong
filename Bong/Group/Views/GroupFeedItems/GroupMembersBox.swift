//
//  GroupMembersBox.swift
//  Bong
//
//  Created by Nick Askari on 12/02/2023.
//

import SwiftUI

struct GroupMembersBox: View {
    @EnvironmentObject private var groupManager: GroupManager
    @AppStorage("groupName") private var groupName: String = ""
    
    var body: some View {
        HStack(spacing: 40) {
            Text(groupName + " has this many members..")
                .blackMathiasStyle()
            
            Text("12")
                .blackMathiasStyle()
                .font(.system(size: 30))
        }
    }
}












struct GroupMembersBox_Previews: PreviewProvider {
    static var previews: some View {
        GroupMembersBox()
    }
}
