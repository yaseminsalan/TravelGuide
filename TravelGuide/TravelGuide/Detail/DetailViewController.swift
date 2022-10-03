//
//  DetailViewController.swift
//  TravelGuide


import UIKit

class DetailViewController: UIViewController {

    
    
    var viewModel:DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDelegateDetail = self
      
        print("deneme detail\(viewModel?.model.detailItem.title)")
    }
   

}
extension DetailViewController:DetailViewModelViewProtocol{
    func didCellItemFetch() {
        //
        DispatchQueue.main.async {
            self.viewDidLoad()
        }
    }
    
    func showEmptyView() {
        //
    }
    
    func hideEmptyView() {
        //
    }
}
