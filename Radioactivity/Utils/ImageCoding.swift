//
//  ImageCoding.swift
//  Radioactivity
//
//  Created by Jacob Clayden on 16/09/2019.
//  Copyright © 2019 Jacob Clayden. All rights reserved.
//

import UIKit

enum ImageEncodingQuality: CGFloat {
    case png = 0
    case jpegLow = 0.2
    case jpegMid = 0.5
    case jpegHigh = 0.75
}

enum ImageConversionError: Error {
    case runtimeError(String)
}

extension KeyedEncodingContainer {
    mutating func encode(_ value: UIImage, forKey key: KeyedEncodingContainer.Key, quality: ImageEncodingQuality = .png) throws {
        var imageData: Data!
        if quality == .png {
            imageData = value.pngData()
        } else {
            imageData = value.jpegData(compressionQuality: quality.rawValue)
        }
        try encode(imageData, forKey: key)
    }
}

extension KeyedDecodingContainer {
    public func decode(_ type: UIImage.Type, forKey key: KeyedDecodingContainer.Key) throws -> UIImage {
        if let imageData = try? decode(Data.self, forKey: key) {
            if let image = UIImage(data: imageData) {
                return image
            } else {
                throw ImageConversionError.runtimeError("Image Conversion Error")
            }
        } else {
            throw ImageConversionError.runtimeError("Image Decoding Error")
        }
    }
}
