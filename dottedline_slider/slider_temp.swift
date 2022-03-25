import Foundation
import UIKit
import CoreGraphics

 @objc class DashedSlider: UISlider {
    
    let DEFAULT_MARKER_COUNT:Int = 25
    let DEFAULT_MARK_WIDTH:CGFloat = 4.0
    let DEFAULT_TOP_MARGIN:CGFloat = 3.0
    
    @objc public var selectedBarColor:UIColor! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @objc  public var unselectedBarColor:UIColor! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @objc public var markColor:UIColor! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @objc  public var handlerColor:UIColor? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // number of markers to draw
    // 1 to 100
      public var markerCount: Int! {
        didSet {
            self.setNeedsLayout()
        }
    }
     
     @objc public var _markerCount : NSNumber!{
         get {
             return markerCount as NSNumber?
         }
         set(newNumber) {
             markerCount = newNumber?.intValue
         }
     }
    
     public var markWidth:CGFloat! {
        didSet {
            self.setNeedsLayout()
        }
    }
     
     @objc public var _markWidth : NSNumber!{
         get {
             return markWidth as NSNumber?
         }
         set(newNumber) {
             markWidth = CGFloat (newNumber!.floatValue)
         }
     }
    
     public var topMargin:CGFloat! {
        didSet {
            self.setNeedsLayout()
        }
    }
     
     @objc public var _topMargin : NSNumber!{
         get {
             return topMargin as NSNumber?
         }
         set(newNumber) {
             topMargin = CGFloat (newNumber!.floatValue)
         }
     }
    
     public var handlerWidth:CGFloat? {
        didSet {
            self.setNeedsLayout()
        }
    }
     
     @objc public var _handlerWidth : NSNumber!{
         get {
             return handlerWidth as NSNumber?
         }
         set(newNumber) {
             handlerWidth = CGFloat (newNumber!.floatValue)
         }
     }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure(){
        
        if selectedBarColor == nil {
            selectedBarColor = UIColor.red
        }
        
        if unselectedBarColor == nil {
            unselectedBarColor = UIColor.lightGray
        }
        
        if markColor == nil {
            markColor = UIColor.white
        }
        
        if markWidth == nil {
            markWidth = DEFAULT_MARK_WIDTH
        }
        
        if topMargin == nil {
            topMargin = DEFAULT_TOP_MARGIN
        }
        
        if markerCount == nil {
            markerCount = DEFAULT_MARKER_COUNT
        }
        
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Create an innerRect to paint the lines
        let innerRect:CGRect = rect.insetBy(dx: 1.0, dy: 1.0)
        
        UIGraphicsBeginImageContextWithOptions(innerRect.size, false, 0)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        // Selected side
        context.setFillColor(self.selectedBarColor.cgColor);
        //  context.fill(CGRectMake(0, topMargin, innerRect.size.width, innerRect.size.height - topMargin*2.0))
        context.fill(CGRect(x: 0, y: topMargin, width: innerRect.size.width, height: innerRect.size.height - topMargin * 2.0))
        let selectedSide:UIImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero) ?? UIImage()
        
        // Unselected side
        context.setFillColor(self.unselectedBarColor.cgColor);
        context.fill(CGRect(x: 0, y: topMargin, width: innerRect.size.width, height: innerRect.size.height - (topMargin * 2.0)))
        let unselectedSide:UIImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero) ?? UIImage()
        
        // Set markers on selected side
        selectedSide.draw(at: CGPoint(x: 0, y: 0))
        
        // marker can not be less than 1
        if markerCount <= 0 {
            markerCount = DEFAULT_MARKER_COUNT
        }
        
        let spaceBetweenMarkers:CGFloat = 100.0 / CGFloat(markerCount)

        
        var i :CGFloat  = 0
        while i < 100 {
            i = i + spaceBetweenMarkers
            context.setLineWidth(self.markWidth);
            let position:CGFloat = i * innerRect.size.width / 100.0
            context.move(to: CGPoint(x: position, y: 0))
            context.addLine(to: CGPoint(x: position, y: innerRect.height))
            context.setStrokeColor(self.markColor.cgColor)
            context.strokePath();
        }
        
        
        let selectedStripSide:UIImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero) ?? UIImage()
        
        // Set markers on unselected side
        unselectedSide.draw(at: CGPoint(x: 0, y: 0))
        
        i = 0
        while i < 100 {
            i = i + spaceBetweenMarkers
            context.setLineWidth(self.markWidth);
            let position:CGFloat = i * innerRect.size.width / 100.0
            context.move(to: CGPoint(x: position, y: 0))
            context.addLine(to: CGPoint(x: position, y: innerRect.height))
            context.setStrokeColor(self.markColor.cgColor)
            context.strokePath();
        }
        
        let unselectedStripSide:UIImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero) ?? UIImage()
        
        UIGraphicsEndImageContext();
        
        self.setMinimumTrackImage(selectedStripSide, for:.normal)
        self.setMaximumTrackImage(unselectedStripSide, for: .normal)
        
        if let trackImageColor = handlerColor,
           let trackImageWidth = handlerWidth {
            let trackImage:UIImage = UIImage.imageWithColor(color: trackImageColor, cornerRadius: 0.0).imageWithMinimumSize(size: CGSize(width: trackImageWidth, height: innerRect.height))
            self.setThumbImage(trackImage, for: .normal)
            self.setThumbImage(trackImage, for:.highlighted)
            self.setThumbImage(trackImage, for: .selected)
        }
    }
    
}

extension UIImage {
    static func imageWithColor(color:UIColor,cornerRadius:CGFloat) -> UIImage {
        let minEdgeSize:CGFloat = cornerRadius * 2 + 1 // edge size from corner radius
        let rect:CGRect = CGRect(x: 0, y: 0, width: minEdgeSize, height: minEdgeSize);
        let roundedRect:UIBezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        roundedRect.lineWidth = 0;
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        roundedRect.fill()
        roundedRect.stroke()
        roundedRect.addClip()
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage();
        UIGraphicsEndImageContext();
        return image.resizableImage(withCapInsets: UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius))
    }
    
    func imageWithMinimumSize(size:CGSize) -> UIImage {
        let rect:CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height);
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width, height: size.height), false, 0.0)
        self.draw(in: rect)
        let resized:UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage();
        UIGraphicsEndImageContext();
        
        return resized.resizableImage(withCapInsets: UIEdgeInsets(top: size.height/2, left: size.width/2, bottom: size.height/2, right: size.width/2))
        
    }
}

