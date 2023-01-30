//
//  UIViewController+Extensions.swift
//  itunesstoretest
//
//  Created by Ravi Borad on 16/11/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
