//
//  MainViewController.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 5.06.2024.
//

import UIKit

class MainViewController: UIViewController {
    var viewModel: MainViewModel = MainViewModel()
    var isDataLoaded = false  // Veri yüklendi mi bayrağı

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    var cellDataSource : [RoverTableCellViewModel] = []
    override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Rovers"
      
            configView()
            bindViewModel()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            // Veriler yalnızca bir kez yüklenir
            if !isDataLoaded {
                viewModel.getData()
            }
        }
        
        func configView() {
            self.title = "Rovers"
            self.view.backgroundColor = .systemBackground
            setupTableView()
        }
        
        func bindViewModel() {
            viewModel.isLoadingData.bind { [weak self] isLoading in
                guard let isLoading = isLoading else {
                    return
                }
                DispatchQueue.main.async {
                    if isLoading {
                        self?.activityIndicator.startAnimating()
                    } else {
                        self?.activityIndicator.stopAnimating()
                    }
                }
            }
            
            viewModel.cellDataSource.bind { [weak self] rovers in
                guard let self = self, let rovers = rovers else {
                    return
                }
                self.cellDataSource = rovers
                self.reloadTableView()
                // Veriler başarıyla yüklendikten sonra bayrağı güncelle
                self.isDataLoaded = true
            }
        }
        
        func openDetails(id: Int) {
            guard let rover = viewModel.retriveRover(withId: id) else {
                return
            }
            DispatchQueue.main.async {
                let detailsViewModel = DetailsRoverViewModel(rover: rover)
                let controller = DetailRoverViewController(viewModel: detailsViewModel)
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
