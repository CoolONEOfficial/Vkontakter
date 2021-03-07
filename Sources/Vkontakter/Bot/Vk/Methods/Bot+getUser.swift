// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

public extension Bot {

    /// Parameters container struct for `getUser` method
    class GetUserParams: JSONEncodable {

        /// Перечисленные через запятую идентификаторы пользователей или их короткие имена (screen_name). По умолчанию — идентификатор текущего пользователя.
        public let userIds: ArrayByComma<IdOrUsername>?
        
        /// Список дополнительных полей профилей, которые необходимо вернуть. См. подробное описание. Доступные значения: photo_id, verified, sex, bdate, city, country, home_town, has_photo, photo_50, photo_100, photo_200_orig, photo_200, photo_400_orig, photo_max, photo_max_orig, online, domain, has_mobile, contacts, site, education, universities, schools, status, last_seen, followers_count, common_count, occupation, nickname, relatives, relation, personal, connections, exports, activities, interests, music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, can_see_audio, can_write_private_message, can_send_friend_request, is_favorite, is_hidden_from_feed, timezone, screen_name, maiden_name, crop_photo, is_friend, friend_status, career, military, blacklisted, blacklisted_by_me, can_be_invited_group.
        public let fields: ArrayByComma<UserField>?
        
        /// Падеж для склонения имени и фамилии пользователя. Возможные значения: именительный – nom, родительный – gen, дательный – dat, винительный – acc, творительный – ins, предложный – abl. По умолчанию nom.
        public enum Name: String, Codable {
            /// abl
            case abl
        
            /// acc
            case acc
        
            /// dat
            case dat
        
            /// gen
            case gen
        
            /// ins
            case ins
        
            /// nom
            case nom
        }
        
        public let nameCase: Name?
        
        public init(userIds: ArrayByComma<IdOrUsername>? = nil, fields: ArrayByComma<UserField>? = nil, nameCase: Name? = nil) {
            self.userIds = userIds
            self.fields = fields
            self.nameCase = nameCase
        }
    
    }
    
    /**
     Возвращает расширенную информацию о пользователях.
     После успешного выполнения возвращает массив объектов пользователей.

     See also VK API Reference:
     [GetUser](https://vk.com/dev/users.get)
     
     - Parameters:
         - params: Parameters container, see `GetUserParams` struct
     - Throws: Throws on errors
     - Returns: Future of `[User]` type
     */
    @discardableResult
    func getUser(params: GetUserParams) throws -> Future<[User]> {
        let headers = httpHeaders(for: params)
        return try client
            .request(endpoint: "users.get", params: params, headers: headers)
            .flatMapThrowing { (container) -> [User] in
                return try self.processContainer(container)
        }
    }
}