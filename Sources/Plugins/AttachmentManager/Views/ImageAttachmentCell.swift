//
//  ImageAttachmentCell.swift
//  InputBarAccessoryView
//
//  Copyright © 2017-2020 Nathan Tannar.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//  Created by Nathan Tannar on 10/6/17.
//

import UIKit

open class ImageAttachmentCell: AttachmentCell {
    
    // MARK: - Properties
    
    override open class var reuseIdentifier: String {
        return "ImageAttachmentCell"
    }
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Setup
    
    private func setup() {
        containerView.addSubview(imageView)
        imageView.fillSuperview()
    }
}

open class FileAttachmentCell: AttachmentCell {
    
    override open class var reuseIdentifier: String {
        return "FileAttachmentCell"
    }
    
    public let imageView: UIImageView = {
        let tempView = UIImageView()
        tempView.contentMode = .scaleAspectFit
        return tempView
    }()
    
    public let nameLabel: UILabel = {
        let tempView = UILabel()
        tempView.font = .systemFont(ofSize: 14, weight: .medium)
        return tempView
    }()
    
    public let memoryLabel: UILabel = {
        let tempView = UILabel()
        tempView.font = .systemFont(ofSize: 14, weight: .regular)
        tempView.textColor = .black.withAlphaComponent(0.6)
        return tempView
    }()
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        memoryLabel.text = nil
    }
    
    // MARK: - Setup
    
    private func setup() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.clipsToBounds = true
        memoryLabel.translatesAutoresizingMaskIntoConstraints = false
        memoryLabel.clipsToBounds = true
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(memoryLabel)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 28.0),
            imageView.widthAnchor.constraint(equalToConstant: 36.0),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 13.0),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8.0),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
            memoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            memoryLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8.0),
            memoryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0)
        ])
    }
}
