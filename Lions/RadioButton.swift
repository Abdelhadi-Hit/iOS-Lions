//
//  RadioButton.swift
//  Lions
//
//  Created by ABDELHADI on 18/6/2023.
//

import Foundation

import UIKit

class RadioButton: UIButton {
    override var isSelected: Bool {
        didSet {
            setImage(isSelected ? UIImage(systemName: "checkmark") : nil, for: .normal)
        }
    }
}

