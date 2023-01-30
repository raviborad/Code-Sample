//
//  AppListViewController.swift
//  itunesstoretest
//
//  Created by Ravi Borad on 16/11/22.
//

import UIKit
 
class AppListViewController: UIViewController {
    
    // MARK:- Declare Outlet and Variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var txtSearchBar: UISearchBar!

    var dataViewModel = EntryDataViewModel()
    
    //MARK:- Initialization -
    class func initViewContoller() -> AppListViewController {
        let vc = storyboardMain.instantiateViewController(withIdentifier: "AppListViewController") as! AppListViewController
         return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    func initViewModel(){
        
        dataViewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView.reloadData()
            }
        }
        dataViewModel.showError = {
            DispatchQueue.main.async { self.showAlert("Ups, something went wrong.") }
        }
        dataViewModel.showLoading = {
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating() }
        }
        dataViewModel.hideLoading = {
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating() }
        }
        dataViewModel.getAppData()
    }
}

extension AppListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppDataTVCell", for: indexPath) as? AppDataTVCell else {
            fatalError("Cell not exists in storyboard")
        }
        let cellVM = dataViewModel.getCellViewModel( at: indexPath )
        cell.lblName.text = cellVM.nameText
        cell.lblSummary.text = cellVM.summaryText
        
        cell.imgApp.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.imgApp.sd_setImage(with: URL(string: "\(cellVM.imageURL ?? "")"), placeholderImage: UIImage())

         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = dataViewModel.getCellViewModel(at: indexPath)
        let vc = AppDetailInfoViewController.initViewContoller(objEntry: cellVM)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension AppListViewController : UISearchBarDelegate  {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        self.performSearch()
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.performSearch()
        }
    }
    
    @objc func performSearch() {
        if let strSearch = txtSearchBar.text {
            dataViewModel.getSearchData(searchText: strSearch)
        }
    }
}
