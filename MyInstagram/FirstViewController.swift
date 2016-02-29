//
//  FirstViewController.swift
//  MyInstagram
//
//  Created by Jiayi Kou on 2/28/16.
//  Copyright © 2016 Jiayi Kou. All rights reserved.
//

import UIKit
import Parse

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var media:[PFObject]!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                // do something with the data fetched
                self.media = media
                
                print(media)
            } else {
                // handle error
                print("\(error)")
            }
            self.tableView.reloadData()
        }

    }
    override func viewWillAppear(animated: Bool) {
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                // do something with the data fetched
                self.media = media
                
                print(media)
            } else {
                // handle error
                print("\(error)")
            }
            self.tableView.reloadData()
        }

        print("appear")
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("InstagramCell", forIndexPath: indexPath) as! InstagramCell
        let media = self.media[indexPath.row]
        let picturefile = media["media"] as! PFFile
        picturefile.getDataInBackgroundWithBlock { (data:NSData?, error:NSError?) -> Void in
            if let data = data {
                cell.postImage.image = UIImage(data: data)
                print("success")
            }else{
                print("\(error)")
            }
            
        }
            cell.captionLabel.text = media["caption"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let media = media{
        return media.count
        }else{
            return 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
