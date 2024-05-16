//
//  ImagenView.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import SwiftUI

struct ImagenProdView: View {
    
    let url: URL?
    let size: CGSize?
    
    init(url: URL?, size: CGSize? = nil) {
        self.url = url
        self.size = size
    }
    
    var body: some View {
        if let url = url {
            loadImagen(url: url)
        }
    }
    
    private func loadImagen(url: URL) -> some View {
        AsyncImage(url: url){imge in
            switch imge {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size?.width, height: size?.height)
            case .failure(_):
                failureView()
            case .empty:
                placeholderView()
            default:
                EmptyView()
            }
        }
    }
    
    private func placeholderView() -> some View {
        Image(NameImageDefault.placeholder.rawValue)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: size?.width, height: size?.height)
    }
    
    private func failureView() -> some View {
        Image(NameImageDefault.empty.rawValue)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: size?.width, height: size?.height)
    }
}

//#Preview {
//    ImagenView()
//}
