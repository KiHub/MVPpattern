//
//  DetailViewController.swift
//  MVP5
//
//  Created by  Mr.Ki on 21.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComent()

      
    }
}
extension DetailViewController: DetailViewProtocol {
    func setComent(coment: Coment?) {
        label.text = coment?.body
    }
    
    
}
