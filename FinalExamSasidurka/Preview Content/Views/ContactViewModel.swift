//
//  ContactViewModel.swift
//  FinalExamSasidurka
//
//  Created by Sasidurka on 2024-12-13.
//

import Foundation

//https://jsonplaceholder.typicode.com/todos

class TodoViewModel : ObservableObject {
    
    //@Published var todoItems : [TodoItem] = []
    @Published var users : [User] = []
    let baseUrlStr =  "https://jsonplaceholder.typicode.com/"
    
    
    func getUsers() async throws {
        //https://jsonplaceholder.typicode.com/users
        let urlStr = baseUrlStr+"users"
        let url = URL(string: urlStr)
        
        let ( data, _ ) =  try  await URLSession.shared.data(from: url!)
         
        let  jsonDecoder = JSONDecoder()
        
        let users =  try jsonDecoder.decode([User].self, from: data)
        
        DispatchQueue.main.async{
            
            self.users = users
        }
    }
    
    
    
}
