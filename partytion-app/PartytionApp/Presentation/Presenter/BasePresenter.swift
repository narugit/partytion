protocol BasePresenter {
    var nextView: String { get }
    func setNextViewController() -> Void
}
