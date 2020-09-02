//
//  CalendarProvider.swift
//  TripsCalendarWidgetExtension
//
//  Created by Fernando Moya de Rivas on 27/07/2020.
//

import WidgetKit
import SwiftUI

struct CalendarProvider: TimelineProvider {
    public typealias Entry = CalendarEntry

    func placeholder(in context: Self.Context) -> Self.Entry {
        CalendarEntry(date: Date(), trips: nextTrips)
    }

    func getSnapshot(in context: Self.Context, completion: @escaping (Self.Entry) -> Void) {
        let entry = CalendarEntry(date: Date(), trips: nextTrips)
        completion(entry)
    }

    func getTimeline(in context: Self.Context, completion: @escaping (Timeline<Self.Entry>) -> Void) {
        let store = TripsStore()

        let now = Date.now
        let tomorrow = now.addingTimeInterval(24 * 3600).trimmingTime()

        let entry = CalendarEntry(date: now, trips: store.trips)
        let timeline = Timeline(entries: [entry], policy: .after(tomorrow))
        completion(timeline)
    }
}
