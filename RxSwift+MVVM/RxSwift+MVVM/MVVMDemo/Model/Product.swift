//
//  Product.swift
//  RxSwift+MVVM
//
//  Created by pzx on 2023/4/12.
//

import UIKit

class Product: Codable {
    
        let imgName: String // 图
        let name: String// 称号
        let price: String// 价格
    
    init(imgName: String, name: String, price: String) {
        self.imgName = imgName
        self.name = name
        self.price = price
    }

}
