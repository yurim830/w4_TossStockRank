//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 유림 on 3/22/24.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    /* Todo
     - UIComponent 연결
     - UIComponent에 데이터를 업데이트 하는 코드 넣기*/
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = "\(stock.name)"
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price))"
        diffLabel.text = "\(stock.diff)"
        
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        //numberFormatter.maximumFractionDigits = 0  // default == 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}
