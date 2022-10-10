//
//  HotelsViewController.swift
//  TravelGuide

import UIKit

class HotelsViewController: UIViewController {
   
    
    @IBOutlet weak var hotelsTableView: UITableView!
    private let viewModelHotels = HotelsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModelHotels.viewDelegateHotels = self
        
        viewModelHotels.didViewLoad()
        // Do any additional setup after loading the view.
    }
    


}
private extension HotelsViewController{
    func setupUI(){
        hotelsTableView.delegate = self
        hotelsTableView.dataSource = self
        let backButton = UIBarButtonItem()
        backButton.title = "Hotels"
        backButton.tintColor = .black
    
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
       
    }
    
    
}
extension HotelsViewController:HotelsViewModelViewProtocol{
    func navigateToDetail(_ detailItem: DetailCellViewModel) {
 
   
        
        let vc = DetailViewController()
       
        let model = DetailModel(detailItem: detailItem)
        let vm = DetailViewModel(model: model)
        model.viewModel = vm
        vc.viewModel = vm
        vc.modalPresentationStyle = .fullScreen
        //navigationController?.pushViewController(vc, animated: true)
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
        viewModelHotels.didClickItem(at:indexPath.row)
    }
    
    
}
extension HotelsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelHotels.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelsCell", for: indexPath) as! HotelsTableViewCell
        let cellModel = viewModelHotels.getModel(at: indexPath.row)
        cell.hotelTitle.text = cellModel.title
        cell.hotelDescription.text = cellModel.description
        cell.hotelImage.image = UIImage(named: cellModel.imageUrl ?? "Image1" )
        return cell
    }
    
   
    
    
}

