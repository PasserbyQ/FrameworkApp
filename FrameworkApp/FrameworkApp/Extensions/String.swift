//
//  String.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import CommonCrypto

extension String {
    
    /**
     * md5加密
     */
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /**
     * NSRange转换为range
     */
    func toRange(_ range: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
        guard let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
        guard let from = String.Index(from16, within: self) else { return nil }
        guard let to = String.Index(to16, within: self) else { return nil }
        return from ..< to
    }
    
    /**
     * range转换为NSRange
     */
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    /**
     * 是否为纯数字
     */
    func isPureInt() -> Bool {
        let scan = Scanner.init(string: self)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
    
    /**************************截取字符串***********************/
    
    func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
        
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
        
        if let start = from, let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
        
        let startIndex: String.Index
        if let start = from, start >= 0 {
            startIndex = self.index(self.startIndex, offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
        
        let endIndex: String.Index
        if let end = to, end >= 0, end < self.count {
            endIndex = self.index(self.startIndex, offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
        
        return String(self[startIndex ..< endIndex])
    }
    
    func substring(from: Int) -> String {
        return self.substring(from: from, to: nil)
    }
    
    func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    
    func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        
        let end: Int
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        
        return self.substring(from: from, to: end)
    }
    
    func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else {
            return ""
        }
        
        let start: Int
        if let end = to, end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
        
        return self.substring(from: start, to: to)
    }
    
    
    
    /******************************计算字符串****************************/
    
    // 计算文字宽度
    func calcuateLabSizeWidth(str : String, font : UIFont, maxHeight : CGFloat) -> CGFloat{
        let attributes = [kCTFontAttributeName: font]
        let norStr = NSString(string: str)
        let size = norStr.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: maxHeight), options: .usesLineFragmentOrigin, attributes: attributes as [NSAttributedString.Key : Any], context: nil)
        return size.width
    }
    
    // 计算文字高度
    func getLabAttr(str : String, font : UIFont = UIFont.systemFont(ofSize: 14), attribute : [NSAttributedString.Key : Any] = [:]) -> NSMutableAttributedString {
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        
        let attributes = [NSAttributedString.Key.font: font,NSAttributedString.Key.paragraphStyle:style]
        let attr = NSMutableAttributedString(string: str)
        attr.addAttributes(attributes, range: NSMakeRange(0, str.count))
        attr.addAttributes(attribute, range: NSMakeRange(0, str.count))
        return attr
    }
    
    /**
     * 是否包含
     */
    func isContain(str:String) ->Bool{
        let predicate = NSPredicate(format: "SELF CONTAINS %@",str)
        if predicate.evaluate(with: self) {
            return true
        }
        return false
    }
    
}
