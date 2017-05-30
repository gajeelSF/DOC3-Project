//
//  ShareViewController.swift
//  DOC3 Project
//
//  Created by SongYuda on 5/26/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class ShareViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts : [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let query = PFQuery(className: "post")
        query.order(byDescending: "createdAt")
        query.limit = 20
        
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        progress.label.text = "Loading"

        
        query.findObjectsInBackground { (posts, error) in
            if let posts = posts {
                self.posts = posts
                self.tableView.reloadData()
            }
            else {
                
                print(error?.localizedDescription)
            }
        }
        
        progress.hide(animated: true)
        
        let refreshControl = UIRefreshControl()

        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)as! PostTableViewCell
        cell.post = posts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let posts = posts {
            return posts.count
        }
        else {
            return 0
        }
    }
    @IBAction func onWrite(_ sender: Any) {
        self.performSegue(withIdentifier: "toCreate", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let post = self.posts[(indexPath?.row)!]
        let postDetailVC = segue.destination as! PostDetailViewController
        postDetailVC.post = post;
        }
    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        let query = PFQuery(className: "post")
        query.order(byDescending: "createdAt")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if let posts = posts {
                self.posts = posts
                self.tableView.reloadData()
            }
            else {
                
                print(error?.localizedDescription)
            }
        }
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    

}
