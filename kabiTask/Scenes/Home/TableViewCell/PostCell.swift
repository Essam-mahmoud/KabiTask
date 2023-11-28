//
//  PostCell.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import UIKit

protocol PostCellProtocol {
    func displayData(data: Post)
}

class PostCell: UITableViewCell {

    static let identifier = "PostCell"
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}


extension PostCell: PostCellProtocol {
    func displayData(data: Post) {
        postTitleLabel.text = data.title
        postDescriptionLabel.text = data.body
    }
}
