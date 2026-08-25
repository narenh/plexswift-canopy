import Foundation

extension Operations {
    /// Transcode an image held by the metadata provider, possibly changing format or size.
    ///
    /// `GET /photo/:/transcode` on `metadata.provider.plex.tv`. It is the same photo transcoder
    /// the media server exposes, at the same path and with the same parameters, which is why
    /// this operation mirrors ``Operations/TranscodeImage`` rather than inventing a shape of
    /// its own. Only the host differs — a provider artwork path is not resolvable against a
    /// media server.
    ///
    /// Most artwork on a Discover item needs nothing done to it: the entries in
    /// ``DiscoverMetadata/image`` are already absolute URLs on Plex's static host. This is for
    /// the provider-relative paths — ``DiscoverMetadata/thumb``, ``DiscoverMetadata/art`` and
    /// the parent and grandparent artwork — which are otherwise not addressable.
    ///
    /// To hand the image to a loader rather than fetch its bytes, build the request without
    /// sending it:
    ///
    /// ```swift
    /// var configuration = client.configuration
    /// configuration.tokenPlacement = .queryItem      // an image loader cannot set headers
    /// let request = try PlexClient(configuration: configuration)
    ///     .makeRequest(for: Operations.TranscodeDiscoverImage(url: item.thumb, width: 300))
    /// ```
    ///
    /// > Important: A URL built that way carries the token in its query. It grants what the
    /// token grants, so treat it as a credential and keep it out of logs.
    public struct TranscodeDiscoverImage: PlexOperation {
        public typealias Success = Data

        public static let operationID = "transcodeDiscoverImage"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.metadataProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The source path for the image to transcode, as it appears on the item — for example
        /// `/library/metadata/5d7768ba96b655001fdc0408/thumb/1618`.
        public var url: String?

        /// The output format for the image; defaults to jpg
        public var format: TranscodeImageFormat?

        /// The desired width of the output image
        public var width: Int?

        /// The desired height of the output image
        public var height: Int?

        /// The desired quality of the output. -1 means the highest quality. Defaults to -1
        public var quality: Int?

        /// Indicates if image should be upscaled to the desired width/height. Defaults to false
        public var upscale: BoolInt?

        /// Indicates if image should be scaled to fit the smaller dimension, allowing one
        /// dimension to overflow — which is what fills a poster tile rather than letterboxing
        /// it.
        public var minSize: BoolInt?

        /// Apply a blur to the image. Defaults to 0 (none)
        public var blur: Int?

        /// Scale the image saturation by the specified percentage. Defaults to 100
        public var saturation: Int?

        /// Render the image at the specified opacity percentage. Defaults to 100
        public var opacity: Int?

        /// Use the specified chroma subsampling.
        public var chromaSubsampling: TranscodeImageChromaSubsampling?

        /// The background color to apply before painting the image. Only really applicable if
        /// the image has transparency. Defaults to none
        public var background: String?

        public init(
            url: String? = nil,
            format: TranscodeImageFormat? = nil,
            width: Int? = nil,
            height: Int? = nil,
            quality: Int? = nil,
            upscale: BoolInt? = nil,
            minSize: BoolInt? = nil,
            blur: Int? = nil,
            saturation: Int? = nil,
            opacity: Int? = nil,
            chromaSubsampling: TranscodeImageChromaSubsampling? = nil,
            background: String? = nil
        ) {
            self.url = url
            self.format = format
            self.width = width
            self.height = height
            self.quality = quality
            self.upscale = upscale
            self.minSize = minSize
            self.blur = blur
            self.saturation = saturation
            self.opacity = opacity
            self.chromaSubsampling = chromaSubsampling
            self.background = background
        }

        public var path: String { "/photo/:/transcode" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = url {
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            if let value = format {
                items.append(URLQueryItem(name: "format", value: QueryValue(value).encoded))
            }
            if let value = width {
                items.append(URLQueryItem(name: "width", value: QueryValue(value).encoded))
            }
            if let value = height {
                items.append(URLQueryItem(name: "height", value: QueryValue(value).encoded))
            }
            if let value = quality {
                items.append(URLQueryItem(name: "quality", value: QueryValue(value).encoded))
            }
            if let value = upscale {
                items.append(URLQueryItem(name: "upscale", value: QueryValue(value).encoded))
            }
            if let value = minSize {
                items.append(URLQueryItem(name: "minSize", value: QueryValue(value).encoded))
            }
            if let value = blur {
                items.append(URLQueryItem(name: "blur", value: QueryValue(value).encoded))
            }
            if let value = saturation {
                items.append(URLQueryItem(name: "saturation", value: QueryValue(value).encoded))
            }
            if let value = opacity {
                items.append(URLQueryItem(name: "opacity", value: QueryValue(value).encoded))
            }
            if let value = chromaSubsampling {
                items.append(URLQueryItem(name: "chromaSubsampling", value: QueryValue(value).encoded))
            }
            if let value = background {
                items.append(URLQueryItem(name: "background", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
