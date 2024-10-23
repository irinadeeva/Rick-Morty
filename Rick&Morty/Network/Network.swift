import Foundation

final class Network: NSObject{
    
    static let shared = Network()

    private let session: URLSession = URLSession(configuration: .default)

    private var urlComponent = URLComponents(string: RequestConstants.baseURL)
    
    private lazy var decoder = JSONDecoder()

    override private init() { }

    func fetch<T: Decodable>(page: Int) async throws -> T? {
        let request = buildRequest(
            method: "GET",
            queryItems: [URLQueryItem(name: "page", value: "\(page)")]
        )

        let data = try await perform(request: request)

        return try decoder.decode(T.self, from: data)
    }
}

extension Network: URLSessionDelegate {
    func perform(request: URLRequest?) async throws -> Data {
        guard let request else {
            throw NetworkError.badRequest
        }

        return try ResponseHandler.shared.mapResponse(await session.data(for: request))
    }

    func buildRequest(method: String, queryItems: [URLQueryItem]) -> URLRequest? {
        urlComponent?.queryItems = queryItems

        guard let url = urlComponent?.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = method

        return request
    }

}
