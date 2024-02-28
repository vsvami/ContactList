//
//  Person.swift
//  ContactList
//
//  Created by Vladimir Dmitriev on 28.02.24.
//

struct Person {
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> [Person] {
        let data = DataStore()
        var persons: [Person] = []
        
        for _ in 1...data.emails.count {
            let person = Person(
                name: data.names.remove(at: Int.random(in: 0...data.emails.count - 1)),
                surname: data.surnames.remove(at: Int.random(in: 0...data.emails.count - 1)),
                phoneNumber: data.phoneNumbers.remove(at: Int.random(in: 0...data.emails.count - 1)),
                email: data.emails.remove(at: Int.random(in: 0...data.emails.count - 1))
            )
            
            persons.append(person)
        }
        
        return persons
    }
}
