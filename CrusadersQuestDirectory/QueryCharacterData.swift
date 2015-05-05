//
//  QueryCharacterData.swift
//  CQTool
//
//  Created by CK Lam on 9/4/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//
// Get character detail from json
import Foundation

var arrDetailStore: AnyObject = []
var characterDetailId: String = ""
var characterDetailName: String = ""
var characterDetailBackground: String = ""
var characterDetailJob: String = ""
var characterDetailSkill = [String: String]()
var characterDetailActiveEffect: String = ""
var characterDetailPassiveEffect: String = ""
var characterDetailHowToAcquire: String = ""
var notes: String = ""
var characterDetailInfo = [String: String]()


func QueryDetailDataFromJsonResponseList(selectedCharacter : Int){
    let path = NSBundle.mainBundle().pathForResource( "characters", ofType: "json" )
    if( path != nil ) {
        let jsonData = NSData(contentsOfFile: path!, options: .DataReadingMappedIfSafe, error: nil )
        if( jsonData != nil ) {
            let jsonObject: AnyObject! = NSJSONSerialization.JSONObjectWithData( jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil)
            
            if let wholeCharacterDetail = jsonObject as? NSArray{
                
                //println(wholeCharacterDetail[selectedCharacter])
                
                
                arrStore = wholeCharacterDetail
                
                if let characterDetail = wholeCharacterDetail[selectedCharacter] as? NSDictionary{
                    
                    characterDetailId = characterDetail["id"] as! String
                    characterDetailName = characterDetail["name"] as! String
                    characterDetailBackground = characterDetail["background"] as! String
                    characterDetailJob = characterDetail["job"] as! String
                    let getCharacterSkill : AnyObject? = characterDetail["skill"]
                    characterDetailActiveEffect = characterDetail["activeEffect"] as! String
                    characterDetailPassiveEffect = characterDetail["passiveEffect"] as! String
                    characterDetailHowToAcquire = characterDetail["howToAcquire"] as! String
                    notes = characterDetail["notes"] as! String
                    let getCharacterStats : AnyObject? = characterDetail["stats"]
                    let getCharacterMaxStats : AnyObject? = characterDetail["maxStats"]
                    let getCharacterPromotes : AnyObject? = characterDetail["promotes"]
                    let getCharacterIcons : AnyObject? = characterDetail["icon"]
                    
                    characterDetailInfo = [
                        "id" : characterDetailId,
                        "name" : characterDetailName,
                        "background" : characterDetailBackground,
                        "job" : characterDetailJob,
                        "activeEffect" : characterDetailActiveEffect,
                        "passiveEffect" : characterDetailPassiveEffect,
                        "howToAcquire" : characterDetailHowToAcquire,
                        "notes" : notes
                    ]
                    
                    
                    if let getWholeCharacterIcons = getCharacterIcons as? NSArray {
                        for(var i = 0; i < getWholeCharacterIcons.count; i++){
                            if let getThisIcons = getWholeCharacterIcons[i] as? NSDictionary{
                                let thisSmallIcon = getThisIcons["small"] as! String
                                let thisBigIcon = getThisIcons["big"] as! String
                                let thisOtherIcon = getThisIcons["other"] as! String
                                //println(thisSkillName)
                                characterDetailInfo["smallIcon"] = thisSmallIcon
                                characterDetailInfo["bigIcon"] = thisBigIcon
                                characterDetailInfo["otherIcon"] = thisOtherIcon
                                
                                
                                //println(maxStats)
                            }
                        }
                    }
                    
                    if let getWholeCharacterPromotes = getCharacterPromotes as? NSArray {
                        for(var i = 0; i < getWholeCharacterPromotes.count; i++){
                            if let getThisPromotes = getWholeCharacterPromotes[i] as? NSDictionary{
                                let thisTo = getThisPromotes["to"] as! String
                                let thisFrom = getThisPromotes["from"] as! String
                                //println(thisSkillName)
                                characterDetailInfo["to"] = thisTo
                                characterDetailInfo["from"] = thisFrom
                                
                                
                                //println(maxStats)
                            }
                        }
                    }
                    
                    
                    if let getWholeCharacterMaxStats = getCharacterMaxStats as? NSArray {
                        for(var i = 0; i < getWholeCharacterMaxStats.count; i++){
                            if let getThisStats = getWholeCharacterMaxStats[i] as? NSDictionary{
                                let thisAtk = getThisStats["atk"] as! String
                                let thisHp = getThisStats["hp"] as! String
                                let thisCritChance = getThisStats["critChance"] as! String
                                let thisArmor = getThisStats["armor"] as! String
                                let thisResistance = getThisStats["resistance"] as! String
                                characterDetailInfo["maxAtk"] = thisAtk
                                characterDetailInfo["maxHp"] = thisHp
                                characterDetailInfo["maxCritChance"] = thisCritChance
                                characterDetailInfo["maxArmor"] = thisArmor
                                characterDetailInfo["maxResistance"] = thisResistance
                                
                                //println(stats)
                            }
                        }
                    }
                    
                    
                    if let getWholeCharacterStats = getCharacterStats as? NSArray {
                        for(var i = 0; i < getWholeCharacterStats.count; i++){
                            if let getThisStats = getWholeCharacterStats[i] as? NSDictionary{
                                let thisAtk = getThisStats["atk"] as! String
                                let thisHp = getThisStats["hp"] as! String
                                let thisCritChance = getThisStats["critChance"] as! String
                                let thisArmor = getThisStats["armor"] as! String
                                let thisResistance = getThisStats["resistance"] as! String
                                characterDetailInfo["atk"] = thisAtk
                                characterDetailInfo["hp"] = thisHp
                                characterDetailInfo["critChance"] = thisCritChance
                                characterDetailInfo["armor"] = thisArmor
                                characterDetailInfo["resistance"] = thisResistance
                                
                                //println(stats)
                            }
                        }
                    }
                    
                    
                    if let getWholeCharacterSkill = getCharacterSkill as? NSArray {
                        for(var i = 0; i < getWholeCharacterSkill.count; i++){
                            if let getThisSkill = getWholeCharacterSkill[i] as? NSDictionary{
                                let thisSkillName = getThisSkill["name"] as! String
                                let thisSkillIcon = getThisSkill["icon"] as! String
                                //println(thisSkillName)
                                characterDetailInfo["skillName"] = thisSkillName
                                characterDetailInfo["skillIcon"] = thisSkillIcon
                                
                                //println(characterDetailSkill)
                            }
                        }
                    }
                    
                    
                    
                    //characterDetailId = getCharacterId
                    //characterDetailName = getCharacterName
                    
                    
                }
            }
        }
    }
}