//
//  ProductTableViewCell.swift
//  RxSwift+MVVM
//
//  Created by pzx on 2023/4/12.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    var item: Product! {
        didSet {
            // 在didSet中处理属性变化的逻辑
            print("item updated: \(String(describing: item))")
            
            nameLabel.text = item.name
            priceLabel.text = item.price
            
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
