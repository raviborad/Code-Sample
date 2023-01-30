//
//  EntryDataViewModel.swift
//  itunesstoretest
//
//  Created by Ravi Borad on 16/11/22.
//

import UIKit

class EntryDataViewModel {
    
    var datas: [Entry] = [Entry]()
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
 
    var datasTemp: [Entry] = [Entry]()
 
    private var cellViewModels: [AppDataListCellViewModel] = [AppDataListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
 
    func getAppData(){
        showLoading?()
        ApiClient.getTopPaidAppDataFeed { (success, data) in
            self.hideLoading?()
            if success {
                self.datasTemp = data!
                self.createCell(datas: data!)
                self.reloadTableView?()
            } else {
                self.showError?()
            }
        }
    }
    
    func getSearchData(searchText: String){
        let tempData = datasTemp
        let filteredArray = tempData.filter { ($0.imname?.label?.contains(searchText ))!}
        self.createCell(datas: searchText == "" ? datasTemp : filteredArray)
        self.reloadTableView?()
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> AppDataListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCell(datas: [Entry]){
        self.datas = datas
        var vms = [AppDataListCellViewModel]()
        for data in datas {
            vms.append(AppDataListCellViewModel(nameText: data.imname?.label, summaryText: data.summary?.label, imageURL: data.imimage?.last?.label))
        }
        cellViewModels = vms
    }
}

struct AppDataListCellViewModel {
    let nameText: String?
    let summaryText: String?
    let imageURL: String?
}

