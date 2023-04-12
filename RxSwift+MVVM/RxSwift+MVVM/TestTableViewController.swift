import UIKit
import RxSwift
import RxCocoa

class TestTableViewController: UIViewController {
    let bag = DisposeBag()
    
    // tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = UIColor.clear
        return tableView
    }()
    
    // tableView要显示的数据
    //
    // 不要定义成普通数组，要定义成Observable，让它发出的事件里挂数组，这样才能让tableView监听，达到数据驱动UI的效果
    var dataArray = Observable.just([
        "张一",
        "张二",
        "张三",
    ])

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        _addViews()
        _layoutViews()
        _setupRxSwift()
    }
}


// MARK: - setupRxSwift

extension TestTableViewController {
    private func _setupRxSwift() {
        // 让tableView.rx.items属性监听数据就可以了，就这么简单，搞定
        //
        // dataArray是个Observable

        dataArray
            .bind(to: tableView.rx.items) {
                tableView, indexPathRow, data in
                var cell = tableView.dequeueReusableCell(withIdentifier: "reuseId")
                if cell == nil {
                    cell = UITableViewCell(style: .default, reuseIdentifier: "reuseId")
                }
                
                cell?.textLabel?.text = data
                
                return cell!
            }
            .disposed(by: bag)
        
        
        // tableView.rx.items是个Observer（本质就是对cellForRowAtIndexPath:代理方法的封装）
        dataArray = Observable.just([
            "张一",
            "张二",
            "张三",
            "张四",

        ])
    }
}




// MARK: - addViews, layoutViews

extension TestTableViewController {
    private func _addViews() {
        view.addSubview(tableView)
    }
    
    private func _layoutViews() {
        tableView.frame = view.bounds
    }
}


