//
//  CardDetailView.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import SwiftUI

struct CardDetailProdView: View {
    
    var product : ProductoListPresentable
    @State private var index = 0
    var body: some View {
        VStack{
            VStack{
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            HStack{
                Text("CAT: \(product.name.uppercased())")
                    .font(.title3)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
            }
            TabView(selection: $index){
                ForEach(Array(product.imagen.enumerated()), id: \.element){ (index, imageName) in
                    ImagenProdView(url: URL(string: String(imageName)), size: CGSize(width: 350, height: 550))

                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding()
            if product.imagen.count > 1 {
                HStack(spacing: 2){
                    ForEach(0..<product.imagen.count, id: \.self){
                        circleIndex in
                        Circle()
                            .fill(circleIndex == self.index ? Color.primaryColor : Color.gray.opacity(0.5))
                            .frame(width: 10, height: 10)
                    }
                }
            }
            VStack{
                Text(String(product.precio))
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }.frame(height: 550)
    }
}

//#Preview {
//    CardDetailView()
//}
