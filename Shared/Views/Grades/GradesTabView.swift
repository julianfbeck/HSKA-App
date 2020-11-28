//
//  GradesTabView.swift
//  Shared
//
//  Created by Julian Beck on 13.09.20.
//

import SwiftUI

struct GradesTabView: View {
    @ObservedObject private var viewModel = GradesViewModel(client: .init())
    @State var isLoggedIn = LoginService.isLogedIn
    @State private var user = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var isTyingToLogIn = false


    var body: some View {
        Header(title: "Grades") {
            if isLoggedIn {
                VStack(spacing: 0){
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        Button(action: {
                            LoginService.resetAccessToken()
                            self.user = ""
                            self.password = ""
                            self.isLoggedIn = false
                        }){
                            
                            Text("Log Out").font(.roundedSmallerHeadline)
                                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(7)
                        }.padding()
                        VStack(spacing: 10) {
                            ForEach(self.viewModel.grades, id: \.examName) { grade in
                                GradeListItemView(grade: grade)
                            }
                            Text("").padding(.bottom,100)
                            
                        }
                    }
                }
            } else {
                VStack() {
                    Text("Login") .font(.roundedHeadlineBig).foregroundColor(Color(UIColor.label))
                        .padding([.top, .bottom], 40)
                    VStack(alignment: .leading, spacing: 20) {
                        
                        TextField("User \"abcd1234\" ", text: self.$user).foregroundColor(Color(UIColor.secondaryLabel))
                            .padding()
                            .background(Color(UIColor.tertiarySystemBackground))
                            .cornerRadius(20.0)
                        
                        SecureField("Password", text: self.$password).foregroundColor(Color(UIColor.secondaryLabel))
                            .padding()
                            .background(Color(UIColor.tertiarySystemBackground))
                            .cornerRadius(20.0)
                        
                    }.padding([.leading, .trailing], 27.5)
                    
                    Button(action: {
                        isTyingToLogIn = true
                        LoginService.tryLogin(user: self.user, password: self.password) { isLoggedInResponse in
                            DispatchQueue.main.async {
                                isTyingToLogIn = false
                                if !isLoggedInResponse {
                                    showingAlert = true
                                    self.user = ""
                                    self.password = ""
                                }
                                self.isLoggedIn = isLoggedInResponse
                                self.viewModel.updateGrades()
                            }
                        }
                    }){
                        Text("Log In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(user == "" || password == "" || isTyingToLogIn ? Color.gray : Color.red)
                            .cornerRadius(15.0)
                    }.disabled(user == "" || password == "" || isTyingToLogIn)

                    
                    Spacer()
                    
                } .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Wrong User or Password"), dismissButton: .default(Text("Please try again")))
                }
            }
            
        }
    }
}

struct GradesTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GradesTabView()
                .environment(\.colorScheme, .dark)
            GradesTabView()
                .environment(\.colorScheme, .light)
        }
        
    }
}
