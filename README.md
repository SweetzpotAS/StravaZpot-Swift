# StravaZpot Swift

A fluent API to integrate with Strava on iOS apps written in Swift.

## Usage

This document explains how to use **StravaZpot** in your Swift iOS app. For additional questions, you may want to check **Strava** official documentation [here](https://strava.github.io/api/).

## Authentication

### Authentication View Controller

Strava uses OAuth 2.0 to authenticate users, and then request them to grant permission to your app. To get a Client ID and Secret from Strava for your app, follow [this link](https://www.strava.com/settings/api).

Once you have your app credentials, you can create an `AuthenticationViewController` and set the necessary fields with the following code:

```swift
let authenticationViewController = AuthenticationViewController()
authenticationViewController.url = url // URL
authenticationViewController.redirectURL = redirectURL // String
authenticationViewController.delegate = delegate // AuthenticationDelegate
authenticationViewController.title = "Login to Strava"
```

The `url` that you need to send has some special arguments. StravaZpot provides an easy way to build it:

```swift
let url = StravaLogin(clientID: <YOUR_CLIENT_ID>,
                      redirectURI: <YOUR_REDIRECT_URL>,
                      approvalPrompt: ApprovalPrompt.force,
                      accessScope: AccessScope.Write).makeURL()
```

You need to notice several things with this call:

- `<YOUR_CLIENT_ID>` must be replaced with the Client ID provided by Strava when you registered your application.
- `<YOUR_REDIRECT_URL>` must be in the domain you specified when you registered your app in Strava.
- Refer to `ApprovalPrompt` enum to get more options for this parameter.
- Refer to `AccessScope` enum to get more options for this parameter.

The `delegate` you pass to the `AuthenticationViewController` must implement the protocol `AuthenticationDelegate`, which consists of a single method:

```swift
func authenticationViewController(_ authenticationViewController: AuthenticationViewController, didFinishWithCode code: String) {
  // Use code to obtain token
}
```

### Obtain a Token

Every Strava API call needs a token to prove the user is authenticated and the app has permission to access the API. After you have obtained the code from user login, you need to exchange it with Strava to get a token. You can do it with the following code:

```swift
let client = HTTPClientBuilder.authenticationClient(debug: true)
AuthenticationAPI(client: client)
  .getToken(forApp: AppCredentials(clientID: <YOUR_CLIENT_ID>,
                                   clientSecret: <YOUR_CLIENT_SECRET>),
            withCode: self.code)
  .execute { loginResult : StravaResult<LoginResult> in
    // Check if result is successful or not
  }
```

Notice that in this call you must provide the Client ID and Secret provided by Strava when you registered your application, and the code obtained during the login process. Also, the execution of the previous code involves a network request; **you are responsible for calling this code in a suitable thread, outside the UI thread**. Otherwise, you will get an exception.

If the previous request is successful, you will get a `LoginResult`, which has a `Token` that you can use in your subsequent API calls, and an `Athlete` instance, representing the authenticated user.

All responses from Strava API calls are wrapped in `StravaResult<T>`, which is an enum that indicates if the result was successful or not. The successful case contains an instance of the object that Strava returns. The failure case contains an `Error` explaining the reason for the failure.

## Athlete API

### HTTPClient

Before introducing the AthleteAPI, we have to talk about `HTTPClient`. `HTTPClient` is a protocol required by all the APIs in **StravaZpot** to configure the way it is going to interact with Strava. You can create an `HTTPClient` as soon as you obtain a token and reuse it during your app lifecycle. To create an instance of this:

```swift
let client = HTTPClientBuilder.client(withToken: <YOUR_TOKEN>, debug: true)
```

You must provide the token obtained during the authentication process. The `debug` argument will print useful information about the API calls.

Once you have the `HTTPClient`, you can proceed to use all the APIs.

### Create the Athlete API object

```swift
let athleteAPI = AthleteAPI(client: client)
```

### Retrieve current athlete

```swift
athleteAPI.retrieveCurrentAthlete()
          .execute { result : StravaResult<Athlete> in ... }
```

### Retrieve another athlete

```swift
athleteAPI.retrieveAthlete(withID: 227615)
          .execute { result : StravaResult<Athlete> in ... }
```

### Update an athlete

```swift
ahtleteAPI.updateCurrentAthlete(withCity: "Irvine",
                                withState: "California",
                                withCountry: "USA",
                                withSex: .male,
                                withWeight: 85.6)
          .execute { result : StravaResult<Athlete> in ... }
```

### Retrieve athlete's zones

```swift
athleteAPI.getAthleteZones()
          .execute { result : StravaResult<Zones> in ... }
```

### Retrieve athlete's totals and stats

```swift
atheleteAPI.getTotalsAndStats(withID: 227615)
           .execute { result : StravaResult<Stats> in ... }
```

### List athlete K/QOMs/CRs

```swift
athleteAPI.listAthleteKOMS(withID: 227615)
          .of(page: 2, itemsPerPage: 10)
          .execute { result : StravaResult<EquatableArray<SegmentEffort>> in ... }
```

## Friend API

### Create the Friend API object

```swift
let friendAPI = FriendAPI(client: client)
```

### List user's friends

```swift
friendAPI.listMyFriends()
   .of(page: 2, itemsPerPage: 10)
   .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

### List another athlete's friends

```swift
friendAPI.listAthleteFriends(withID: 227615)
   .of(page: 2, itemsPerPage: 10)
   .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

### List user's followers

```swift
friendAPI.listMyFollowers()
         .of(page: 2, itemsPerPage: 10)
         .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

### List another athlete's followers

```swift
friendAPI.listAthleteFollowers(withID: 227615)
         .of(page: 2, itemsPerPage: 10)
         .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

### List common following athletes between two users

```swift
friendAPI.listBothFollowing(withID: 227615)
         .of(page: 2, itemsPerPage: 10)
         .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

## Activity API

### Create the Activity API object

```swift
let activityAPI = ActivityAPI(client: client)
```

### Create an activity

```swift
activityAPI.createActivity(withName: "Rowing session",
                           withType: .rowing,
                           withStartDate: Date(day: 20, month: 1, year: 2016, hour: 12, minute: 35, second: 46),
                           withElapsedTime: Time(seconds: 6345),
                           withDescription: "Relaxing training",
                           withDistance: Distance(meters: 1234),
                           isPrivate: false,
                           withTrainer: true,
                           withCommute: false)
           .execute { result : StravaResult<Activity> in ... }
```

### Retrieve an activity

```swift
activityAPI.retrieveActivity(withID: 321934,
                             includeAllEfforts: true)
           .execute{ result : StravaResult<Activity> in ... }
```

### Update an activity

```swift
activityAPI.updateActivity(withID: 321934,
                           withName: "Rowing session",
                           withType: .rowing,
                           isPrivate: true,
                           withTrainer: false,
                           withCommute: true,
                           withGearID: "b123456",
                           withDescription: "Best training ever!")
           .execute{ result : StravaResult<Activity> in ... }
```

### Delete an activity

```swift
activityAPI.deleteActivity(withID: 321934)
           .execute{ result : StravaResult<Bool> in ... }
```

### List user's activities

```swift
activityAPI.listActivities(before: 1000, after: 2000)
           .of(page: 2, itemsPerPage: 10)
           .execute{ result : StravaResult<EquatableArray<Activity>> in ... }
```

### List user's friends' activities

```swift
activityAPI.listFriendsActivities(before: 1000)
           .of(page: 2, itemsPerPage: 10)
           .execute{ result : StravaResult<EquatableArray<Activity>> in ... }
```

### List related activities

```swift
activityAPI.listRelatedActivities(toActivityWithID: 321934)
           .of(page: 2, itemsPerPage: 10)
           .execute{ result : StravaResult<EquatableArray<Activity>> in ... }
```

### List activity zones

```swift
activityAPI.listActivityZones(withID: 321934)
           .execute{ result : StravaResult<EquatableArray<ActivityZone>> in ... }
```

### List activity laps

```swift
activityAPI.listActivityLaps(withID: 321934)
           .execute{ result : StravaResult<EquatableArray<ActivityLap> in ... }
```

## Comment API

### Create the Comment API object

```swift
let commentAPI = CommentAPI(client: client)
```

### List activity comments

```swift
commentAPI.listActivityComments(withID: 123)
          .of(page: 2, itemsPerPage: 10)
          .execute{ result : StravaResult<EquatableArray<Comment>> in ... }
```

## Kudos API

### Create the Kudos API object

```swift
let kudosAPI = KudosAPI(client: client)
```

### List activity kudoers

```swift
kudosAPI.listActivityKudos(withID: 321934)
        .of(page: 2, itemsPerPage: 10)
        .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

## Photo API

### Create the Photo API object

```swift
let photoAPI = PhotoAPI(client: client)
```

### List activity photos

```swift
photoAPI.listActivityPhotos(withID: 81121657)
        .execute{ result : StravaResult<EquatableArray<Photo>> in ... }
```

## Club API

### Create the Club API object

```swift
let clubAPI = ClubAPI(client: client)
```

### Retrieve a club

```swift
clubAPI.retrieveClub(withID: 1)
       .execute{ result : StravaResult<Club> in ... }
```

### List club announcements

```swift
clubAPI.listClubAnnouncements(withID: 109984)
       .execute{ result : StravaResult<EquatableArray<Announcement>> in ... }
```

### List club group events

```swift
clubAPI.listClubGroupEvents(withID: 1)
       .execute{ result : StravaResult<EquatableArray<Event>> in ... }
```

### List user's clubs

```swift
clubAPI.listAthleteClubs()
       .execute{ result : StravaResult<EquatableArray<Club>> in ... }
```

### List club members

```swift
clubAPI.listClubMembers(withID: 123)
       .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

### List club admins

```swift
clubAPI.listClubAdmins(withID: 123)
       .execute{ result : StravaResult<EquatableArray<Athlete>> in ... }
```

### List club activities

```swift
clubAPI.listClubActivities(withID: 123, before: 9999)
       .of(page: 2, itemsPerPage: 10)
       .execute{ result : StravaResult<EquatableArray<Activity>> in ... }
```

### Join a club

```swift
clubAPI.joinClub(withID: 123)
       .execute{ result : StravaResult<JoinResult> in ... }
```

### Leave a club

```swift
clubAPI.leaveClub(withID: 123)
       .execute{ result : StravaResult<LeaveResult> in ... }
```

## Gear API

### Create the Gear API object

```swift
let gearAPI = GearAPI(client: client)
```

### Retrieve gear

```swift
gearAPI.getGear(withID: "b105763")
       .execute{ result : StravaResult<Gear> in ... }
```

## Route API

### Create the Route API

```swift
let routeAPI = RouteAPI(client: client)
```

### Retrieve a route

```swift
routeAPI.retrieveRoute(withID: 1263727)
        .execute{ result : StravaResult<Route> in ... }
```

### List athlete's routes

```swift
routeAPI.listAthleteRoutes(withID: 1234)
        .execute{ result : StravaResult<EquatableArray<Route>> in ... }
```

## Segment API

### Create the Segment API object

```swift
let segmentAPI = SegmentAPI(client: client)
```

### Retrieve a segment

```swift
segmentAPI.retrieveSegment(withID: 229781)
          .execute{ result : StravaResult<Segment> in ... }
```

### List user's starred segments

```swift
segmentAPI.listMyStarredSegments()
          .execute{ result : StravaResult<EquatableArray<Segment>> in ... }
```

### List another athlete's starred segments

```swift
segmentAPI.listAthleteStarredSegments(withID: 1234)
          .execute{ result : StravaResult<EquatableArray<Segment>> in ... }
```

### Star a segment

```swift
segmentAPI.starSegment(withID: 229781)
          .execute{ result : StravaResult<Segment> in ... }
```

### Unstar a segment

```swift
segmentAPI.unstarSegment(withID: 229781)
          .execute{ result : StravaResult<Segment> in ... }
```

### List segment efforts

```swift
segmentAPI.listSegmentEfforts(withID: 229781,
                              forAthleteWithID: 1234,
                              withStartDate: Date(day: 1, month: 1, year: 2015, hour: 0, minute: 0, second: 1),
                              withEndDate: Date(day: 31, month: 12, year: 2015, hour: 23, minute: 59, second: 59))
          .of(page: 2, itemsPerPage: 10)
          .execute{ result : StravaResult<EquatableArray<SegmentEffort>> in ... }
```

### Retrieve segment leaderboard

```swift
segmentAPI.retrieveSegmentLeaderboard(withID: 229781,
                                      withGender: .female,
                                      withAgeGroup: .age_25_34,
                                      withWeightClass: .kg_65_74,
                                      following: true,
                                      withClubID: 321,
                                      inDateRange: .thisMonth,
                                      withContextEntries: 4)
          .of(page: 2, itemsPerPage: 10)
          .execute{ result : StravaResult<Leaderboard> in ... }
```

### Explore segments

```swift
segmentAPI.explore(inRegion: Bounds(southWest: Coordinates(latitude: 15, longitude: -24),
                                    northEast: Coordinates(latitude: -32, longitude: 40)),
                   withActivityType: .running,
                   withMinCategory: 3,
                   withMaxCategory: 7)
          .execute{ result : StravaResult<ExploreResult> in ... }
```

## Segment Effort API

### Create the Segment Effort API object

```swift
let segmentEffortAPI = SegmentEffortAPI(client: client)
```

### Retrieve a segment effort

```swift
segmentEffortAPI.retrieveSegmentEffort(withID: 269990681)
                .execute{ result : StravaResult<SegmentEffort> in ... }
```

## Stream API

### Create the Stream API object

```swift
let streamAPI = StreamAPI(client: client)
```

### Retrieve activity streams

```swift
streamAPI.listActivityStreams(withID: 112233,
                              forTypes: .altitude, .time, .temperature,
                              withResolution: .low,
                              withSeriesType: .time)
         .execute{ result : StravaResult<EquatableArray<Stream>> in ... }
```

### Retrieve segment effort streams

```swift
streamAPI.listSegmentEffortStreams(withID: 112233,
                                   forTypes: .altitude, .time, .temperature,
                                   withResolution: .low,
                                   withSeriesType: .time)
         .execute{ result : StravaResult<EquatableArray<Stream>> in ... }
```

### Retrieve segment streams

```swift
streamAPI.listSegmentStreams(withID: 112233,
                             forTypes: .altitude, .time, .temperature,
                             withResolution: .low,
                             withSeriesType: .time)
         .execute{ result : StravaResult<EquatableArray<Stream>> in ... }
```

### Retrieve route streams

```swift
streamAPI.listRouteStreams(withID: 112233)
         .execute{ result : StravaResult<EquatableArray<Stream>> in ... }
```

## Upload API

### Create the Upload API object

```swift
let uploadAPI = UploadAPI(client: client)
```

### Upload a file

Strava allows you to upload files with formats GPX, FIT or TCX. We recommend to use TCXZpot in order to generate TCX files that can be uploaded to Strava.

```swift
uploadAPI.upload(file : URL(string: "file://path_to_file")!,
                 withFilename : "filename.fit",
                 withDataType : .fit,
                 withActivityType : .ride,
                 withName : "A complete ride around the city",
                 withDescription : "No description",
                 isPrivate : false,
                 hasTrainer : false,
                 isCommute : false,
                 withExternalID : "test.fit")
         .execute{ result : StravaResult<UploadStatus> in ... }
```

### Check upload status

```swift
uploadAPI.checkUploadStatus(withId: 16486788)
         .execute{ result : StravaResult<UploadStatus> in ... }
```

## Download

You can get **StravaZpot** from CocoaPods. Just add this line to your Podfile:

```ruby
pod 'StravaZpot-Swift', '~> 1.0.5'
```

## License

    Copyright 2017 SweetZpot AS

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
