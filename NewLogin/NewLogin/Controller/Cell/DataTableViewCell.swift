//
//  DataTableViewCell.swift
//  NewLogin
//
//  Created by Pranjal Tmarakar on 26/10/23.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imagePic: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    override func layoutSubviews() {
        imagePic.layer.cornerRadius = imagePic.bounds.height / 2
        imagePic.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
