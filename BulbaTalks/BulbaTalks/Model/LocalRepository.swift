import Foundation

class LocalRepository: Repository {
    func getHomeTimeline() -> [Tweet] {
        let jsonURL = URL(fileURLWithPath: "MockedTwitterResponses/1.1/Statuses/home_timeline.json")
        guard let data = FileReader.read(at: jsonURL) else { return [] }

        return (try? JSONDecoder().decodeTwitterResponse([Tweet].self, from: data)) ?? []
    }
}
