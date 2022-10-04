//
//  FlightsViewController.swift
//  TravelGuide


import UIKit

class FlightsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = FlightsViewModel()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        
        viewModel.didViewLoad()
        // Do any additional setup after loading the view.
    }
    


}
private extension FlightsViewController{
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.topItem!.title = "Flights"
     
    }
    
    
}
extension FlightsViewController:FlightsViewModelViewProtocol{
    func navigateToDetail(_ detailItem: DetailCellViewModel) {
       
        
        let vc = DetailViewController()
       
        let model = DetailModel(detailItem: detailItem)
        let vm = DetailViewModel(model: model)
        model.viewModel = vm
        vc.viewModel = vm
       // navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true)
        
    }
    
    func didCellItemFetch() {
        //TODO
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showEmptyView() {
        //todo
    }
    
    func hideEmptyView() {
        //TODO
    }
    
   
    
    
}
extension FlightsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at:indexPath.row)
    }
    
    
}
extension FlightsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count boytut\(viewModel.numberOfItems())")
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightsCell", for: indexPath) as! FlightsTableViewCell
        let cellModel = viewModel.getModel(at: indexPath.row)
      //  cell.decriptionLabel.text = cellModel.title
        cell.flightsTitle.text = cellModel.title! + String(cellModel.id!)
        cell.flightsDescriptions.text = cellModel.description
        
      
        return cell
    }
    
   
    
    
}

