//
//  AvengerDetailVC.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import UIKit

class AvengerDetailVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var avengerDetailImageView: UIImageView!
    @IBOutlet weak var avengerDetailNameLabel: UILabel!
    @IBOutlet weak var avengerDetailComicsLabel: UILabel!
    
    @IBOutlet weak var avengerDetailDescriptionTitleLabel: UILabel!
    @IBOutlet weak var avengerDetailsDecriptionTextLabel: UILabel!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //MARK: - PROPERTIES
    var avengerDetails: Avenger? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - FUNCTIONS
    func updateViews() {
        guard let avengerDetails                = avengerDetails else { return }
        avengerDetailNameLabel.text             = avengerDetails.name
        avengerDetailComicsLabel.text           = "Comics Appearing In: \(avengerDetails.comicsAppearing)"
        avengerDetailDescriptionTitleLabel.text = "About \(avengerDetails.name):"

        if avengerDetails.description == "" {
            avengerDetailsDecriptionTextLabel.text      = "No Description Available"
            avengerDetailsDecriptionTextLabel.textColor = .systemGray2
        } else {
            avengerDetailsDecriptionTextLabel.text      = avengerDetails.description
        }
        
        let imageURL = URL(string: "\(avengerDetails.thumbnailPath).\(avengerDetails.thumbnailExtention)") ?? URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg")!
        avengerDetailImageView.loadFromURL(url: imageURL)
    }

}
