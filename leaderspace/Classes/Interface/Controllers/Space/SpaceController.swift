//
//  SpaceController.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class SpaceController: UIViewController {

    var board: Leaderboard
    var users: [User] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    var maxValue: Int = 10
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(RocketCell.self)
            self.collectionView.contentInset.left = 20
        }
    }
    
    init(board: Leaderboard) {
        self.board = board
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculateUser()
        // Do any additional setup after loading the view.
    }
    
    func calculateUser() {
        
        var users = Storage.shared.users
        
        Storage.shared.actions.forEach { (action) in
            for (index, var user) in users.enumerated() {
                if user.identifier == action.userId, let task = Storage.shared.tasks.first(where: { $0.id == action.taskId }) {
                    user.set(val: task.value)
                    users[index] = user
                }
            }
        }
        self.users = users.filter({ $0.value > 0 }).sorted(by: { $0.value > $1.value })
        self.maxValue = users.map({ $0.value }).max() ?? 10
    }
    
    // MARK: - Actions

    @IBAction func onDidBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openTasks(_ sender: Any) {
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SpaceController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let user = self.users[indexPath.row]
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RocketCell
        cell.confugure(user: user, maxValue: self.maxValue)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.view.frame.width - 80) / 3
        
        return CGSize.init(width: width, height: self.view.frame.height)
    }
    
}
