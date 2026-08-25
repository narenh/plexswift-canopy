// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Transcode an image, possibly changing format or size
    public struct TranscodeImage: PlexOperation {
        public typealias Success = Data

        public static let operationID = "transcodeImage"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The source URL for the image to transcode. Note, if this URL requires a token such as
        /// `X-Plex-Token`, it should be given as a query parameter to this url.
        public var url: String?

        /// The output format for the image; defaults to jpg
        public var format: TranscodeImageFormat?

        /// The desired width of the output image
        public var width: Int?

        /// The desired height of the output image
        public var height: Int?

        /// The desired quality of the output. -1 means the highest quality. Defaults to -1
        public var quality: Int?

        /// The background color to apply before painting the image. Only really applicable if image has
        /// transparency. Defaults to none
        public var background: String?

        /// Indicates if image should be upscaled to the desired width/height. Defaults to false
        public var upscale: BoolInt?

        /// Indicates if image should be scaled to fit the smaller dimension. By default (false) the image
        /// is scaled to fit within the width/height specified but if this parameter is true, it will allow
        /// overflowing one dimension to fit the other. Essentially it is making the width/height minimum
        /// sizes of the image or sizing the image to fill the entire width/height even if it overflows one
        /// dimension.
        public var minSize: BoolInt?

        /// Obey the rotation values specified in EXIF data. Defaults to true.
        public var rotate: BoolInt?

        /// Apply a blur to the image, Defaults to 0 (none)
        public var blur: Int?

        /// Scale the image saturation by the specified percentage. Defaults to 100
        public var saturation: Int?

        /// Render the image at the specified opacity percentage. Defaults to 100
        public var opacity: Int?

        /// Use the specified chroma subsambling.
        /// - 0: 411
        /// - 1: 420
        /// - 2: 422
        /// - 3: 444
        /// Defaults to 3 (444)
        public var chromaSubsampling: TranscodeImageChromaSubsampling?

        /// The color to blend with the image. Defaults to none
        public var blendColor: String?

        public init(
            url: String? = nil,
            format: TranscodeImageFormat? = nil,
            width: Int? = nil,
            height: Int? = nil,
            quality: Int? = nil,
            background: String? = nil,
            upscale: BoolInt? = nil,
            minSize: BoolInt? = nil,
            rotate: BoolInt? = nil,
            blur: Int? = nil,
            saturation: Int? = nil,
            opacity: Int? = nil,
            chromaSubsampling: TranscodeImageChromaSubsampling? = nil,
            blendColor: String? = nil
        ) {
            self.url = url
            self.format = format
            self.width = width
            self.height = height
            self.quality = quality
            self.background = background
            self.upscale = upscale
            self.minSize = minSize
            self.rotate = rotate
            self.blur = blur
            self.saturation = saturation
            self.opacity = opacity
            self.chromaSubsampling = chromaSubsampling
            self.blendColor = blendColor
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
            if let value = background {
                items.append(URLQueryItem(name: "background", value: QueryValue(value).encoded))
            }
            if let value = upscale {
                items.append(URLQueryItem(name: "upscale", value: QueryValue(value).encoded))
            }
            if let value = minSize {
                items.append(URLQueryItem(name: "minSize", value: QueryValue(value).encoded))
            }
            if let value = rotate {
                items.append(URLQueryItem(name: "rotate", value: QueryValue(value).encoded))
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
            if let value = blendColor {
                items.append(URLQueryItem(name: "blendColor", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
