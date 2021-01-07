// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Список объектов › Пользователь 1. Базовые поля 2. Опциональные поля A-L 3. Опциональные поля M-W Объект содержит информацию о пользователе ВКонтакте. Набор полей может меняться в зависимости от вызванного метода и переданных в нем параметров. Обратите внимание — все поля использующие информацию о текущем пользователе (например, blacklisted_by_me) требуют передачи ключа доступа пользователя в запросе, даже если сам метод можно вызывать без ключа доступа.

 SeeAlso VK API Reference:
 [User](https://vk.com/dev/objects/user
 */
public struct User: Codable {
    /// Идентификатор пользователя.
    public let id: Int64
    
    /// Имя.
    public let firstName: String
    
    /// Фамилия.
    public let lastName: String
    
    /// Поле возвращается, если страница пользователя удалена или заблокирована, содержит значение deleted или banned. В этом случае опциональные поля не возвращаются.
    public let deactivated: String
    
    /// Скрыт ли профиль пользователя настройками приватности.
    public let isClosed: Bool
    
    /// Может ли текущий пользователь видеть профиль при is_closed = 1 (например, он есть в друзьях).
    public let canAccessClosed: Bool
    
    /// Содержимое поля «О себе» из профиля.
    public let about: String?
    
    /// Содержимое поля «Деятельность» из профиля.
    public let activities: String?
    
    /// Дата рождения. Возвращается в формате D.M.YYYY или D.M (если год рождения скрыт). Если дата рождения скрыта целиком, поле отсутствует в ответе.
    public let bdate: String?
    
    /// Информация о том, находится ли текущий пользователь в черном списке.
    public let blacklisted: VkFlag?
    
    /// Информация о том, находится ли пользователь в черном списке у текущего пользователя.
    public let blacklistedByMe: VkFlag?
    
    /// Содержимое поля «Любимые книги» из профиля пользователя.
    public let books: String?
    
    /// Информация о том, может ли текущий пользователь оставлять записи на стене.
    public let canPost: VkFlag?
    
    /// Информация о том, может ли текущий пользователь видеть чужие записи на стене.
    public let canSeeAllPosts: VkFlag?
    
    /// Информация о том, может ли текущий пользователь видеть аудиозаписи.
    public let canSeeAudio: VkFlag?
    
    /// Информация о том, будет ли отправлено уведомление пользователю о заявке в друзья от текущего пользователя.
    public let canSendFriendRequest: VkFlag?
    
    /// Информация о том, может ли текущий пользователь отправить личное сообщение.
    public let canWritePrivateMessage: VkFlag?
    
    /// Информация о карьере пользователя.
    public struct Career: Codable {
        
        /// Идентификатор сообщества (если доступно, иначе company).
        public let groupId: UInt64?
        
        /// Название компании (если доступно, иначе group_id).
        public let company: String?
        
        /// Идентификатор страны.
        public let countryId: Int64?
        
        /// Идентификатор города (если доступно, иначе city_name).
        public let cityId: Int64?
        
        /// Название города (если доступно, иначе city_id).
        public let cityName: String?
        
        /// Год начала работы.
        public let from: Int64?
        
        /// Год окончания работы.
        public let until: Int64?
        
        /// Должность.
        public let position: String?
        
        public init(groupId: UInt64? = nil, company: String? = nil, countryId: Int64? = nil, cityId: Int64? = nil, cityName: String? = nil, from: Int64? = nil, until: Int64? = nil, position: String? = nil) {
            self.groupId = groupId
            self.company = company
            self.countryId = countryId
            self.cityId = cityId
            self.cityName = cityName
            self.from = from
            self.until = until
            self.position = position
        }
    }
    
    public let career: Career?
    
    /// Информация о городе, указанном на странице пользователя в разделе «Контакты».
    public struct City: Codable {
        
        /// Идентификатор города, который можно использовать для получения его названия с помощью метода database.getCitiesById.
        public let id: Int64?
        
        /// Название города.
        public let title: String?
        
        public init(id: Int64? = nil, title: String? = nil) {
            self.id = id
            self.title = title
        }
    }
    
    public let city: City?
    
    /// Количество общих друзей с текущим пользователем.
    public let commonCount: Int64?
    
    /// Возвращает данные об указанных в профиле сервисах пользователя, таких как: skype, facebook, twitter, livejournal, instagram. Для каждого сервиса возвращается отдельное поле с типом string, содержащее никнейм пользователя. Например, "instagram": "username".
    public let connections: [String: String]?
    
    /// Информация о телефонных номерах пользователя.
    public struct Contacts: Codable {
        
        /// Номер мобильного телефона пользователя (только для Standalone-приложений).
        public let mobilePhone: String?
        
        /// Дополнительный номер телефона пользователя.
        public let homePhone: String?
        
        public init(mobilePhone: String? = nil, homePhone: String? = nil) {
            self.mobilePhone = mobilePhone
            self.homePhone = homePhone
        }
    }
    
    public let contacts: Contacts?
    
    /// Количество различных объектов у пользователя. Поле возвращается только в методе при запросе информации об одном пользователе, с передачей пользовательского .
    public struct Counters: Codable {
        
        /// Количество фотоальбомов.
        public let albums: Int64?
        
        /// Количество видеозаписей.
        public let videos: Int64?
        
        /// Количество аудиозаписей.
        public let audios: Int64?
        
        /// Количество фотографий.
        public let photos: Int64?
        
        /// Количество заметок.
        public let notes: Int64?
        
        /// Количество друзей.
        public let friends: Int64?
        
        /// Количество сообществ.
        public let groups: Int64?
        
        /// Количество друзей онлайн.
        public let onlineFriends: Int64?
        
        /// Количество общих друзей.
        public let mutualFriends: Int64?
        
        /// Количество видеозаписей с пользователем.
        public let userVideos: Int64?
        
        /// Количество подписчиков.
        public let followers: Int64?
        
        /// Количество объектов в блоке «Интересные страницы».
        public struct Pages: Codable {
            
            
            public init() {
            }
        }
        
        public let pages: Pages?
        
        public init(albums: Int64? = nil, videos: Int64? = nil, audios: Int64? = nil, photos: Int64? = nil, notes: Int64? = nil, friends: Int64? = nil, groups: Int64? = nil, onlineFriends: Int64? = nil, mutualFriends: Int64? = nil, userVideos: Int64? = nil, followers: Int64? = nil, pages: Pages? = nil) {
            self.albums = albums
            self.videos = videos
            self.audios = audios
            self.photos = photos
            self.notes = notes
            self.friends = friends
            self.groups = groups
            self.onlineFriends = onlineFriends
            self.mutualFriends = mutualFriends
            self.userVideos = userVideos
            self.followers = followers
            self.pages = pages
        }
    }
    
    public let counters: Counters?
    
    /// Информация о стране, указанной на странице пользователя в разделе «Контакты».
    public struct Country: Codable {
        
        /// Идентификатор страны, который можно использовать для получения ее названия с помощью метода database.getCountriesById.
        public let id: Int64?
        
        /// Название страны.
        public let title: String?
        
        public init(id: Int64? = nil, title: String? = nil) {
            self.id = id
            self.title = title
        }
    }
    
    public let country: Country?
    
    /// Возвращает данные о точках, по которым вырезаны профильная и миниатюрная фотографии пользователя, при наличии.
    public struct CropPhoto: Codable {
        
        /// Объект photo фотографии пользователя, из которой вырезается главное фото профиля.
        public let photo: Photo?
        
        /// Вырезанная фотография пользователя. Содержит следующие поля: 
        public struct Crop: Codable {
            
            /// Координата X левого верхнего угла в процентах.
            public let x: Int64?
            
            /// Координата Y левого верхнего угла в процентах.
            public let y: Int64?
            
            /// Координата X правого нижнего угла в процентах.
            public let x2: Int64?
            
            /// Координата Y правого нижнего угла в процентах.
            public let y2: Int64?
            
            public init(x: Int64? = nil, y: Int64? = nil, x2: Int64? = nil, y2: Int64? = nil) {
                self.x = x
                self.y = y
                self.x2 = x2
                self.y2 = y2
            }
        }
        
        public let crop: Crop?
        
        /// Миниатюрная квадратная фотография, вырезанная из фотографии crop. Содержит набор полей, аналогичный объекту crop.
        public typealias Rect = Crop
        
        public let rect: Rect?
        
        public init(photo: Photo? = nil, crop: Crop? = nil, rect: Rect? = nil) {
            self.photo = photo
            self.crop = crop
            self.rect = rect
        }
    }
    
    public let cropPhoto: CropPhoto?
    
    /// Короткий адрес страницы. Возвращается строка, содержащая короткий адрес страницы (например, andrew). Если он не назначен, возвращается "id"+user_id, например, id35828305.
    public let domain: String?
    
    /// Информация о высшем учебном заведении пользователя.
    public struct Education: Codable {
        
        /// Идентификатор университета.
        public let university: Int64?
        
        /// Название университета.
        public let universityName: String?
        
        /// Идентификатор факультета.
        public let faculty: Int64?
        
        /// Название факультета.
        public let facultyName: String?
        
        /// Год окончания.
        public let graduation: Int64?
        
        public init(university: Int64? = nil, universityName: String? = nil, faculty: Int64? = nil, facultyName: String? = nil, graduation: Int64? = nil) {
            self.university = university
            self.universityName = universityName
            self.faculty = faculty
            self.facultyName = facultyName
            self.graduation = graduation
        }
    }
    
    public let education: Education?
    
    /// Внешние сервисы, в которые настроен экспорт из ВК (twitter, facebook, livejournal, instagram).
    public let exports: String?
    
    /// Имя в заданном падеже.
    public enum FirstName: String, Codable {
        /// dat — дательный;
        case dat
    
        /// nom — именительный;
        case nom
    
        /// abl — предложный.
        case abl
    
        /// gen — родительный;
        case gen
    
        /// ins — творительный;
        case ins
    
        /// acc — винительный;
        case acc
    }
    
    public let firstNameCase: FirstName?
    
    /// Количество подписчиков пользователя.
    public let followersCount: Int64?
    
    /// Статус дружбы с пользователем.
    public enum FriendStatus: Int64, Codable {
        /// 3 — является другом.
        case avlaetsa_drugom = 3
    
        /// 2 — имеется входящая заявка/подписка от пользователя,
        case imeetsa_vhodasaa_zaavka_podpiska_ot_polzovatela = 2
    
        /// 0 — не является другом,
        case ne_avlaetsa_drugom = 0
    
        /// 1 — отправлена заявка/подписка пользователю,
        case otpravlena_zaavka_podpiska_polzovatelu = 1
    }
    
    public let friendStatus: FriendStatus?
    
    /// Содержимое поля «Любимые игры» из профиля.
    public let games: String?
    
    /// Информация о том, известен ли номер мобильного телефона пользователя. Возвращаемые значения: 1 — известен, 0 — не известен.
    public let hasMobile: VkFlag?
    
    /// 1, если пользователь установил фотографию для профиля.
    public let hasPhoto: VkFlag?
    
    /// Название родного города.
    public let homeTown: String?
    
    /// Содержимое поля «Интересы» из профиля.
    public let interests: String?
    
    /// Информация о том, есть ли пользователь в закладках у текущего пользователя.
    public let isFavorite: VkFlag?
    
    /// Информация о том, является ли пользователь другом текущего пользователя.
    public let isFriend: VkFlag?
    
    /// Информация о том, скрыт ли пользователь из ленты новостей текущего пользователя.
    public let isHiddenFromFeed: VkFlag?
    
    /// Фамилия в заданном падеже.
    public enum LastName: String, Codable {
        /// dat — дательный;
        case dat
    
        /// nom — именительный;
        case nom
    
        /// abl — предложный.
        case abl
    
        /// gen — родительный;
        case gen
    
        /// ins — творительный;
        case ins
    
        /// acc — винительный;
        case acc
    }
    
    public let lastNameCase: LastName?
    
    /// Время последнего посещения.
    public struct LastSeen: Codable {
        
        /// Время последнего посещения в формате Unixtime.
        public let time: UInt64?
        
        /// Тип платформы. Возможные значения: 
        public enum Platform: Int64, Codable {
            /// 1 — мобильная версия;
            case mobilnaa_versia = 1
        
            /// 7 — полная версия сайта.
            case polnaa_versia_sajta = 7
        
            /// 4 — приложение для Android;
            case prilozenie_dla_android = 4
        
            /// 3 — приложение для iPad;
            case prilozenie_dla_ipad = 3
        
            /// 2 — приложение для iPhone;
            case prilozenie_dla_iphone = 2
        
            /// 6 — приложение для Windows 10;
            case prilozenie_dla_windows_10 = 6
        
            /// 5 — приложение для Windows Phone;
            case prilozenie_dla_windows_phone = 5
        }
        
        public let platform: Platform?
        
        public init(time: UInt64? = nil, platform: Platform? = nil) {
            self.time = time
            self.platform = platform
        }
    }
    
    public let lastSeen: LastSeen?
    
    /// Разделенные запятой идентификаторы списков друзей, в которых состоит пользователь. Поле доступно только для метода friends.get.
    public let lists: String?
    
    /// Девичья фамилия.
    public let maidenName: String?
    
    /// Информация о военной службе пользователя.
    public struct Military: Codable {
        
        /// Номер части.
        public let unit: String?
        
        /// Идентификатор части в базе данных.
        public let unitId: Int64?
        
        /// Идентификатор страны, в которой находится часть.
        public let countryId: Int64?
        
        /// Год начала службы.
        public let from: Int64?
        
        /// Год окончания службы.
        public let until: Int64?
        
        public init(unit: String? = nil, unitId: Int64? = nil, countryId: Int64? = nil, from: Int64? = nil, until: Int64? = nil) {
            self.unit = unit
            self.unitId = unitId
            self.countryId = countryId
            self.from = from
            self.until = until
        }
    }
    
    public let military: Military?
    
    /// Содержимое поля «Любимые фильмы» из профиля пользователя.
    public let movies: String?
    
    /// Содержимое поля «Любимая музыка» из профиля пользователя.
    public let music: String?
    
    /// Никнейм (отчество) пользователя.
    public let nickname: String?
    
    /// Информация о текущем роде занятия пользователя.
    public struct Occupation: Codable {
        
        /// Тип. Возможные значения: 
        public enum `Type`: String, Codable {
            /// work — работа;
            case work
        
            /// school — среднее образование;
            case school
        
            /// university — высшее образование.
            case university
        }
        
        public let `type`: Type?
        
        /// Идентификатор школы, вуза, сообщества компании (в которой пользователь работает).
        public let id: Int64?
        
        /// Название школы, вуза или места работы.
        public let name: String?
        
        public init(type: Type? = nil, id: Int64? = nil, name: String? = nil) {
            self.type = `type`
            self.id = id
            self.name = name
        }
    }
    
    public let occupation: Occupation?
    
    /// Информация о том, находится ли пользователь сейчас на сайте. Если пользователь использует мобильное приложение либо мобильную версию, возвращается дополнительное поле online_mobile, содержащее 1. При этом, если используется именно приложение, дополнительно возвращается поле online_app, содержащее его идентификатор.
    public let online: VkFlag?
    
    /// Информация о полях из раздела «Жизненная позиция».
    public struct Personal: Codable {
        
        /// Политические предпочтения. Возможные значения: 
        public enum Political: Int64, Codable {
            /// 8 — индифферентные;
            case indifferentnye = 8
        
            /// 1 — коммунистические;
            case kommunisticeskie = 1
        
            /// 5 — консервативные;
            case konservativnye = 5
        
            /// 4 — либеральные;
            case liberalnye = 4
        
            /// 9 — либертарианские.
            case libertarianskie = 9
        
            /// 6 — монархические;
            case monarhiceskie = 6
        
            /// 2 — социалистические;
            case socialisticeskie = 2
        
            /// 7 — ультраконсервативные;
            case ultrakonservativnye = 7
        
            /// 3 — умеренные;
            case umerennye = 3
        }
        
        public let political: Political?
        
        /// Языки.
        public let langs: [String]?
        
        /// Мировоззрение.
        public let religion: String?
        
        /// Источники вдохновения.
        public let inspiredBy: String?
        
        /// Главное в людях. Возможные значения: 
        public enum PeopleMain: Int64, Codable {
            /// 2 — доброта и честность;
            case dobrota_i_cestnost = 2
        
            /// 3 — красота и здоровье;
            case krasota_i_zdorove = 3
        
            /// 5 — смелость и упорство;
            case smelost_i_uporstvo = 5
        
            /// 1 — ум и креативность;
            case um_i_kreativnost = 1
        
            /// 6 — юмор и жизнелюбие.
            case umor_i_ziznelubie = 6
        
            /// 4 — власть и богатство;
            case vlast_i_bogatstvo = 4
        }
        
        public let peopleMain: PeopleMain?
        
        /// Главное в жизни. Возможные значения: 
        public enum LifeMain: Int64, Codable {
            /// 2 — карьера и деньги;
            case karera_i_dengi = 2
        
            /// 7 — красота и искусство;
            case krasota_i_iskusstvo = 7
        
            /// 4 — наука и исследования;
            case nauka_i_issledovania = 4
        
            /// 3 — развлечения и отдых;
            case razvlecenia_i_otdyh = 3
        
            /// 6 — саморазвитие;
            case samorazvitie = 6
        
            /// 1 — семья и дети;
            case sema_i_deti = 1
        
            /// 8 — слава и влияние;
            case slava_i_vlianie = 8
        
            /// 5 — совершенствование мира;
            case soversenstvovanie_mira = 5
        }
        
        public let lifeMain: LifeMain?
        
        /// Отношение к курению. Возможные значения: 
        public enum Smoking: Int64, Codable {
            /// 3 — компромиссное;
            case kompromissnoe = 3
        
            /// 2 — негативное;
            case negativnoe = 2
        
            /// 4 — нейтральное;
            case nejtralnoe = 4
        
            /// 5 — положительное.
            case polozitelnoe = 5
        
            /// 1 — резко негативное;
            case rezko_negativnoe = 1
        }
        
        public let smoking: Smoking?
        
        /// Отношение к алкоголю. Возможные значения: 
        public enum Alcohol: Int64, Codable {
            /// 3 — компромиссное;
            case kompromissnoe = 3
        
            /// 2 — негативное;
            case negativnoe = 2
        
            /// 4 — нейтральное;
            case nejtralnoe = 4
        
            /// 5 — положительное.
            case polozitelnoe = 5
        
            /// 1 — резко негативное;
            case rezko_negativnoe = 1
        }
        
        public let alcohol: Alcohol?
        
        public init(political: Political? = nil, langs: [String]? = nil, religion: String? = nil, inspiredBy: String? = nil, peopleMain: PeopleMain? = nil, lifeMain: LifeMain? = nil, smoking: Smoking? = nil, alcohol: Alcohol? = nil) {
            self.political = political
            self.langs = langs
            self.religion = religion
            self.inspiredBy = inspiredBy
            self.peopleMain = peopleMain
            self.lifeMain = lifeMain
            self.smoking = smoking
            self.alcohol = alcohol
        }
    }
    
    public let personal: Personal?
    
    /// Url квадратной фотографии пользователя, имеющей ширину 50 пикселей. В случае отсутствия у пользователя фотографии возвращается https://vk.com/images/camera_50.png.
    public let photo50: String?
    
    /// Url квадратной фотографии пользователя, имеющей ширину 100 пикселей. В случае отсутствия у пользователя фотографии возвращается https://vk.com/images/camera_100.png.
    public let photo100: String?
    
    /// Url фотографии пользователя, имеющей ширину 200 пикселей. В случае отсутствия у пользователя фотографии возвращается https://vk.com/images/camera_200.png.
    public let photo200Orig: String?
    
    /// Url квадратной фотографии, имеющей ширину 200 пикселей. Если у пользователя отсутствует фотография таких размеров, в ответе вернется https://vk.com/images/camera_200.
    public let photo200: String?
    
    /// Url фотографии, имеющей ширину 400 пикселей. Если у пользователя отсутствует фотография такого размера, в ответе вернется https://vk.com/images/camera_400.png.
    public let photo400Orig: String?
    
    /// Строковый идентификатор главной фотографии профиля пользователя в формате {user_id}_{photo_id}, например, 6492_192164258. Обратите внимание, это поле может отсутствовать в ответе.
    public let photoId: String?
    
    /// Url квадратной фотографии с максимальной шириной. Может быть возвращена фотография, имеющая ширину как 200, так и 100 пикселей. В случае отсутствия у пользователя фотографии возвращается https://vk.com/images/camera_200.png.
    public let photoMax: String?
    
    /// Url фотографии максимального размера. Может быть возвращена фотография, имеющая ширину как 400, так и 200 пикселей. В случае отсутствия у пользователя фотографии возвращается https://vk.com/images/camera_400.png.
    public let photoMaxOrig: String?
    
    /// Любимые цитаты.
    public let quotes: String?
    
    /// Список родственников.
    public struct Relatives: Codable {
        
        /// Идентификатор пользователя.
        public let id: Int64?
        
        /// Имя родственника (если родственник не является пользователем ВКонтакте, то предыдущее значение id возвращено не будет).
        public let name: String?
        
        /// Тип родственной связи. Возможные значения: 
        public enum `Type`: String, Codable {
            /// sibling — брат/сестра;
            case sibling
        
            /// grandparent — дедушка/бабушка;
            case grandparent
        
            /// parent — отец/мать;
            case parent
        
            /// child — сын/дочь;
            case child
        
            /// grandchild — внук/внучка.
            case grandchild
        }
        
        public let `type`: Type?
        
        public init(id: Int64? = nil, name: String? = nil, type: Type? = nil) {
            self.id = id
            self.name = name
            self.type = `type`
        }
    }
    
    public let relatives: [Relatives]?
    
    /// Семейное положение.
    public enum Relation: Int64, Codable {
        /// 2 — есть друг/есть подруга;
        case est_drug_est_podruga = 2
    
        /// 0 — не указано.
        case ne_ukazano = 0
    
        /// 1 — не женат/не замужем;
        case ne_zenat_ne_zamuzem = 1
    
        /// 3 — помолвлен/помолвлена;
        case pomolvlen_pomolvlena = 3
    
        /// 6 — в активном поиске;
        case v_aktivnom_poiske = 6
    
        /// 8 — в гражданском браке;
        case v_grazdanskom_brake = 8
    
        /// 7 — влюблён/влюблена;
        case vlublen_vlublena = 7
    
        /// 5 — всё сложно;
        case vse_slozno = 5
    
        /// 4 — женат/замужем;
        case zenat_zamuzem = 4
    }
    
    public let relation: Relation?
    
    /// Список школ, в которых учился пользователь. Массив объектов, описывающих школы.
    public struct Schools: Codable {
        
        /// Идентификатор школы.
        public let id: Int64?
        
        /// Идентификатор страны, в которой расположена школа.
        public let country: Int64?
        
        /// Идентификатор города, в котором расположена школа.
        public let city: Int64?
        
        /// Наименование школы
        public let name: String?
        
        /// Год начала обучения.
        public let yearFrom: Int64?
        
        /// Год окончания обучения.
        public let yearTo: Int64?
        
        /// Год выпуска.
        public let yearGraduated: Int64?
        
        /// Буква класса.
        public let `class`: String?
        
        /// Специализация.
        public let speciality: String?
        
        /// Идентификатор типа.
        public let `type`: Int64?
        
        /// Название типа. Возможные значения для пар type-typeStr: 
        public enum TypeStr: String, Codable {
            /// 1 — "гимназия";
            case gimnazia = "1"
        
            /// 8 — "колледж";
            case kolledz = "8"
        
            /// 2 —"лицей";
            case licej = "2"
        
            /// 9 — "профессиональный лицей";
            case professionalnyj_licej = "9"
        
            /// 11 — "ПТУ";
            case ptu = "11"
        
            /// 0 — "школа";
            case skola = "0"
        
            /// 7 — "школа художественная";
            case skola_hudozestvennaa = "7"
        
            /// 13 — "школа искусств".
            case skola_iskusstv = "13"
        
            /// 5 — "школа музыкальная";
            case skola_muzykalnaa = "5"
        
            /// 6 — "школа спортивная";
            case skola_sportivnaa = "6"
        
            /// 4 — "школа вечерняя";
            case skola_vecernaa = "4"
        
            /// 3 — "школа-интернат";
            case skolainternat = "3"
        
            /// 10 — "техникум";
            case tehnikum = "10"
        
            /// 12 — "училище";
            case ucilise = "12"
        }
        
        public let typeStr: TypeStr?
        
        public init(id: Int64? = nil, country: Int64? = nil, city: Int64? = nil, name: String? = nil, yearFrom: Int64? = nil, yearTo: Int64? = nil, yearGraduated: Int64? = nil, class: String? = nil, speciality: String? = nil, type: Int64? = nil, typeStr: TypeStr? = nil) {
            self.id = id
            self.country = country
            self.city = city
            self.name = name
            self.yearFrom = yearFrom
            self.yearTo = yearTo
            self.yearGraduated = yearGraduated
            self.class = `class`
            self.speciality = speciality
            self.type = `type`
            self.typeStr = typeStr
        }
    }
    
    public let schools: [Schools]?
    
    /// Короткое имя страницы.
    public let screenName: String?
    
    /// Пол.
    public enum Sex: Int64, Codable {
        /// 2 — мужской;
        case muzskoj = 2
    
        /// 0 — пол не указан.
        case pol_ne_ukazan = 0
    
        /// 1 — женский;
        case zenskij = 1
    }
    
    public let sex: Sex?
    
    /// Адрес сайта, указанный в профиле.
    public let site: String?
    
    /// Статус пользователя. Возвращается строка, содержащая текст статуса, расположенного в профиле под именем. Если включена опция «Транслировать в статус играющую музыку», возвращается дополнительное поле status_audio, содержащее информацию о композиции.
    public let status: String?
    
    /// Временная зона. Только при запросе информации о текущем пользователе.
    public let timezone: Int64?
    
    /// Информация о том, есть ли на странице пользователя «огонёк».
    public let trending: VkFlag?
    
    /// Любимые телешоу.
    public let tv: String?
    
    /// Список вузов, в которых учился пользователь. Массив объектов, описывающих университеты.
    public struct Universities: Codable {
        
        /// Идентификатор университета.
        public let id: Int64?
        
        /// Идентификатор страны, в которой расположен университет.
        public let country: Int64?
        
        /// Идентификатор города, в котором расположен университет.
        public let city: Int64?
        
        /// Наименование университета.
        public let name: String?
        
        /// Идентификатор факультета.
        public let faculty: Int64?
        
        /// Наименование факультета.
        public let facultyName: String?
        
        /// Идентификатор кафедры.
        public let chair: Int64?
        
        /// Наименование кафедры.
        public let chairName: String?
        
        /// Год окончания обучения.
        public let graduation: Int64?
        
        /// Форма обучения.
        public let educationForm: String?
        
        /// Статус (например, «Выпускник (специалист)»).
        public let educationStatus: String?
        
        public init(id: Int64? = nil, country: Int64? = nil, city: Int64? = nil, name: String? = nil, faculty: Int64? = nil, facultyName: String? = nil, chair: Int64? = nil, chairName: String? = nil, graduation: Int64? = nil, educationForm: String? = nil, educationStatus: String? = nil) {
            self.id = id
            self.country = country
            self.city = city
            self.name = name
            self.faculty = faculty
            self.facultyName = facultyName
            self.chair = chair
            self.chairName = chairName
            self.graduation = graduation
            self.educationForm = educationForm
            self.educationStatus = educationStatus
        }
    }
    
    public let universities: [Universities]?
    
    /// Возвращается 1, если страница пользователя верифицирована, 0 — если нет.
    public let verified: VkFlag?
    
    /// Режим стены по умолчанию. Возможные значения: owner, all.
    public enum WallDefault: String, Codable {
        /// all
        case all
    
        /// owner
        case owner
    }
    
    public let wallDefault: WallDefault?
    
    public init(id: Int64, firstName: String, lastName: String, deactivated: String, isClosed: Bool, canAccessClosed: Bool, about: String? = nil, activities: String? = nil, bdate: String? = nil, blacklisted: VkFlag? = nil, blacklistedByMe: VkFlag? = nil, books: String? = nil, canPost: VkFlag? = nil, canSeeAllPosts: VkFlag? = nil, canSeeAudio: VkFlag? = nil, canSendFriendRequest: VkFlag? = nil, canWritePrivateMessage: VkFlag? = nil, career: Career? = nil, city: City? = nil, commonCount: Int64? = nil, connections: [String: String]? = nil, contacts: Contacts? = nil, counters: Counters? = nil, country: Country? = nil, cropPhoto: CropPhoto? = nil, domain: String? = nil, education: Education? = nil, exports: String? = nil, firstNameCase: FirstName? = nil, followersCount: Int64? = nil, friendStatus: FriendStatus? = nil, games: String? = nil, hasMobile: VkFlag? = nil, hasPhoto: VkFlag? = nil, homeTown: String? = nil, interests: String? = nil, isFavorite: VkFlag? = nil, isFriend: VkFlag? = nil, isHiddenFromFeed: VkFlag? = nil, lastNameCase: LastName? = nil, lastSeen: LastSeen? = nil, lists: String? = nil, maidenName: String? = nil, military: Military? = nil, movies: String? = nil, music: String? = nil, nickname: String? = nil, occupation: Occupation? = nil, online: VkFlag? = nil, personal: Personal? = nil, photo50: String? = nil, photo100: String? = nil, photo200Orig: String? = nil, photo200: String? = nil, photo400Orig: String? = nil, photoId: String? = nil, photoMax: String? = nil, photoMaxOrig: String? = nil, quotes: String? = nil, relatives: [Relatives]? = nil, relation: Relation? = nil, schools: [Schools]? = nil, screenName: String? = nil, sex: Sex? = nil, site: String? = nil, status: String? = nil, timezone: Int64? = nil, trending: VkFlag? = nil, tv: String? = nil, universities: [Universities]? = nil, verified: VkFlag? = nil, wallDefault: WallDefault? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.deactivated = deactivated
        self.isClosed = isClosed
        self.canAccessClosed = canAccessClosed
        self.about = about
        self.activities = activities
        self.bdate = bdate
        self.blacklisted = blacklisted
        self.blacklistedByMe = blacklistedByMe
        self.books = books
        self.canPost = canPost
        self.canSeeAllPosts = canSeeAllPosts
        self.canSeeAudio = canSeeAudio
        self.canSendFriendRequest = canSendFriendRequest
        self.canWritePrivateMessage = canWritePrivateMessage
        self.career = career
        self.city = city
        self.commonCount = commonCount
        self.connections = connections
        self.contacts = contacts
        self.counters = counters
        self.country = country
        self.cropPhoto = cropPhoto
        self.domain = domain
        self.education = education
        self.exports = exports
        self.firstNameCase = firstNameCase
        self.followersCount = followersCount
        self.friendStatus = friendStatus
        self.games = games
        self.hasMobile = hasMobile
        self.hasPhoto = hasPhoto
        self.homeTown = homeTown
        self.interests = interests
        self.isFavorite = isFavorite
        self.isFriend = isFriend
        self.isHiddenFromFeed = isHiddenFromFeed
        self.lastNameCase = lastNameCase
        self.lastSeen = lastSeen
        self.lists = lists
        self.maidenName = maidenName
        self.military = military
        self.movies = movies
        self.music = music
        self.nickname = nickname
        self.occupation = occupation
        self.online = online
        self.personal = personal
        self.photo50 = photo50
        self.photo100 = photo100
        self.photo200Orig = photo200Orig
        self.photo200 = photo200
        self.photo400Orig = photo400Orig
        self.photoId = photoId
        self.photoMax = photoMax
        self.photoMaxOrig = photoMaxOrig
        self.quotes = quotes
        self.relatives = relatives
        self.relation = relation
        self.schools = schools
        self.screenName = screenName
        self.sex = sex
        self.site = site
        self.status = status
        self.timezone = timezone
        self.trending = trending
        self.tv = tv
        self.universities = universities
        self.verified = verified
        self.wallDefault = wallDefault
    }

}