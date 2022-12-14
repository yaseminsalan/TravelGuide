//
//  ViewController.swift
//  TravelGuide


import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var hotelsButton: UIButton!
    @IBOutlet weak var flightsButton: UIButton!
    @IBAction func flightsButton(_ sender: Any) {
        if let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FlightsStoryboard") as? FlightsViewController
                {
            navigationController?.pushViewController(vc, animated: true)
                 
                }
    }
    
    @IBAction func hotelsButton(_ sender: Any) {
        
        
        if let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HotelsStoryboard") as? HotelsViewController
                {
                    
          
            navigationController?.pushViewController(vc, animated: true)
                 
                }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   print("deneme gerş")
     //   navigationController?.navigationItem.backButtonTitle = ""
       // navigationController?.title = " "
       // navigationController?.navigationItem.title = " "
        navigationController?.navigationBar.topItem?.title = " "
        
    }
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
    func navigateToDetail(_ detailItem: DetailCellViewModel) {
        //redirected page for screen details
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
            self.collectionView.reloadData()
        }
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
    
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
        cell.categoryLabel.text = cellModel.description
        cell.articleImage.image = UIImage(named: cellModel.imageUrl!)
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
 
}

