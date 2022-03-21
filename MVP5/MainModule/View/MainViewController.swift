//
//  ViewController.swift
//  MVP5
//
//  Created by  Mr.Ki on 20.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - IBOutlet

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.coments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let coment = presenter.coments?[indexPath.row]
        cell.textLabel?.text = coment?.name
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coment = presenter.coments?[indexPath.row]
        let detailViewController = ModuleBuilder.createDetailModule(coment: coment)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}



extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
  
     
}
