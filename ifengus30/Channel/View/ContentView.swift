//
//  ContentView.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var jsonModel = JSONViewModel()
    @Environment (\.managedObjectContext) var context
    
    
    // Fetching Data From Core Data...
    @FetchRequest(entity: Topadsinfo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Topadsinfo.title, ascending: true)] ) var results : FetchedResults<Topadsinfo>
    

    var body: some View {
        NavigationView {
        VStack{
                // checking if core data exists
            if results.isEmpty{
                
                
                if jsonModel.topAds.isEmpty{
                    ProgressView()
                    // fetching Data...
                        .onAppear(perform: {
                            jsonModel.fetchData(context: context)
                        })
                    // when array is clear indicator appears
                    // as a result data is fetched again.
                }
                else{
                    List(jsonModel.topAds ,id: \.self){topAd in
                        // display fetched JSON Data...
                        //CardView(video : video)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                
            }
            else{
                    List(results){video in
                        // display fetched JSON Data...
                        //CardView(fetchedData : video)
                        Text(String(video.id))
                    }
                    .listStyle(InsetGroupedListStyle())
                NavigationLink(destination: AppMainView()) {
                    Text("进入首页")

                        
                }

        

            }
            
        }
       // .navigationTitle(!results.isEmpty ? "Fetched Core Data" : "Fetched JSON")
      //  .navigationBarTitleDisplayMode(.inline)

        
        // refreshButton...
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    // by clearing array data...
                    // it will auto fetch all data again...
                    
                    //clearing data in core data...
                    do{
                        results.forEach { (video) in
                            context.delete(video)
                        }
                        try context.save()
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                   
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                })
            }
            
        }
    }

    }

}




