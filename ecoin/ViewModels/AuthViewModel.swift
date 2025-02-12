import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var username = ""
    @Published var fetchedUsername = ""
    @Published var email = ""
    @Published var password = ""
    @Published var rePassword = ""
    @Published var isLoggedIn = false
    @Published var errorMessage = ""
    
    private let db = Firestore.firestore()

    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            self.errorMessage = "Vui lòng nhập đầy đủ thông tin."
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.isLoggedIn = true
                self.errorMessage = ""
                self.fetchUsername()
            }
        }
    }

    func signUp() {
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty, !rePassword.isEmpty else {
            self.errorMessage = "Vui lòng nhập đầy đủ thông tin."
            return
        }

        guard validatePassword() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else if let user = result?.user {
                self.isLoggedIn = true
                self.errorMessage = ""

                self.db.collection("users").document(user.uid).setData([
                    "username": self.username,
                    "email": self.email
                ]) { error in
                    if let error = error {
                        print("Error saving username: \(error.localizedDescription)")
                    }
                }
                
                self.fetchedUsername = self.username
            }
        }
    }
    
    func checkAuth() {
        DispatchQueue.main.async {
            self.isLoggedIn = Auth.auth().currentUser != nil
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.isLoggedIn = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func validatePassword() -> Bool {
           if password != rePassword {
               errorMessage = "Mật khẩu không khớp."
               return false
           }
           
           if password.count < 8 {
               errorMessage = "Mật khẩu phải có ít nhất 8 ký tự."
               return false
           }
           
           if password.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil {
               errorMessage = "Mật khẩu phải chứa ít nhất một ký tự đặc biệt hoặc số."
               return false
           }
           
           if password.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil {
               errorMessage = "Mật khẩu phải chứa ít nhất một số."
               return false
           }
           
           return true
       }
    
    func fetchUsername() {
       guard let uid = Auth.auth().currentUser?.uid else { return }
       
       db.collection("users").document(uid).getDocument { snapshot, error in
           if let data = snapshot?.data(), let username = data["username"] as? String {
               DispatchQueue.main.async {
                   self.fetchedUsername = username
               }
           }
       }
   }
}
