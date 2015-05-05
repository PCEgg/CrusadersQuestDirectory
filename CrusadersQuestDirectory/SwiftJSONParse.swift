import Foundation


var arrStore: AnyObject = []
var characterId: [String] = []
var characterImg: [String] = []
var characterGet4Img: [String] = []
var characterGet5Img: [String] = []
var characterGet6Img: [String] = []
var characterJobImg: [String] = []
//var characterImg: [[String]] = []
var characterName: [String] = []


func jsonResponseList(){
    let path = NSBundle.mainBundle().pathForResource( "characters", ofType: "json" )
    if( path != nil ) {
        let jsonData = NSData(contentsOfFile: path!, options: .DataReadingMappedIfSafe, error: nil )
        if( jsonData != nil ) {
            let jsonObject: AnyObject! = NSJSONSerialization.JSONObjectWithData( jsonData!, options: NSJSONReadingOptions.MutableContainers, error: nil)
            
            if let wholeCharacterDetail = jsonObject as? NSArray{
                
                
                arrStore = wholeCharacterDetail
                
                //println(arr)
                
                var showHowManyItems = wholeCharacterDetail.count
                for(var i = 0; i < showHowManyItems; i++){
                    if let characterDetail = wholeCharacterDetail[i] as? NSDictionary{
                        
                        
                        let getCharacterName : AnyObject? = characterDetail["name"]
                        let getCharacterId : AnyObject? = characterDetail["id"]
                        let getCharacterImg : AnyObject? = characterDetail["icon"]
                        let getCharacterJobImg : AnyObject? = characterDetail["job"]
                        
                        if let getWholeCharacterSmallImg = getCharacterImg as? NSArray {
                            for(var i = 0; i < getWholeCharacterSmallImg.count; i++){
                                if let getThisImg = getWholeCharacterSmallImg[i] as? NSDictionary{
                                    let thisImg : AnyObject? = getThisImg["lv4"]
                                    let this4lvImg : AnyObject? = getThisImg["lv4"]
                                    let this5lvImg : AnyObject? = getThisImg["lv5"]
                                    let this6lvImg : AnyObject? = getThisImg["lv6"]
                                    characterImg.append(thisImg as! String)
                                    characterGet4Img.append(this4lvImg as! String)
                                    characterGet5Img.append(this5lvImg as! String)
                                    characterGet6Img.append(this6lvImg as! String)
                                }
                            }
                        }
                        
                        
                        characterName.append(getCharacterName as! String)
                        characterId.append(getCharacterId as! String)
                        characterJobImg.append(getCharacterJobImg as! String)
                        
                        
                        
                    }
                }
            }
        }
    }
    
}