//
//  RoverCellTableViewCell.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 6.06.2024.
//

import UIKit
import SDWebImage
class RoverCellTableViewCell: UITableViewCell {

    
    public static var identifier : String {
        get {
            return "RoverCellTableViewCell"
        }
    }
    public static func register() -> UINib {
        UINib(nibName: "RoverCellTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var roverImage: UIImageView!
    @IBOutlet weak var roverTitleLabel: UILabel!
    @IBOutlet weak var landingDateLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    @IBOutlet weak var isActiveLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.addBorder(color: .label, width: 1)
        backView.round()
        roverImage.round(10)
    }

    func setupCell(viewModel : RoverTableCellViewModel)  {
        self.roverTitleLabel.text = viewModel.name
        self.landingDateLabel.text = viewModel.landingDate
        self.launchDateLabel.text = viewModel.launchDate
        self.isActiveLabel.text = viewModel.status
        self.roverImage.sd_setImage(with: viewModel.image)
    }
    
    
}
