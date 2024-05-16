//
//  HomeView.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView(){
            VStack {
                HeaderViewProd()
                BodyTextViewProd()
                ButtonShowMoreViewProd()
                Spacer()
            }
        }
    }
}

struct HeaderViewProd : View {
    var body: some View {
        Image(NameImageDefault.presentation.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: 350,height: 400)
        
    }
}

struct BodyTextViewProd : View {
    var body: some View {
        VStack{
            Text("Buscas los mejores Productos?")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom,8)
            Text("Tenemos los mejores productos y los mejores precios")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom,40)
            
        }
    }
}

struct ButtonShowMoreViewProd : View {
    var body: some View {
        NavigationLink(destination: ProductoListFactory.create){
            Text("Ver productos")
                .padding(.horizontal,40)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.primaryColor)
                .cornerRadius(10)
        }
    }
}


#Preview {
    HomeView()
}
