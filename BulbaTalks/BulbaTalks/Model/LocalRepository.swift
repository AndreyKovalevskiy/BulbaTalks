import Foundation

class LocalRepository: Repository {
    func getHomeTimeline() -> [Tweet]? {
        let filenameWithJSON = "home_timeline"
        guard let data = FileReader.readLocalJSONFile(from: filenameWithJSON) else { return nil }

        do {
            let arrayOfTweets = try JSONDecoder().decodeTwitterResponse([Tweet].self, from: data)
            return arrayOfTweets
        } catch {
            return nil
        }
    }
}
