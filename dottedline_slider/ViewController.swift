//
//  ViewController.swift
//  dottedline_slider
//
//  Created by   Валерий Мельников on 25.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: DashedSlider!
    
    @IBOutlet weak var slider2: DashedSlider!
    
    @IBOutlet weak var slider3: DashedSlider!
    
    @IBOutlet weak var slider4: DashedSlider!
    
    @IBOutlet weak var slider5: DashedSlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.selectedBarColor = UIColor.flatBelizeHoleColor()
        slider.unselectedBarColor = UIColor.flatCloudsColor()
        slider.markWidth = 3.0
        slider.handlerColor = UIColor.flatMidnightBlueColor()
        slider.handlerWidth = 8.0
        
        slider2.selectedBarColor = UIColor.flatWetAsphaltColor()
        slider2.unselectedBarColor = UIColor.flatGreenSeaColor()
        slider2.markWidth = 6.0
        slider2.topMargin = 4.0
        slider2.handlerColor = UIColor.flatPomergranateColor()
        slider2.handlerWidth = 16.0

        slider3.selectedBarColor = UIColor.flatPomergranateColor()
        slider3.unselectedBarColor = UIColor.flatAsbestosColor()
        slider3.markWidth = 1.0
        slider3.topMargin = 0.0
        slider3.handlerColor = UIColor.flatSunflowerColor()
        slider3.handlerWidth = 12.0
              
        slider4.selectedBarColor = UIColor.flatTurquoiseColor()
        slider4.unselectedBarColor = UIColor.flatNephritisColor()
        slider4.markerCount = 20
        slider4.topMargin = 4.0
        slider4.handlerColor = UIColor.flatPumpkinColor()
        slider4.handlerWidth = 12.0
              
        slider5.selectedBarColor = UIColor.flatSunflowerColor()
        slider5.unselectedBarColor = UIColor.flatPumpkinColor()
        slider5.markerCount = 50
        slider5.topMargin = 6.0
        slider5.handlerColor = UIColor.flatWetAsphaltColor()
        slider5.handlerWidth = 8.0
        
        // Do any additional setup after loading the view.
    }


}

extension UIColor {
    
    class func flatTurquoiseColor()->UIColor {
        return UIColor(red: 26/255.0, green: 188/255.0, blue: 156/255.0, alpha: 1.0)
    }
    
    class func flatGreenSeaColor()->UIColor {
        return UIColor(red: 22/255.0, green: 160/255.0, blue: 133/255.0, alpha: 1.0)
    }
    
    class func flatEmeraldColor()->UIColor {
        return UIColor(red: 46/255.0, green: 204/255.0, blue: 113/255.0, alpha: 1.0)
    }
    
    class func flatNephritisColor()->UIColor {
        return UIColor(red: 39/255.0, green: 174/255.0, blue: 96/255.0, alpha: 1.0)
    }
    
    class func flatPeterRiverColor()->UIColor {
        return UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1.0)
    }
    
    class func flatBelizeHoleColor()->UIColor {
        return UIColor(red: 41/255.0, green: 128/255.0, blue: 185/255.0, alpha: 1.0)
    }
    
    class func flatAmethystColor()->UIColor {
        return UIColor(red: 155/255.0, green: 89/255.0, blue: 182/255.0, alpha: 1.0)
    }
    
    class func flatWisteriaColor()->UIColor {
        return UIColor(red: 142/255.0, green: 68/255.0, blue: 173/255.0, alpha: 1.0)
    }
    
    class func flatWetAsphaltColor() -> UIColor {
        return UIColor(red: 52/255.0, green: 73/255.0, blue: 94/255.0, alpha: 1.0)
    }
    
    class func flatMidnightBlueColor() -> UIColor {
        return UIColor(red: 44/255.0, green: 62/255.0, blue: 80/255.0, alpha: 1.0)
    }
    
    class func flatSunflowerColor()->UIColor {
        return UIColor(red: 241/255.0, green: 196/255.0, blue: 15/255.0, alpha: 1.0)
    }
    
    class func flatCarrotColor()->UIColor {
        return UIColor(red: 230/255.0, green: 126/255.0, blue: 34/255.0, alpha: 1.0)
    }
    
    class func flatPumpkinColor()->UIColor {
        return UIColor(red: 211/255.0, green: 84/255.0, blue: 0/255.0, alpha: 1.0)
    }
    
    class func flatAlizarinColor()->UIColor {
        return UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0)
    }
    
    class func flatPomergranateColor() -> UIColor {
        return UIColor(red: 192/255.0, green: 57/255.0, blue: 43/255.0, alpha: 1.0)
    }
    
    class func flatCloudsColor() -> UIColor {
        return UIColor(red: 236/255.0, green: 250/255.0, blue: 241/255.0, alpha: 1.0)
    }
    
    class func flatSilverColor()->UIColor {
        return UIColor(red: 189/255.0, green: 195/255.0, blue: 199/255.0, alpha: 1.0)
    }
    
    class func flatConcreteColor()->UIColor {
        return UIColor(red: 149/255.0, green: 165/255.0, blue: 166/255.0, alpha: 1.0)
    }
    
    class func flatAsbestosColor()->UIColor {
        return UIColor(red: 127/255.0, green: 140/255.0, blue: 141/255.0, alpha: 1.0)
    }
}
