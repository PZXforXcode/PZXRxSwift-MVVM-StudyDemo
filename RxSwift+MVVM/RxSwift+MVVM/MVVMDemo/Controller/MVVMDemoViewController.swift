//
//  MVVMDemoViewController.swift
//  RxSwift+MVVM
//
//  Created by pzx on 2023/4/12.
//

import UIKit
import RxSwift
import RxCocoa

class MVVMDemoViewController: UIViewController, UIScrollViewDelegate {

    
    private let bag = DisposeBag()
    private let viewModel = ProductViewModel()

    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .cyan
        tableView.rx.setDelegate(self).disposed(by: bag)

        bindTableView()


    }
    
    private func bindTableView() {
        
        //先绑定数据
            viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "ProductTableViewCell", cellType: ProductTableViewCell.self)) { (row,item,cell) in
                cell.item = item
            }.disposed(by: bag)
            tableView.rx.modelSelected(Product.self).subscribe(onNext: { item in
                print("SelectedItem: \(item.name)")
            }).disposed(by: bag)
        
        //再请求数据
        viewModel.fetchProductList()
        
        //提前请求数据没用！

        }
    
    //MARK: – UI
    /// subviews

    //MARK: – request
    /// 获取服务数据

    //MARK: – 填充数据
    /// 填充数据

    //MARK: – 点击事件

    //MARK: – Public Method
    /// 共有方法
    
    //MARK: – Private Method
    /// 私有方法



}
