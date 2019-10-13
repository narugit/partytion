//
//  PaddingTextField.swift
//  PartytionApp
//
//  Created by naru on 2019/10/02.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class PlaceHolderTextView: UITextView {
    var placeholderColor: UIColor = .lightGray
    var defaultTextColor: UIColor = .black
    
    private var isShowingPlaceholder = false {
        didSet {
            if isShowingPlaceholder {
                text = placeholder
                textColor = placeholderColor
            } else {
                textColor = defaultTextColor
            }
        }
    }
    
    var placeholder: String? {
        didSet {
            isShowingPlaceholder = !hasText
        }
    }
    
    @objc private func textViewDidBeginEditing(notification: Notification) {
        textColor = defaultTextColor
        if isShowingPlaceholder { text = nil }
    }
    
    @objc private func textViewDidEndEditing(notification: Notification) {
        isShowingPlaceholder = !hasText
    }
    
    // MARK: - Construction -
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidBeginEditing(notification:)), name: UITextView.textDidBeginEditingNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidEndEditing(notification:)), name: UITextView.textDidEndEditingNotification, object: self)
    }
    
    // MARK: - Destruction -
    deinit { NotificationCenter.default.removeObserver(self) }
}
