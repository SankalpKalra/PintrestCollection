//
//  ViewController.swift
//  PintrestCollection
//
//  Created by Appinventiv on 07/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? CustomLayout {
            layout.delegate = self
        }
        
        collectionView.delegate=self
        collectionView.dataSource=self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController :UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCellClass
        cell.customImage.image=UIImage(named:imageArray[indexPath.row] + ".jpeg")
        return cell
    }
}
extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        if UIImage(named:imageArray[indexPath.item])!.size.height > 400
        {
            return 400
        }
        else
        {
        return UIImage(named:imageArray[indexPath.item])!.size.height
        }
    }
}

