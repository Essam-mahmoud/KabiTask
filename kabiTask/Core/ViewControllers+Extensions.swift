//  GoLyv
//
//  Created by Essam Orabi on 20/10/2023.
//


import UIKit

extension UIViewController {
  func showAlert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    DispatchQueue.main.async {
          self.present(alertController, animated: true, completion: nil)
      }
  }
}
