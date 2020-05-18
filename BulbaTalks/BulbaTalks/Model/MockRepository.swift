import Foundation

/**
 The repository that responsible for working with mock data from Twitter APIs.
 It uses prepared files stored in the project and works without access to the internet.
 */
class MockRepository: Repository {
    func getHomeTimeline(since firstTweet: Tweet?, until lastTweet: Tweet?, completion: ([Tweet]) -> Void) {
        let path = APIEndpoints.getHomeTimeLine(with: [:], queryParameters: [:], bodyParameters: [:]).path
        let jsonURL = URL(fileURLWithPath: path)
        if let data =  Bundle.main.contentsOfFile(at: jsonURL) {
            completion(try? JSONDecoder().decodeTwitterResponse([Tweet].self, from: data) ?? [])
        } else { completion([]) }
    }
}
