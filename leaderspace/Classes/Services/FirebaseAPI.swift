//
//  FirebaseAPI.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit
import Firebase

class FirebaseAPI: NSObject {

    class func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          // ...
        }
    }
    
    class func getLeaderboards(completion: @escaping (([Leaderboard])->())) {
        let query = Firestore.firestore().collection("leaderboards")
        query.addSnapshotListener { (leaderboards, error) in
            guard let snapshot = leaderboards else {
                print("Error fetching documents results: \(error!)")
                return
            }
             
            let results = snapshot.documents.map { (leaderboard) -> Leaderboard in
                if let task = Leaderboard(dictionary: leaderboard.data()) {
                    return task
                } else {
                    fatalError("Unable to initialize type \(Leaderboard.self) with dictionary \(leaderboard.data())")
                }
            }
            completion(results)
        }
    }
    
    class func getActions(completion: @escaping (([Action])->())) {
        let query = Firestore.firestore().collection("actions")
        query.addSnapshotListener { (actions, error) in
            guard let snapshot = actions else {
                print("Error fetching documents results: \(error!)")
                return
            }
             
            let results = snapshot.documents.map { (action) -> Action in
                if let task = Action(from: action.data()) {
                    return task
                } else {
                    fatalError("Unable to initialize type \(Action.self) with dictionary \(action.data())")
                }
            }
            completion(results)
        }
    }
    
    class func getUsers(completion: @escaping (([User])->())) {
        let query = Firestore.firestore().collection("users")
        query.addSnapshotListener { (users, error) in
            guard let snapshot = users else {
                print("Error fetching documents results: \(error!)")
                return
            }
             
            let results = snapshot.documents.map { (action) -> User in
                if let task = User(from: action.data()) {
                    return task
                } else {
                    fatalError("Unable to initialize type \(User.self) with dictionary \(action.data())")
                }
            }
            completion(results)
        }
    }
    
    class func getTasks(completion: @escaping (([Task])->())) {
        let query = Firestore.firestore().collection("tasks")
        query.addSnapshotListener { (tasks, error) in
            guard let snapshot = tasks else {
                print("Error fetching documents results: \(error!)")
                return
            }
             
            let results = snapshot.documents.map { (task) -> Task in
                if let task = Task(from: task.data()) {
                    return task
                } else {
                    fatalError("Unable to initialize type \(Task.self) with dictionary \(task.data())")
                }
            }
            completion(results)
        }
    }
    
}
