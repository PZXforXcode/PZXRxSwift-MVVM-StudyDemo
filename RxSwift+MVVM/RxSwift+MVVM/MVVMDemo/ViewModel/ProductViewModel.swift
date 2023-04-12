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
        //不加这句 加了 就不能刷新了
        //items.onCompleted()
        /**
         items.onCompleted() 用于向观察者发送“完成”事件，表示该序列不会再发出新的元素了。如果你调用了 items.onCompleted()，那么后续的订阅者将无法再接收到该序列的任何元素。

         如果你需要刷新数据，请直接修改绑定到 collectionView.rx.items 的数据源 viewModel.items。因为这个绑定会自动地监听 viewModel.items 的变化并刷新界面。所以在修改了数据源之后，界面就会自动地更新。

         如果你修改了 viewModel.items 的数据之后，界面没有刷新，可能是数据源和界面之间的绑定没有建立好，或者是 viewModel.items 的数据源并没有真正地发生变化。
         **/
    }
}
