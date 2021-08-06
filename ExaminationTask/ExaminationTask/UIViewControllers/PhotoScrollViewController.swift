//
//  PhotoViewController.swift
//  ExaminationTask
//
//  Created by Кирилл Блохин on 05.08.2021.
//

import UIKit
import SnapKit

final class PhotoViewController: UIViewController {
    
    var indexPath = IndexPath(row: 0, section: 0)
    var selectedIndex = 0
    
    private let scrolView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.contentMode = .scaleAspectFit
        scroll.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        scroll.minimumZoomScale = 1
        scroll.maximumZoomScale = 15
        return scroll
    }()
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrolView.addSubview(imageView)
        view.addSubview(scrolView)
        scrolView.delegate = self
        loadImage()
        gesture()
    }
    
    override func viewDidLayoutSubviews() {
        constraints()
    }
    
    private func loadImage() {
        scrolView.contentSize.width = UIScreen.main.bounds.width * CGFloat(indexPath.row)
        imageView.setImage(LibrayPhotoViewController.photoLibrayModel[selectedIndex].photo)
    }
    
    private func gesture()  {
        let righSwipe = UISwipeGestureRecognizer(target: self, action: #selector(heandleSwipeFrom))
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(heandleSwipeFrom))
        righSwipe.direction = .right
        leftSwipe.direction = .left
        scrolView.addGestureRecognizer(righSwipe)
        scrolView.addGestureRecognizer(leftSwipe)
    }
    
    private func constraints() {
        scrolView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
    }
    
    @objc func heandleSwipeFrom(recognizer: UISwipeGestureRecognizer) {
        let direction: UISwipeGestureRecognizer.Direction = recognizer.direction
        switch direction {
        case .right:
            self.selectedIndex -= 1
        case .left:
            self.selectedIndex += 1
        default:
            break
        }
        self.selectedIndex = (self.selectedIndex < 0) ? (LibrayPhotoViewController.photoLibrayModel.count - 1) : self.selectedIndex % LibrayPhotoViewController.photoLibrayModel.count
        loadImage()
    }
}

extension PhotoViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}


