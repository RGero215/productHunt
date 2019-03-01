//
//  CommentsViewController.swift
//  ProductHunt
//
//  Created by Ramon Geronimo on 2/28/19.
//  Copyright © 2019 Ramon Geronimo. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    
    var comments: [String]! = [] {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        
    }
    

}

// MARK: UITableViewDataSource
extension CommentsViewController: UITableViewDataSource {
    /// Determines how many cells will be shown on the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    /// Creates and configures each cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = comments[indexPath.row]
        cell.commentTextView.text = comment
        return cell
    }
}

// MARK: UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    // Code to handle cell events goes here...
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

