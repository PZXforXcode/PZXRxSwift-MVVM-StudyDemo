//
//  File.swift
//  RxSwift+MVVM
//
//  Created by pzx on 2023/4/12.
//

import Foundation
import RxCocoa
import RxSwift

class ProductViewModel {
    let items = PublishSubject<[Product]>()
    func fetchProductList() {
            // 在这里能够做网络恳求
            //...
            //...
        
        
            // 我们就直接用假数据
            let productArray = [
                Product(imgName: "mac", name: "MacBook", price: "100"),
                Product(imgName: "iphone", name: "iPhone Xs", price: "100"),
                Product(imgName: "watch", name: "iWatch", price: "100"),
                Product(imgName: "ipad", name: "iPad", price: "100"),
                Product(imgName: "iphone", name: "iPhone X", price: "100")
            ]
        
        items.onNext(productArray)
        items.onCompleted()
    }
}
