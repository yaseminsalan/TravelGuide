//
//  ViewController.swift
//  TravelGuide
//
//  Created by amarenasoftware on 28.09.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = HomeViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        
        viewModel.didViewLoad()
        // Do any additional setup after loading the view.
    }


}

private extension HomeViewController{
    func setupUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
     
    }
    
    
}
extension HomeViewController:HomeViewModelViewProtocol{
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
            self.collectionView.reloadData()
        }
    }
    
    func showEmptyView() {
        //todo
    }
    
    func hideEmptyView() {
        //TODO
    }
    
   
    
    
}
extension HomeViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didClickItem(at:indexPath.row)
    }
    
}
extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopPickCell", for: indexPath) as! HomeTopPickCollectionViewCell
        let cellModel = viewModel.getModel(at: indexPath.row)
        cell.decriptionLabel.text = cellModel.title
        return cell
    }
    
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
           let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        return CGSize(width: (screenWidth*0.5), height:(screenWidth*0.5));
    }
    
   /*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }*/
 
}
