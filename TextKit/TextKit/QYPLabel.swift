//
//  QYPLabel.swift
//  TextKit
//
//  Created by 高级iOS开发 on 2017/10/24.
//  Copyright © 2017年 高级iOS开发. All rights reserved.
//

import UIKit
/*
 1.使用TextKit接管Label的底层 - '绘制' textStorage 的文本内容
 2.使用正则表达式过滤url,设置url的特性显示
 3.交互
 
 textStorage负责存储内容
 layoutManager负责绘制字形
 textContainer 绘制文本的区域大小
 
 -- UIlabel默认不能够实现垂直顶部对其,使用textKit能够实现
 -- 提示,
    在iOS7.0之前要实现类似的效果需要使用coreText 使用起来异常的繁琐
     - YYModel 的作者开发了一个框架YYText,自己建立类一套渲染系统
 */
class QYPLabel: UILabel {
    
    // MARK:- 重写属性 -进一步体会TextKit 接管底层的实现
    // - 一旦内容变化,需要让 textStorage 响应变化!
    override var text: String?{
        didSet{
            // 重新准备文本内容
            preparaTextContent()
        }
    }
    
    // MARK:-构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareTextSystem()
    }
    required init?(coder aDecoder: NSCoder) {
        /// 将原来的替换为下面的内容,不然使用xib或者sb的时候回奔溃
        super.init(coder: aDecoder)
        prepareTextSystem()
    }
    /// MARK:-交互
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 1.获取用户点击的位置
        guard let location = touches.first?.location(in: self) else{
            return
        }
        // 2.获取当前点钟字符的索引
        let idx = layoutManager.glyphIndex(for: location, in: textContainer)
        print("点我了\(idx)")
        // 3.判断idx是否在urls的ranges范围内,如果在,就高亮
        for r in urlRanges ?? [] {
            /// NSRange 跳入头文件课件次方法
            if NSLocationInRange(idx, r){
                print("需要高亮")
                // 修改文本的字体属性
                textStorage.addAttributes([.foregroundColor:UIColor.blue], range: r)
                // 如果需要重绘 ,需要调用一个函数,但不是drawRect
                setNeedsDisplay()
                
            }else{
                print("没")
            }
        }
    }
    
    
    /// 绘制背景和字体
    /*
     在iOS中绘制工作是类似优惠似的,后悔值得内容,会把之前的绘制内容覆盖掉
     尽量避免带透明度的颜色,会严重影响性能
     */
    override func drawText(in rect: CGRect) {
//        super.drawText(in: rect)
        
        let range = NSRange(location: 0, length: textStorage.length)
        /// 绘制背景
        layoutManager.drawBackground(forGlyphRange: range, at: CGPoint())
        // Glyphs字形 layoutManager负责绘制字形
        layoutManager.drawGlyphs(forGlyphRange: range, at: CGPoint())
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // 绘制文本的区域大小
        textContainer.size = bounds.size
    }
    // MARK:-TextKit的核心对象
    /// 属性文本存储
    private lazy var textStorage = NSTextStorage()
    /// 负责文本'字形'布局
    private lazy var layoutManager = NSLayoutManager()
    /// 设定文本绘制的范围
    private lazy var textContainer = NSTextContainer()
}
extension QYPLabel{
    /// 准备文本系统
    func prepareTextSystem() {
        // 0.开启用户交互
        isUserInteractionEnabled = true
        // 1.准备文本内容
        preparaTextContent()
        // 2.设置对象的关系
        textStorage.addLayoutManager(layoutManager)
        layoutManager.addTextContainer(textContainer)
    }
    /// 准备文本内容 - 使用textStorage接管label的内容   textStorage负责存储内容
    func preparaTextContent(){
        if let attributedText = attributedText {
            textStorage.setAttributedString(attributedText)
        }else if let text = text {
            textStorage.setAttributedString(NSAttributedString(string: text))
        }else{
            textStorage.setAttributedString(NSAttributedString(string: ""))
        }
        print(urlRanges)
        // 遍历范围数组 设置url文字的属性
        for r in urlRanges ?? [] {
            
            textStorage.addAttributes([.foregroundColor:UIColor.red,
                                       .backgroundColor:UIColor.init(white: 0.9, alpha: 1.0)],
                                      range: r)
        }
    }
}

// MARK: - 正则表达式函数
fileprivate extension QYPLabel{
    /// 返回textStorage中的url range数组
    var urlRanges:[NSRange]?{
        
        
        // 1.正则表达式 (匹配url的)
        let pattern = "[a-zA-Z]*://[a-zA-Z0-9/\\.]*"
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else{
            return nil
        }
        // 2.多重匹配
        let matches = regx.matches(in: textStorage.string, options: [], range: NSRange(location: 0, length: textStorage.length))
        
        // 3.遍历数组 生成range的数组
        var ranges = [NSRange]()
        for m in  matches{
            ranges.append(m.range(at: 0))
        }
        
        return ranges
    }
}
