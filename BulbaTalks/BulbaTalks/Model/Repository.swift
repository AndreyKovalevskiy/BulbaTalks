protocol Repository {
    func getHomeTimeline(since firstTweet: Tweet?, before lastTweet: Tweet?, completion: ([Tweet]) -> ())
}
