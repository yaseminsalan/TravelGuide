//
//  BookmarksViewController.swift
//  TravelGuide
//
//  Created by amarenasoftware on 4.10.2022.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    @IBOutlet weak var bookmarksTableView: UITableView!
    
    
    private let viewModelBookmarks = BookmarksViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModelBookmarks.viewDelegateBookmarks = self
        
        viewModelBookmarks.didViewLoad()
        // Do any additional setup after loading the view.
    }
    


}
private extension BookmarksViewController{
    func setupUI(){
        bookmarksTableView.delegate = self
        bookmarksTableView.dataSource = self

    }
    
    
}
extension BookmarksViewController:BookmarksViewModelViewProtocol{
    func navigateToDetail(_ detailItem: DetailCellViewModel) {
 
        //yönlendirilen sayfa
        
        let vc = DetailViewController()
       
        let model = DetailModel(detailItem: detailItem)
        let vm = DetailViewModel(model: model)
        model.viewModel = vm
        vc.viewModel = vm
        //navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true)
        
    }
    
    func didCellItemFetch() {
        //TODO
        
        DispatchQueue.main.async {
            self.bookmarksTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        //todo
    }
    
    func hideEmptyView() {
        //TODO
    }
    
   
    
    
}
extension BookmarksViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModelBookmarks.didClickItem(at:indexPath.row)
    }
    
    
}
extension BookmarksViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelBookmarks.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksCell", for: indexPath) as! BookmarksTableViewCell
        let cellModel = viewModelBookmarks.getModel(at: indexPath.row)
    
        cell.bookmarksTitle.text = cellModel.title
        cell.bookmarksDescription.text = cellModel.description
      
        return cell
    }
    
   
    
    
}

