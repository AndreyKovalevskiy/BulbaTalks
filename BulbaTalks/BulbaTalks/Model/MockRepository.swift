import Foundation

/**
 The repository that responsible for working with mock data from Twitter APIs.
 It uses prepared files stored in the project and works without access to the internet.
 */
class MockRepository: Repository {
    func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: ([Tweet]) -> Void) {
        let path = APIEndpoints.getHomeTimeLine(with: [:], queryParameters: [:], bodyParameters: [:]).path
        let fileURL = URL(fileURLWithPath: path)
        if let data =  Bundle.main.contentsOfFile(at: fileURL),
           let tweetsArray = try? JSONDecoder().decodeTwitterResponse([Tweet].self, from: data)
        {
            completion(tweetsArray)
        } else {
            completion([])
        }
    }
    
    func getAuthenticatedUser(completion: (User?) -> Void) {
        let path = APIEndpoints.getAuthenticatedUser(with: [:], queryParameters: [:], bodyParameters: [:]).path
        let fileURL = URL(fileURLWithPath: path)
        if let data =  Bundle.main.contentsOfFile(at: fileURL),
           let userArray = try? JSONDecoder().decodeTwitterResponse([User].self, from: data),
           !userArray.isEmpty
        {
            completion(userArray.first!)
        } else {
            completion(nil)
        }
    }
}
