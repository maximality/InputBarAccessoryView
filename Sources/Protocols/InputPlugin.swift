//
//  InputPlugin.swift
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
//  Copyright © 2017-2020 Nathan Tannar. All rights reserved.
//

import UIKit

public class VideoAttachment {
    public let url: URL
    public let thumbnail: UIImage
    
    public init(url: URL, thumbnail: UIImage) {
        self.url = url
        self.thumbnail = thumbnail
    }
}

public class FileAttachment {
    public let url: URL
    public let image: UIImage
    public let height: CGFloat?
    public let width: CGFloat?
    public let memoryLabelColor: UIColor?
    
    public init(url: URL, image: UIImage, height: CGFloat? = nil, width: CGFloat? = nil, memoryLabelColor: UIColor? = nil) {
        self.url = url
        self.image = image
        self.height = height
        self.width = width
        self.memoryLabelColor = memoryLabelColor
    }
}

/// `InputPlugin` is a protocol that makes integrating plugins to the `InputBarAccessoryView` easy.
public protocol InputPlugin: AnyObject {
    
    /// Should reload the state if the `InputPlugin`
    func reloadData()
    
    /// Should remove any content that the `InputPlugin` is managing
    func invalidate()
    
    /// Should handle the input of data types that an `InputPlugin` manages
    ///
    /// - Parameter object: The object to input
    func handleInput(of object: AnyObject) -> Bool
}
