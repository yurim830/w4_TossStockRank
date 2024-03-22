//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 유림 on 3/22/24.
//

import UIKit

class StockRankViewController: UIViewController {
    
    let stockList: [StockModel] = StockModel.list
    @IBOutlet weak var collectionView: UICollectionView!
    
    // UICollectionView 구현 시 알아야 할 것
    // 1. Data : 어떤 데이터?               -> stockList
    // 2. Presentation : 셀을 어떻게 표현?
    // 3 Layout : 셀을 어떻게 배치?
    
    // protocol - 규칙이 있음. dataSource, delegate는 모두 프로토콜.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self   // 어떤 데이터를 어떻게 표현? self가 알려줄거야!
        collectionView.delegate = self     // layout 설정 - self가 알려줄거야!
        
    }
}


// dataSource와 delegate의 프로토콜을 준수하기 위해 extension 코드 작성
extension StockRankViewController: UICollectionViewDataSource {
    // [필수] 한 섹션에 아이템 몇 개 넣을지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    // [필수] 셀을 어떻게 표현할지 정하는 함수
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    
}
