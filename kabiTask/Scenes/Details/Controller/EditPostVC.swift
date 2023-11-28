//
//  EditPostVC.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import UIKit

protocol EditPostProtocol {
    func savePostChanges(post: Post)
}

class EditPostVC: UIViewController {
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var post: Post?
    var delegate: EditPostProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.navigationItem.title = "Edit Post"
        saveButton.layer.cornerRadius = 10
        guard let post = post else {return}
        titleTextView.text = post.title
        bodyTextView.text = post.body
    }
    
    @IBAction func saveButtonDidPressed(_ sender: UIButton) {
        let title = titleTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        let body = bodyTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        if title != "" && body != "" {
            delegate.savePostChanges(post: Post(userID: post?.userID, id: post?.id, title: title, body: body))
            navigationController?.popViewController(animated: true)
        } else {
            self.showAlert(message: "Please fill all filed to continue...", title: "Error")
        }
    }
}
