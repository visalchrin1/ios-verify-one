struct HttpRequest {
    let baseUrl: String
    let path: String
    let method: HttpMethod = HttpMethod.GET
    let parameters: [String: Any?] = [:]
}

