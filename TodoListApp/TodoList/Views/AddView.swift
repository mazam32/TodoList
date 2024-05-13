//
//  AddView.swift
//  TodoList
//
//  Created by Muhammad Hamd Azam on 5/7/24.
//

import SwiftUI

struct AddView: View {
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {Text("Save").textCase(.uppercase)
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        
                })
            }
            .padding(14)
        }.navigationTitle("Add an item 🖊️")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be atleast 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
    
}
