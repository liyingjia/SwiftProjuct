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
        collection.register(HomeBaseCollectionViewCell.self, forCellWithReuseIdentifier: "HomeBaseCollectionViewCell")
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        
        let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 120, height: 180)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBaseCollectionViewCell", for: indexPath) as! HomeBaseCollectionViewCell
            
            return cell
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
