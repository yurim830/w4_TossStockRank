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
    // 3 Layout : 셀을 어떻게 배치?   -> UICollectionViewDataSource UICollectionViewDelegateFlowLayout
    
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
    // collectionView를 통해 cell을 표현하려고 하는데,
    // indexPath번째에 있는 item을 어떻게 UICollectionViewCell 형태로 표현할 것인지 결정하는 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
            // CollectionView에 등록한 것 중 재사용 가능한 셀을 가져옴
            // as? 로 UICollectionViewCell 을 StockRankCollectionViewCell로 캐스팅 시키기
        }
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
    
    
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    // 셀 높이 정하기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
        // height => 80
        return CGSize(width: collectionView.bounds.width, height: 80)
    
    }
}
