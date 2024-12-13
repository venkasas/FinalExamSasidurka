//
//  ContactListView.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//

import SwiftUI

import SwiftUI

struct ContactListView: View {
    @StateObject var vm = ContactViewModel()
    
    var body: some View {
        
        VStack{
            Text("List of users")
            Button("Display Users"){
                Task{
                    do {
                        try await vm.getUsers()
                    }catch {
                        
                        print("error")
                        // display alert message
                    }
                }
            }
            
            List{
                ForEach(vm.users , id: \.id) {
                    users in
                    HStack{
                        Text(users.firstName)
                        Text(users.lastName)
                        Text(users.phone)
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContactListView()
}
