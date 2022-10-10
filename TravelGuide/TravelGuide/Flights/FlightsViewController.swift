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
      
        let backButton = UIBarButtonItem()
        backButton.title = "Flights"
       backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
  
     
    }
    
    
}
extension FlightsViewController:FlightsViewModelViewProtocol{
    func navigateToDetail(_ detailItem: DetailCellViewModel) {
       
        
        let vc = DetailViewController()
       
        let model = DetailModel(detailItem: detailItem)
        let vm = DetailViewModel(model: model)
        model.viewModel = vm
        vc.viewModel = vm
        vc.modalPresentationStyle = .fullScreen
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
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightsCell", for: indexPath) as! FlightsTableViewCell
        let cellModel = viewModel.getModel(at: indexPath.row)
        cell.flightsTitle.text = cellModel.title! + String(cellModel.id!)
        cell.flightsDescriptions.text = cellModel.description
        cell.flightsImage.image = UIImage(named: cellModel.imageUrl!)
        return cell
    }
    
   
    
    
}

