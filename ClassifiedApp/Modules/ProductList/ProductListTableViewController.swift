//
//  ProductListTableViewController.swift
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 12/02/2021.
//

import UIKit

protocol ProductListView {}

class ProductListTableViewController: UITableViewController {
    
    var presenter: ProductListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
    
    override func notifiyDataUpdate(data: Any?) {
        self.tableView.reloadData()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

extension ProductListTableViewController: ProductListView {
    
    
}

// MARK: - TableView DataSource
extension ProductListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter.productCount == 0 {
            return 1
        }
        else {
            return self.presenter.productCount
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.productCount {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductEmptyCell") as? ProductTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
            default:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else {
                    return UITableViewCell()
                }
            
            
                let cellPresenter = ProductTableCellPresenter(withProduct: self.presenter.getProduct(at: indexPath))
                cell.presenter = cellPresenter

                return cell
            
        }
    }
}

// MARK: - TableView Delegate
extension ProductListTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.selectProduct(at: indexPath)
    }
}
