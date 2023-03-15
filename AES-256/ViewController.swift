//
//  ViewController.swift
//  AES-256
//
//  Created by Agustinch on 19/02/2023.
//

import UIKit

extension Data {
    var hexString: String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
           super.viewDidLoad()
           
           do {
               let encrypted = Data(base64Encoded: "M7NzUjvkIb1sH3lehUGBK8htl3SKfGBZ+Bb25AqXqLs=".data(using: .utf8)!)!
               let key = "RfUjXn2r5u8x/A?D(G+KbPeSgVkYp3s6".data(using: .utf8)!
               let iv = AES256.randomIv()

               let aes = try AES256(key: key, iv: iv)
               let decrypted = try aes.decrypt(encrypted)
               
               print("Encrypted: \(encrypted.hexString)")
               print("Decrypted: \(decrypted.hexString)")
               print("Key: \(key)")
               print(" ")
               print(String(data: decrypted, encoding: .utf8)!)

           } catch {
               print("Failed")
               print(error)
           }
       }


}

