// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Список объектов › Аудиозапись Объект, описывающий аудиозапись, содержит следующие поля: id integer идентификатор аудиозаписи. owner_id integer идентификатор владельца аудиозаписи. artist string исполнитель. title string название композиции. duration integer длительность аудиозаписи в секундах. url string ссылка на mp3. lyrics_id integer идентификатор текста аудиозаписи (если доступно). album_id integer идентификатор альбома, в котором находится аудиозапись (если присвоен). genre_id integer идентификатор жанра из списка аудио жанров. date integer дата добавления. no_search integer, [1] 1, если включена опция «Не выводить при поиске». Если опция отключена, поле не возвращается. is_hq integer, [1] 1, если аудио в высоком качестве.

 SeeAlso VK API Reference:
 [Audio](https://vk.com/dev/objects/audio
 */
public struct Audio: Codable {
    /// Идентификатор аудиозаписи.
    public let id: Int64?
    
    /// Идентификатор владельца аудиозаписи.
    public let ownerId: Int64?
    
    /// Исполнитель.
    public let artist: String?
    
    /// Название композиции.
    public let title: String?
    
    /// Длительность аудиозаписи в секундах.
    public let duration: Int64?
    
    /// Ссылка на mp3.
    public let url: String?
    
    /// Идентификатор текста аудиозаписи (если доступно).
    public let lyricsId: Int64?
    
    /// Идентификатор альбома, в котором находится аудиозапись (если присвоен).
    public let albumId: Int64?
    
    /// Идентификатор жанра из списка аудио жанров.
    public let genreId: Int64?
    
    /// Дата добавления.
    public let date: Int64?
    
    /// 1, если включена опция «Не выводить при поиске». Если опция отключена, поле не возвращается.
    public let noSearch: Int64?
    
    /// 1, если аудио в высоком качестве.
    public let isHq: Int64?
    
    /// При получении объектов, прямого доступа к которым может не быть, например, фотографий или видео в новостях, вместе с объектами приходит поле access_key, которое необходимо передавать при получении этих объектов напрямую или при совершении с ними действий. 
    public let accessKey: String?
    
    public init(id: Int64? = nil, ownerId: Int64? = nil, artist: String? = nil, title: String? = nil, duration: Int64? = nil, url: String? = nil, lyricsId: Int64? = nil, albumId: Int64? = nil, genreId: Int64? = nil, date: Int64? = nil, noSearch: Int64? = nil, isHq: Int64? = nil, accessKey: String? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.artist = artist
        self.title = title
        self.duration = duration
        self.url = url
        self.lyricsId = lyricsId
        self.albumId = albumId
        self.genreId = genreId
        self.date = date
        self.noSearch = noSearch
        self.isHq = isHq
        self.accessKey = accessKey
    }

}