//
//  IMUIGalleryDataManager.swift
//  IMUIChat
//
//  Created by oshumini on 2017/3/9.
//  Copyright © 2017年 HXHG. All rights reserved.
//

import UIKit
import Photos

class IMUIGalleryDataManager: NSObject {
  
  static var targetSize = CGSize(width: 200, height: 200)
  
  private static var _allAssets = [PHAsset]()
  static var allAssets : [PHAsset] {
    get{
      if _allAssets.count < 1 {
        updateAssets()
      }
      return _allAssets
    }
  }
  
  class func updateAssets(){
    let options = PHFetchOptions()
    options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    let assetFetchResult = PHAsset.fetchAssets(with: options)
    assetFetchResult.enumerateObjects({(asset, _, _) in
      _allAssets.append(asset)
    })
  }
  
  static var selectedAssets = [PHAsset]()
}
