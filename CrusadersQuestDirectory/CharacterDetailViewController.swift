//
//  CharacterDetailViewController.swift
//  CrusadersQuestDirectory
//
//  Created by CK Lam on 30/4/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var CharacterImg: UIImageView!

    @IBOutlet weak var CharacterJobTag: UIImageView!
    var selectedCharacterID : String = ""
    var showCharacterDetailInfo = [String: String]()
    
    
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

    @IBOutlet weak var CharacterSkill: UILabel!
    @IBOutlet weak var CharacterSkillIcon: UIImageView!
    @IBOutlet weak var CharacterBackground: UITextView!
    @IBOutlet weak var CharacterActiveEffect: UITextView!
    @IBOutlet weak var CharacterPassiveEffect: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let passIdToQueryData = selectedCharacterID.toInt()!
        
        QueryDetailDataFromJsonResponseList(passIdToQueryData)
        
        showCharacterDetailInfo = characterDetailInfo
        
        // Do any additional setup after loading the view.
        
        CharacterImg.image = UIImage(named: characterDetailInfo["bigIcon"]!)
        CharacterJobTag.image = UIImage(named: characterDetailInfo["job"]!)
        
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
        CharacterResPlus.text = characterDetailInfo["maxResistance"]
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
