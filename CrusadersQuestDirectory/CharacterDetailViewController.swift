//
//  CharacterDetailViewController.swift
//  CrusadersQuestDirectory
//
//  Created by CK Lam on 30/4/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var CharacterImg: UIImageView!
    
    @IBOutlet weak var InfoTable: UIView!
    @IBOutlet weak var CharacterJobTag: UIImageView!
    var selectedCharacterID : String = ""
    var showCharacterDetailInfo = [String: String]()
    var currentCellNumber: Int = 1
    
    
    /*
    @IBOutlet weak var CharacterHp: UILabel!
    @IBOutlet weak var CharacterHpMax: UILabel!
    @IBOutlet weak var CharacterHpPlus: UILabel!
    
    @IBOutlet weak var CharacterAtk: UILabel!
    @IBOutlet weak var CharacterAtkMax: UILabel!
    @IBOutlet weak var CharacterAtkPlus: UILabel!
    @IBOutlet weak var CharacterCri: UILabel!
    @IBOutlet weak var CharacterAmor: UILabel!
    @IBOutlet weak var CharacterAmorMax: UILabel!
    @IBOutlet weak var CharacterAmorPlus: UILabel!
    @IBOutlet weak var CharacterRes: UILabel!
    @IBOutlet weak var CharacterResMax: UILabel!
    @IBOutlet weak var CharacterResPlus: UILabel!
    */
    @IBOutlet weak var CharacterSkill: UILabel!
    @IBOutlet weak var CharacterSkillIcon: UIImageView!
    @IBOutlet weak var CharacterBackground: UITextView!
    @IBOutlet weak var CharacterActiveEffect: UITextView!
    @IBOutlet weak var CharacterPassiveEffect: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "backBtn.png") as UIImage!
        var btnBack:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        btnBack.addTarget(self, action: "goBackView", forControlEvents: UIControlEvents.TouchUpInside)
        btnBack.setImage(image, forState: UIControlState.Normal)
        btnBack.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btnBack.sizeToFit()
        var myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: btnBack)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backBtn.png"), style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        
        let passIdToQueryData = selectedCharacterID.toInt()! - 1
        
        QueryDetailDataFromJsonResponseList(passIdToQueryData)
        
        showCharacterDetailInfo = characterDetailInfo
        
        //InfoTable.backgroundColor = UIColor(patternImage: UIImage(named: "InfoTable.png")!)
        
        InfoTable.layer.zPosition = 0;
        
        
        self.navigationItem.title = characterDetailInfo["name"]
        
        // Do any additional setup after loading the view.
        
        CharacterImg.image = UIImage(named: characterDetailInfo["bigIcon"]!)
        CharacterJobTag.image = UIImage(named: characterDetailInfo["job"]!)
       /*
        CharacterHp.text = characterDetailInfo["hp"]
        CharacterHpMax.text = characterDetailInfo["maxHp"]
        CharacterHpPlus.text = characterDetailInfo["hp"]
        
        CharacterAtk.text = characterDetailInfo["atk"]
        CharacterAtkMax.text = characterDetailInfo["maxAtk"]
        CharacterAtkPlus.text = characterDetailInfo["atk"]
        
        CharacterCri.text = characterDetailInfo["maxCritChance"]
        
        CharacterAmor.text = characterDetailInfo["armor"]
        CharacterAmorMax.text = characterDetailInfo["maxArmor"]
        CharacterAmorPlus.text = characterDetailInfo["maxArmor"]
        
        CharacterRes.text = characterDetailInfo["resistance"]
        CharacterResMax.text = characterDetailInfo["maxResistance"]
        CharacterResPlus.text = characterDetailInfo["maxResistance"]*/
        
        CharacterBackground.text = characterDetailInfo["background"]
        CharacterBackground.contentSize.height = 40.0
        CharacterSkillIcon.image = UIImage(named: characterDetailInfo["skillIcon"]!)
        
        CharacterSkill.text = characterDetailInfo["skillName"]
        
        CharacterActiveEffect.text = characterDetailInfo["activeEffect"]
        
        CharacterPassiveEffect.text = characterDetailInfo["passiveEffect"]
        
        
        
        
        // start print content
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBackView(){
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CharacterInfoCell", forIndexPath: indexPath) as! CharacterInfoTableViewCell
        
        let row = indexPath.row
        
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "layout/rowBg.png")!)
        

        
        if(currentCellNumber == 1){
            cell.InfoTitle.text = "血量"
            cell.InfoContent.text = characterDetailInfo["maxHp"]
            
        } else if(currentCellNumber == 2){
            cell.InfoTitle.text = "攻擊"
            cell.InfoContent.text = characterDetailInfo["maxAtk"]
        } else if(currentCellNumber == 3){
            cell.InfoTitle.text = "爆擊"
            cell.InfoContent.text = characterDetailInfo["maxCritChance"]
        } else if(currentCellNumber == 4){
            cell.InfoTitle.text = "物防"
            cell.InfoContent.text = characterDetailInfo["maxArmor"]
        } else if(currentCellNumber == 5){
            cell.InfoTitle.text = "魔防"
            cell.InfoContent.text = characterDetailInfo["maxResistance"]
            
        }
        
        currentCellNumber++
        
        
        
        return cell
        
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
