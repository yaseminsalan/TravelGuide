//
//  HotelsViewController.swift
//  TravelGuide
//
//  Created by amarenasoftware on 3.10.2022.
//

import UIKit

class HotelsViewController: UIViewController {
   
    
    @IBOutlet weak var hotelsTableView: UITableView!
    private let viewModel = HotelsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        
        viewModel.didViewLoad()
        // Do any additional setup after loading the view.
    }
    


}
private extension HotelsViewController{
    func setupUI(){
        hotelsTableView.delegate = self
        hotelsTableView.dataSource = self
     
    }
    
    
}
extension HotelsViewController:HotelsViewModelViewProtocol{
    func navigateToDetail(_ id: Int) {
        //yönlendirilen sayfa
        
        let vc = DetailViewController()
       
        let model = DetailModel(id: id)
        let vm = DetailViewModel(model: model)
        model.viewModel = vm
        vc.viewModel = vm
        present(vc, animated: true)
        
    }
    
    func didCellItemFetch() {
        //TODO
        
        DispatchQueue.main.async {
            self.hotelsTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        //todo
    }
    
    func hideEmptyView() {
        //TODO
    }
    
   
    
    
}
extension HotelsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at:indexPath.row)
    }
    
    
}
extension HotelsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelsCell", for: indexPath) as! HotelsTableViewCell
   
        
      
        return cell
    }
    
   
    
    
}

