//
//  AvengerDetailVC.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import UIKit

class AvengerDetailVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var avengerDetailNameLabel: UILabel!
    @IBOutlet weak var avengerDetailComicsLabel: UILabel!
    @IBOutlet weak var avengerDetailDescriptionLabel: UILabel!
    
    
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
        guard let avengerDetails = avengerDetails else { return }
        avengerDetailNameLabel.text = avengerDetails.name
        avengerDetailComicsLabel.text = "Comics Appearing In: \(avengerDetails.comicsAppearing)"
        avengerDetailDescriptionLabel.text = "About \(avengerDetails.name): \(avengerDetails.description)"
    }

}
