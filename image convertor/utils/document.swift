//
//  dockument_picker.swift
//  image convertor
//
//  Created by Кирилл on 29.10.2021.
//

import Foundation
import SwiftUI
import MobileCoreServices

struct DocumentPicker: UIViewControllerRepresentable{

    @Binding var pickerResult: [UIImage]
    
    func makeCoordinator() -> DocumentPicker.Coordinator {
        return DocumentPicker.Coordinator(parent1: self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeItem)], in: .open)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
    }
    class Coordinator: NSObject, UIDocumentPickerDelegate{
        
        var parent: DocumentPicker
        
        init(parent1: DocumentPicker)
        {
            parent = parent1
        }
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let data = try? Data(contentsOf: urls[0]) {
                if let image = UIImage(data: data) {
                    self.parent.pickerResult.append(image)
                }
            }
        }
    }
}
