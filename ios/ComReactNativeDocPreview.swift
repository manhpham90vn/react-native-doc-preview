import UIKit
import QuickLook

@objc(ComReactNativeDocPreview)
class ComReactNativeDocPreview: NSObject {
    
    var item = NSURL()
    
    @objc(show:fileName:withResolver:withRejecter:)
    func show(inputUrl: String, fileName: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        downloadfile(inputUrl: inputUrl, fileName: fileName) { [weak self] (outputUrl) in
            guard let self = self else { return }
            if let outputUrl = outputUrl {
                resolve(outputUrl.absoluteString)
                DispatchQueue.main.async {
                    let vc = QLPreviewController()
                    self.item = outputUrl as NSURL
                    vc.dataSource = self
                    UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
                }
            } else {
                reject("401", "Can not download url", NSError(domain: "", code: 401, userInfo: nil))
            }
        }
    }
    
    func downloadfile(inputUrl: String, fileName: String, completion: @escaping (URL?) -> Void) {
        
        guard let itemUrl = URL(string: inputUrl) else {
            completion(nil)
            return
        }
        
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(fileName)
        
        URLSession.shared.downloadTask(with: itemUrl, completionHandler: { (location, response, error) -> Void in
            guard let tempLocation = location, error == nil else {
                completion(nil)
                return
            }
            
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                try? FileManager.default.removeItem(at: destinationUrl)
            }
            
            do {
                try FileManager.default.moveItem(at: tempLocation, to: destinationUrl)
                completion(destinationUrl)
            } catch {
                completion(nil)
            }
        }).resume()
        
    }
        
}

extension ComReactNativeDocPreview: QLPreviewControllerDataSource {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return item as QLPreviewItem
    }
    
}

