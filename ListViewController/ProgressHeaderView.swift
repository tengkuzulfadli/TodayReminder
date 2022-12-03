//
//  ProgressHeaderView.swift
//  TodayReminder
//
//  Created by Tengku Zulfadli on 3/12/2022.
//

import UIKit

class ProgressHeaderView: UICollectionReusableView {
    
    static var elementKind: String { UICollectionView.elementKindSectionHeader }
    var progress: CGFloat = 0 {
        didSet {
            setNeedsLayout()
            heightConstraint?.constant = progress * bounds.height
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.layoutIfNeeded()
            }
        }
    }
    
    private let upperview = UIView(frame: .zero)
    private let lowerview = UIView(frame: .zero)
    private let containerView = UIView(frame: .zero)
    private var heightConstraint: NSLayoutConstraint?
    private var valueFormat: String { NSLocalizedString("%d percent", comment: "Progress percentage")}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
        
        isAccessibilityElement = true
        accessibilityLabel = NSLocalizedString("Progress", comment: "Progress view accessibility")
        accessibilityTraits.update(with: .updatesFrequently)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        accessibilityValue = String(format: valueFormat, Int(progress * 100.0))
        heightConstraint?.constant = progress * bounds.height
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 0.5 * containerView.bounds.width
    }
    
    private func prepareSubviews() {
        containerView.addSubview(upperview)
        containerView.addSubview(lowerview)
        addSubview(containerView)
        
        upperview.translatesAutoresizingMaskIntoConstraints = false
        lowerview.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        
        upperview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        upperview.bottomAnchor.constraint(equalTo: lowerview.topAnchor).isActive = true
        lowerview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        upperview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        upperview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lowerview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lowerview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        heightConstraint = lowerview.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true
        
        backgroundColor = .clear
        containerView.backgroundColor = .clear
        upperview.backgroundColor = .todayProgressUpperBackground
        lowerview.backgroundColor = .todayProgressLowerBackground
    }
}
