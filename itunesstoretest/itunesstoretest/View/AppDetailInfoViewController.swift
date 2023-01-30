//
//  AppDetailInforViewController.swift
//  itunesstoretest
//
//  Created by Ravi Borad on 16/11/22.
//

import UIKit
 
class AppDetailInfoViewController: UIViewController {
    
    // MARK:- Declare Outlet and Variables
    @IBOutlet weak var imgApp: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    
    var entryData: AppDataListCellViewModel?
    
    //MARK:- Initialization -
    class func initViewContoller(objEntry : AppDataListCellViewModel?) -> AppDetailInfoViewController {
        let vc = storyboardMain.instantiateViewController(withIdentifier: "AppDetailInfoViewController") as! AppDetailInfoViewController
        vc.entryData = objEntry
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.entryData?.nameText
        self.lblName.text = self.entryData?.nameText
        self.lblSummary.text = self.entryData?.summaryText
        
        self.imgApp.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.imgApp.sd_setImage(with: URL(string: "\(self.entryData?.imageURL ?? "")"), placeholderImage: UIImage())
     }
 
}
