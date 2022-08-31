//
//  ContentView.swift
//  TestGraphQLServer-Apollo
//
//  Created by Joanna Lingenfelter on 8/31/22.
//

import SwiftUI

typealias UserProfile = GetProfileQuery.Data.UserProfile.UserProfile

enum NetworkError: LocalizedError {
    case unknownError

    var errorDescription: String? {
        switch self {
        case .unknownError:
            return "An unknown error has occured"
        }
    }
}

struct ContentView: View {
    @State var isShowingError: Bool = false
    @State var error: String?
    @State var userProfile: UserProfile?
    @State var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 15) {
            Text(userProfile?.userId ?? "")
            PrimaryButton("Fetch User Profile", isLoading: $isLoading) {
                withAnimation {
                    fetchUserProfile()
                }
            }
        }
        .onAppear {

        }
        .alert(isPresented: $isShowingError) {
            Alert(title: Text("Error"),
                  message: Text(error ?? ""))
        }
        .padding()
    }

    func fetchUserProfile() {
        Task {
            isLoading = true
            do {
                try await Task.sleep(nanoseconds: NSEC_PER_SEC / 2)
                self.userProfile = try await fetchUserProfile()
            } catch {
                self.error = error.localizedDescription
            }
            isLoading = false
        }
    }

    private func fetchUserProfile() async throws -> UserProfile {
        try await withCheckedThrowingContinuation { continuation in
            Network.shared.apollo.fetch(query: GetProfileQuery()) { result in
              switch result {
              case .success(let graphQLResult):
                  guard let userProfile = graphQLResult.data?.userProfile.userProfile else {
                      continuation.resume(throwing: NetworkError.unknownError)
                      return
                  }

                  print(graphQLResult)
                  continuation.resume(returning: userProfile)
              case .failure(let error):
                  continuation.resume(throwing: error)
              }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
