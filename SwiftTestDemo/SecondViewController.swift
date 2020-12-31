//
//  SecondViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2020/12/29.
//

import UIKit


class SecondViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    

    fileprivate lazy var collection : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title                = "添加"
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(collection)
        collection.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view).offset(HYDevice_NaviBar_Height)
            make.bottom.equalTo(self.view).offset(-HYDevice_TabBar_Height)
        }
        collection.backgroundColor = UIColor.yellow
        collection.isPagingEnabled = true
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        
        let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
            let R = (arc4random()%256)
            let G = (arc4random()%256)
            let B = (arc4random()%256)
            cell.backgroundColor = UIColor(red: CGFloat(R)/256, green: CGFloat(G)/256, blue: CGFloat(B)/256, alpha: 1)
            return cell
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
