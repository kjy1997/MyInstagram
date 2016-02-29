//
//  SecondViewController.swift
//  MyInstagram
//
//  Created by Jiayi Kou on 2/28/16.
//  Copyright © 2016 Jiayi Kou. All rights reserved.
//
import Parse
import UIKit

class SecondViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var editedImage :UIImage!
    @IBOutlet var captionTextField: UITextField!
    @IBOutlet var uploadedImage: UIImageView!
    @IBAction func onTap(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            self.uploadedImage.image = editedImage
            dismissViewControllerAnimated(true, completion: nil)
            
    }
    
    @IBAction func onUpload(sender: AnyObject) {
        UserMedia.postUserImage(self.editedImage, withCaption: self.captionTextField.text) { (result:Bool, error:NSError?) -> Void in
            if result{
            print("success")
            }else{
                print("\(error)")
            }
            
            
        }
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                // do something with the data fetched
                print(media)
            } else {
                // handle error
                print("\(error)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
