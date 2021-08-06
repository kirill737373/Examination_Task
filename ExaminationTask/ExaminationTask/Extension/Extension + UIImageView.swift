//
//  Extension + UIScrollDelegate.swift
//  ExaminationTask
//
//  Created by Кирилл Блохин on 06.08.2021.
//

import Foundation
import UIKit

extension UIImageView{
    func setImage(_ image: UIImage?, animated: Bool = true) {
        let duration = animated ? 0.35 : 0.0
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
}
