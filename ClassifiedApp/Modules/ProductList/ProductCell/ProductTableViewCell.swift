//
//  ProductTableViewCell.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductDateCreated: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    
    var presenter: ProductCellPresenter? {
        didSet {
            self.configureCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func configureCell() {
        self.labelProductName.text = presenter?.getName()
        self.labelProductDateCreated.text = presenter?.getDate()
        self.labelProductPrice.text = presenter?.getPrice()
        presenter?.getThumbmailImage(onCompletion: { (image, error) in
            self.imageProduct.image = image
//            self.tableView?.reloadData()
        })
    }

}
