//
//  LeaderController.swift
//  leaderspace
//
//  Created by Александр on 13.11.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class LeaderController: UIViewController {

    var didSelect: ((Leaderboard)->())?
    
    var boards: [Leaderboard] = [] {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(LeaderbordCell.self)
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    
    init(boards: [Leaderboard]) {
        self.boards = boards
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onDidBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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


extension LeaderController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leader = self.boards[indexPath.row]
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as LeaderbordCell
        cell.configure(leader)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let board = self.boards[indexPath.row]
        self.didSelect?(board)
    }
    
}
