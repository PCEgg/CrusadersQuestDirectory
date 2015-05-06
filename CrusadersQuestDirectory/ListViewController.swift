//
//  FirstViewController.swift
//  CrusadersQuestDirectory
//
//  Created by CK Lam on 26/4/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//

import UIKit

var selectedCharacter: String = ""


class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableListCharacter: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        jsonResponseList()
        
        let topBackground = UIImage(named: "topBg.png")
        
        navigationController?.navigationBar.setBackgroundImage(topBackground, forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        
        navigationController?.navigationBar.topItem!.title = "角色圖鑑"
        
        tabBarController?.tabBar.backgroundImage = UIImage(named: "layout/bottomBg.png")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterId.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as! CharacterListCell
        
        let row = indexPath.row

        cell.backgroundColor = UIColor(patternImage: UIImage(named: "layout/rowBg.png")!)
        
        
        //cell.ChrarcterImage.image = UIImage(named:characterImg[indexPath.row])
        
        //cell.Sample?.text = characterName[indexPath.row]
        
        cell.Lv4Pic.image = UIImage(named:characterGet4Img[indexPath.row])
        cell.Lv5Pic.image = UIImage(named:characterGet5Img[indexPath.row])
        cell.Lv6Pic.image = UIImage(named:characterGet6Img[indexPath.row])
        cell.JobImage.image = UIImage(named: characterJobImg[indexPath.row])
        
        
        //cell.separatorInset = UIEdgeInsetsMake(0.0, cell.frame.size.width, 0.0, 0.0);
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let selectedCell = indexPath.row
        
        //performSegueWithIdentifier("CharacterDetailPass", sender: selectedCell)
        
        
    }
    
    
    // resize header & footer section height
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.0;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0;
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.0;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CharacterDetailPass" {
            let svc = segue.destinationViewController as! CharacterDetailViewController
            
            let indexPath : NSIndexPath = self.tableListCharacter.indexPathForSelectedRow()!
            
            
            svc.selectedCharacterID = characterId[indexPath.row]
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }

}

