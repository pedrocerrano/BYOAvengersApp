//
//  AvengerListTableViewCell.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import UIKit

class AvengerListTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var avengerNameLabel: UILabel!
    @IBOutlet weak var avengerImageView: UIImageView!
    
    
    //MARK: - FUNCTIONS
    func updateViews(avenger: Avenger) {
        avengerNameLabel.text = avenger.name
        
        let imageString = URL(string: "\(avenger.thumbnailPath).\(avenger.thumbnailExtention)") ?? URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg")!
//        print("IMAGE STRING: \(imageString)")
        avengerImageView.loadFromURL(url: imageString)
    }

}


//MARK: - EXTENSION
extension UIImageView {
    func loadFromURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
