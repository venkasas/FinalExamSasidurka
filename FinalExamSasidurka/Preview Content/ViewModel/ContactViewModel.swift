//
//  ContactViewModel.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//

import Foundation



class ContactViewModel : ObservableObject {
    
    //@Published var todoItems : [TodoItem] = []
    @Published var users : [Users] = []
    let baseUrlStr =  "https://dummyjson.com/users"
    
    
    func getUsers() async throws {
        //https://dummyjson.com/users
        let urlStr = baseUrlStr+"users"
        let url = URL(string: urlStr)
        
        let ( data, _ ) =  try  await URLSession.shared.data(from: url!)
         
        let  jsonDecoder = JSONDecoder()
        
        let users =  try jsonDecoder.decode([Users].self, from: data)
        
        DispatchQueue.main.async{
            
            self.users = users
        }
    }
    
    
    
}
