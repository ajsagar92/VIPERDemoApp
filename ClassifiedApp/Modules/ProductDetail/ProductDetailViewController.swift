//
//  ProductDetailViewController.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 13/02/2021.
//

import UIKit

protocol ProductDetailView {}

class ProductDetailViewController: UIViewController {
    
    var presenter: ProductPresenter!
    
    @IBOutlet weak var collectionViewProductImages: UICollectionView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductDate: UILabel!
    @IBOutlet weak var labelProductCurrency: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var labelProductUID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
    
    override func notifiyDataUpdate(data: Any?) {
        labelProductName.text = self.presenter.getName()
        labelProductDate.text = self.presenter.getCreatedDate()
        labelProductCurrency.text = self.presenter.getCurrency()
        labelProductPrice.text = "\(self.presenter.getPrice())"
        labelProductUID.text = self.presenter.getUID()
        collectionViewProductImages.dataSource = self
        collectionViewProductImages.delegate = self
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}

extension ProductDetailViewController: ProductDetailView {
    
}

//MARK: - UICollectionView DataSource
extension ProductDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCollectionViewCell", for: indexPath) as? ProductDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.uiimageProduct?.image = UIImage(named: "image_placeholder")
        
        let cellPresenter = ProductDetailCollectionViewPresenter(images: self.presenter.getImages())
        
    //        let cellPresenter = ProductTableCellPresenter(withCell: cell, withProduct: self.presenter.getProduct(at: indexPath))
            cell.presenter = cellPresenter
        
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return presenter.imagesCount
        return 3
    }
    
}

extension ProductDetailViewController: UICollectionViewDelegate {
    
}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Util.getScreenSize().width-10, height: Util.getScreenSize().width-10)
    }
}
