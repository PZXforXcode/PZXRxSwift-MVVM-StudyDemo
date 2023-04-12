//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by pzx on 2023/4/11.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    let disposeBag = DisposeBag()
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var testView: UIView!
    
    @IBOutlet weak var mvvmDemo: UIButton!
    @IBOutlet weak var textField: UITextField!
    //    let image:Observable<UIImage>  =
    var image: Observable<UIImage> = Observable<UIImage>.create { observer in
            let image = UIImage(named: "zhuanpanjieguo-2")
            observer.onNext(image!)
            observer.onCompleted()
            return Disposables.create()
        }
    
    var usernameValid = false
//    public var isHidden: Binder<Bool> {
//          return Binder(self) { view, hidden in
//              view.isHidden = hidden
//          }
//      }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        image.bind(to: imageView.rx.image).disposed(by: disposeBag)

        // Do any additional setup after loading the view.
        
        //筛选代码
        let arr = ["1","2"]
      let arrf =  arr.filter{
            str in str == "1"
        }
        print(arrf)
        
        button.rx.tap
            .subscribe(onNext: {
                print("button Tapped")
                
                let vc = TestTableViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
                
                
            })
            .disposed(by: disposeBag)
        
        mvvmDemo.rx.tap
            .subscribe(onNext: {
                print("button Tapped")
                
                let vc = UIStoryboard.init(name: "MVVMDemoViewController", bundle: nil).instantiateViewController(withIdentifier: "MVVMDemoViewController") as! MVVMDemoViewController
                self.navigationController?.pushViewController(vc, animated: true)
                
            })
            .disposed(by: disposeBag)
        
        
        // 用RxSwift来给textField设置内容
                Observable.just("Hello RxSwift")
                    .subscribe(textField.rx.text)
                    .disposed(by: disposeBag)
        
        textField.rx.text
                .subscribe(onNext: { element in
                    print("textField的内容改变了：\(element)")
                })
                .disposed(by: disposeBag)

       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch-")

//        image = Observable.just(UIImage(named: "zhuanpanjieguo")!)
//        image.bind(to: imageView.rx.image).disposed(by: disposeBag)
        
//        self.testView.backgroundColor = UIColor.red
        
        
//        Observable.just(0.618)
//                    .bind(to: testView.rx.alpha)
//                    .disposed(by: disposeBag)
        
//        Observable.just(true)
//                    .bind(to: testView.rx.isHidden)
//                    .disposed(by: disposeBag)
        
//        Observable.just(false)
//                    .bind(to: testView.rx.isUserInteractionEnabled)
//                    .disposed(by: disposeBag)
        
        let observable = Observable.just(UIColor.red)
        let binder = testView.rx.backgroundColor
        observable.bind(to: binder).disposed(by: disposeBag)

    }


}

