//
//  SecondViewController.swift
//  CrusadersQuestDirectory
//
//  Created by CK Lam on 26/4/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {


    
    @IBOutlet weak var tableView: UITableView!
    var userName: String = ""
    var userContent: String = ""
    
    var totalUserName = [String]()
    var totalUserContent = [String]()
    var totalMessageDate = [String]()
    
    var ref = Firebase(url:"https://cqdirectory.firebaseio.com/cqdirectory/friendList")
    
    

    @IBAction func submitContent(sender: AnyObject) {
        
        if userContentInput.text.isEmpty || userNameInput.text.isEmpty {
            
            userNameInput.attributedPlaceholder = NSAttributedString(string:"請輪入玩家ID",
                attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
            
            userContentInput.attributedPlaceholder = NSAttributedString(string:"請輪入代表角色 或 其他相關內容",
                attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
            
            
        } else {
       userContent = userContentInput.text
       userName = userNameInput.text
            var currentTime = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .ShortStyle) as String
        
       userNameInput.clearsContextBeforeDrawing = true
            userContentInput.clearsContextBeforeDrawing = true
        
            passMessageToFirebase(userName, content: userContent, date: currentTime)
        }
    }
    @IBOutlet weak var userNameInput: UITextField!
    @IBOutlet weak var userContentInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topBackground = UIImage(named: "topBg.png")
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "friendListBg.png")!)
        
        navigationController?.navigationBar.setBackgroundImage(topBackground, forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        
        navigationController?.navigationBar.topItem!.title = "戰友召集"
        
        
        userNameInput.attributedPlaceholder = NSAttributedString(string:"請輪入玩家ID",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        
        userContentInput.attributedPlaceholder = NSAttributedString(string:"請輪入代表角色 或 其他相關內容",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.userNameInput.delegate = self
        self.userContentInput.delegate = self
        
        // Retrieve new posts as they are added to Firebase
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            
            self.totalUserName.insert(snapshot.value.objectForKey("author") as! String, atIndex: 0)
            self.totalUserContent.insert(snapshot.value.objectForKey("title") as! String, atIndex: 0)
            self.totalMessageDate.insert(snapshot.value.objectForKey("date") as! String, atIndex: 0)
            //println("added -> \(snapshot.value)")
        })
        // snapshot.childrenCount will always equal count since snapshot.value will include every FEventTypeChildAdded event
        // triggered before this point.
        ref.observeEventType(.Value, withBlock: { snapshot in
            self.tableView.reloadData()
        })
        
        ref.observeEventType(.ChildChanged, withBlock: { snapshot in
            self.totalUserName.insert(snapshot.value.objectForKey("author") as! String, atIndex: 0)
            self.totalUserContent.insert(snapshot.value.objectForKey("title") as! String, atIndex: 0)
            self.totalMessageDate.insert(snapshot.value.objectForKey("date") as! String, atIndex: 0)
            self.tableView.reloadData()
        })
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalUserName.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as! FriendLstCell
        
        let row = indexPath.row
        
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "layout/rowBg.png")!)
        
        cell.friendTitle.text = totalUserName[indexPath.row]
        
        cell.friendContent.text = totalUserContent[indexPath.row]
        
        cell.addedDate.text = totalMessageDate[indexPath.row]
        
        
        
        //cell.ChrarcterImage.image = UIImage(named:characterImg[indexPath.row])
        
        //cell.Sample?.text = characterName[indexPath.row]
        
        /*cell.Lv4Pic.image = UIImage(named:characterGet4Img[indexPath.row])
        cell.Lv5Pic.image = UIImage(named:characterGet5Img[indexPath.row])
        cell.Lv6Pic.image = UIImage(named:characterGet6Img[indexPath.row])
        cell.JobImage.image = UIImage(named: characterJobImg[indexPath.row])
        
        
        cell.separatorInset = UIEdgeInsetsMake(0.0, cell.frame.size.width, 0.0, 0.0);
        */
        
        return cell
        
    }
    
    // resize header & footer section height
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.0;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0;
    }
    

    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.0;
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /*
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        self.view.endEditing(true)
        
        return true
        
    }

    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //userNameInput.resignFirstResponder()
        self.view.endEditing(false)

    }*/
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        self.view.endEditing(true)
        
        return true
    }
    
    
    
    
    func passMessageToFirebase(name : String, content: String, date: String){
        
        var post1 = ["author": name, "title": content, "date": date]
        var post1Ref = ref.childByAutoId()
        post1Ref.setValue(post1)
        
        
    }


}

