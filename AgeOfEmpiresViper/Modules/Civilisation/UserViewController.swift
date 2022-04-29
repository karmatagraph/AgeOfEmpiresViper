//
//  View.swift
//  AgeOfEmpiresViper
//
//  Created by karma on 4/29/22.
//

import UIKit
// ViewController
// protocol
// Reference to Presenter


protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func update(with civs: [Civilization])
    func update(with error: String)
}

class UserViewController:
    UIViewController, AnyView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var presenter: AnyPresenter?
    var civs: [Civilization] = []
    
    func update() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.backgroundColor = .red
//        view.backgroundColor = .red
        
    }
    
    // MARK: - Private Functions
    private func setupTableView(){
//        print(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Conformance
    
    func update(with civs: [Civilization]) {
        print("called the view from presenter")
//        print(civs[1].name)
        DispatchQueue.main.async {
            self.civs = civs
            print(civs[1].name)
//            self.tableView?.backgroundColor = .red
            self.tableView.reloadData()
        }
        
//            self.tableView?.isHidden = false
            
        
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            print(error,"--------------this error occured")
        }
    }
    
    
}

extension UserViewController: UITableViewDelegate { }

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return civs.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let civ = civs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.selectionStyle = .none
        cell.textLabel?.text = civ.name
        return cell
    }
}
