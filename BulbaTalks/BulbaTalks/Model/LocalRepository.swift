import Foundation

class LocalRepository: Repository {
    func getHomeTimeline() -> [Tweet] {
        let jsonURL = URL(fileURLWithPath: Operation.getHomeTimeline.path)
        guard let data = FileReader.read(at: jsonURL) else { return [] }

        return (try? JSONDecoder().decodeTwitterResponse([Tweet].self, from: data)) ?? []
    }
}
