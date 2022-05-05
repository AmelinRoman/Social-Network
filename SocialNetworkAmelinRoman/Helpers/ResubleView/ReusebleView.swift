//
//  ResubleView.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 28.04.2022.
//

import Foundation
import UIKit

protocol ReusebleView {
    static var reuseIdentifier: String { get }
}

extension ReusebleView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusebleView {}
extension UITableViewHeaderFooterView: ReusebleView {}
extension UICollectionReusableView: ReusebleView {}
