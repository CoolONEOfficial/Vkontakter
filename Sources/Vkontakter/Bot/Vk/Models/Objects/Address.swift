// Vkontakter - VK Bot Swift SDK.
// This file is autogenerated by API package.

import AnyCodable

/**
 Объект, описывающий адрес в сообществе.

 SeeAlso VK API Reference:
 [Address](https://vk.com/dev/objects/address
 */
public final class Address: Codable {
    /// Идентификатор адреса.
    public let id: Int64?
    
    /// Идентификатор страны.
    public let countryId: Int64?
    
    /// Идентификатор города.
    public let cityId: Int64?
    
    /// Заголовок адреса.
    public let title: String?
    
    /// Строка адреса.
    public let address: String?
    
    /// Описание адреса.
    public let additionalAddress: String?
    
    /// Географическая широта отметки, заданная в градусах (от -90 до 90).
    public let latitude: Int64?
    
    /// Географическая долгота отметки, заданная в градусах (от -180 до 180).
    public let longitude: Int64?
    
    /// Расстояние до цели в метрах.
    public let distance: Int64?
    
    /// Номер телефона.
    public let phone: String?
    
    /// Смещение времени в минутах относительно UTC.
    public let timeOffset: Int64?
    
    /// Идентификатор станции метрополитена.
    public let metroStationId: Int64?
    
    /// Тип расписания.
    public enum WorkInfoStatus: String, Codable {
        case no_information
        case timetable
        case forever_closed
        case temporarily_closed
        case always_opened
    }
    
    public let workInfoStatus: WorkInfoStatus?
    
    /// Для типа расписания timetable можно передать расписание в формате json. Время передается в минутах от 0 часов. Ключ по дню означает, что день рабочий. open_time, close_time — начало и конец рабочего дня. break_open_time, break_close_time - время перерыва.
    public final class Timetable: Codable {
        
        
        public init() {
        }
    }
    
    public let timetable: Timetable?
    
    public init(id: Int64? = nil, countryId: Int64? = nil, cityId: Int64? = nil, title: String? = nil, address: String? = nil, additionalAddress: String? = nil, latitude: Int64? = nil, longitude: Int64? = nil, distance: Int64? = nil, phone: String? = nil, timeOffset: Int64? = nil, metroStationId: Int64? = nil, workInfoStatus: WorkInfoStatus? = nil, timetable: Timetable? = nil) {
        self.id = id
        self.countryId = countryId
        self.cityId = cityId
        self.title = title
        self.address = address
        self.additionalAddress = additionalAddress
        self.latitude = latitude
        self.longitude = longitude
        self.distance = distance
        self.phone = phone
        self.timeOffset = timeOffset
        self.metroStationId = metroStationId
        self.workInfoStatus = workInfoStatus
        self.timetable = timetable
    }

}