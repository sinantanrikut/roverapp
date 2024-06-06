//
//  DetailRoverViewController.swift
//  RoversApp
//
//  Created by Sinan Tanrıkut on 6.06.2024.
//

import UIKit
import SDWebImage

class DetailRoverViewController: UIViewController  {
    var mainViewModel: MainViewModel = MainViewModel()

    @IBOutlet weak var numberPhotoLabel: UILabel!
    @IBOutlet weak var numberCameraLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var viewModel: DetailsRoverViewModel

        init(viewModel: DetailsRoverViewModel) {
            self.viewModel = viewModel
            super.init(nibName: "DetailRoverViewController", bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            configView()
            loadData()

            // NotificationCenter'a gözlemci ekleyelim
            NotificationCenter.default.addObserver(self, selector: #selector(didReceiveRoverData), name: .didReceiveRoverData, object: nil)
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            // Gözlemciyi kaldırmayı unutmayalım
            NotificationCenter.default.removeObserver(self, name: .didReceiveRoverData, object: nil)
        }

        func loadData() {
            mainViewModel.roverGetData(viewModel.roverName)
        }

        @objc func didReceiveRoverData() {
            DispatchQueue.main.async {
                if let imgSrc = self.mainViewModel.dataDetailSource?.latestPhotos.first?.imgSrc {
                    print(imgSrc)
//                     http://mars.nasa.gov/mer/gallery/all/2/p/2208/2P322473707ESFB27MP2600L8M1-BR.JPG
//                    BU LİNK GELİYOR ANCAK GİRİNCE https://science.nasa.gov/mission/mars-exploration-rovers-spirit-and-opportunity/ ŞURAYA YÖNLENDİRİYOR
                    self.imageView.sd_setImage(with: URL(string: imgSrc))
                }
            }
        }

        func configView() {
            self.title = viewModel.roverName
            self.numberPhotoLabel.text = viewModel.numberPhotoLabel
            self.numberCameraLabel.text = viewModel.numberCameraLabel
        }
    }
