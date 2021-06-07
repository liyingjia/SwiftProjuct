//
//  SecondViewController.swift
//  SwiftTestDemo
//
//  Created by wangxiaodong on 2020/12/29.
//

import UIKit
import SDWebImage

class SecondViewController: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate,DelegateNames {
    
    

    fileprivate lazy var collection : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let titleBtn : UIButton = TitleButton()
    let param:TFPopupParam = TFPopupParam()
    let popView:HomePopView = HomePopView()
    let selectView:SelectSaleType = SelectSaleType()
    
    
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
        collection.isPagingEnabled = false
        collection.delegate = self
        collection.register(HomeBaseCollectionViewCell.self, forCellWithReuseIdentifier: "HomeBaseCollectionViewCell")
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        
        let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: (kScreenWidth/3-1), height: 140)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        popView.delegate = self
        //闭包回传值
        popView.setClickIndexItem { (Int) in
            self.titleBtn.isSelected = false
            self.popView.tf_hide()
        }
        
       LYLog(message: "helloWorld")
        
        setupNavigationBar()
        
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBaseCollectionViewCell", for: indexPath) as! HomeBaseCollectionViewCell
            cell.imageView.sd_setImage(with: URL(string: "https://sn-prod-file.oss-cn-beijing.aliyuncs.com/mchPhoto/shop_shop3.png"), placeholderImage: UIImage.init(named: "message_1"))
            
            return cell
        }
    //代理回传值
    func method(index: Int) {
        self.titleBtn.isSelected = false
        self.popView.tf_hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


// MARK:-扩展
extension SecondViewController{
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "favor")
        
        let rightBtn = UIButton()
        rightBtn.setImage(UIImage(named: "photo"), for: .normal)
        rightBtn.setImage(UIImage(named: "photo_1"), for: .highlighted)
        rightBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        rightBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        titleBtn.setTitle("coderwhy", for: .normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick(btn:)), for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
    }
    
     override func registerBtnClick(){
        print("registerBtnClick")
       
    }
    @objc func rightBtnClick(){
       print("rightBtnClick")
//        param.popupSize = CGSize.init(width: 247 * 0.5, height: 243 * 0.5)
        param.disuseShowPopupAlphaAnimation = true;
        param.disuseHidePopupAlphaAnimation = true;
        selectView.tf_showFold(self.view, targetFrame: CGRect.init(x: 0, y: kScreenHeight-450, width: kScreenWidth, height: 450), direction: .bottom, popupParam: param)
   }
    @objc private func titleBtnClick(btn:TitleButton){
        btn.isSelected = !btn.isSelected
        param.popupSize = CGSize.init(width: 247 * 0.5, height: 243 * 0.5)
        param.disuseShowPopupAlphaAnimation = true;
        param.disuseHidePopupAlphaAnimation = true;
        if !btn.isSelected {
            popView.tf_hide()
        }else{
            popView.tf_showBubble(self.view, basePoint: CGPoint(x: Int(kScreenWidth)/2, y: HYDevice_NaviBar_Height), bubble: .bottom, popupParam: param)
        }
        
        
       print("titleBtnClick")
   }
    
}
