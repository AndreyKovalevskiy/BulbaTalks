import Foundation

class LocalRepository: Repository {
    func getHomeTimeline() -> [Tweet]? {
        let filenameWithJSON = "home_timeline"
        guard let data = FileReader.readLocalJSONFile(from: filenameWithJSON) else { return nil }

        return try? JSONDecoder().decodeTwitterResponse([Tweet].self, from: data)
    }
}
