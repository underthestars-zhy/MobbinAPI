![](./Github/Mobbin.png)

# MobbinAPI

MobbinAPI is an third-party unofficial open-source intuitive SWIFT API for [Mobbin](https://mobbin.com).

* 100% build in **SWIFT**
* 100% build with **ASYNC**
* Fetch Apps, Screens, Flows and Collections
* Support **Free** Mobbin Account
* Persistent "Login" Status

```swift
let mobbinAPI = MobbinAPI(email: "zhuhaoyu0909@icloud.com")
```

## Create API

### By Email (Only Used for Login)

```swift
let mobbinAPI = MobbinAPI(email: "zhuhaoyu0909@icloud.com")
let mobbinAPI = MobbinAPI(email: "zhuhaoyu0909@icloud.com", token: Token(...))
```

### By UserInfo

```swift
let mobbinAPI = MobbinAPI(userInfo: UserInfo(...))
let mobbinAPI = MobbinAPI(userInfo: UserInfo(...), token: Token(...))
```

#### UserInfo Compositions

```swift
struct UserInfo {
    ...
}
```

* `id`: User's' ID
* `aud`: User's' AUD
* `role`: Role of the User
* `email`: Email of the User (Login / Signup Email)
* `emailConfirmedAt`: The time when the email is confirmed
* `recoverySentAt`: The time when the the recovery sent
* `lastSignInAt`: Last Signin time
* `avatarUrl`: The URL of the User's avatar
* `fullName`: User's full name

## Login

If you created the `MobbinAPI` either by email or by `UserInfo` but did not set the token, the following steps are **mandatory** to be executed.

### Send Email

```swift
try await mobbinAPI.sendEmail()
```

Check the email inbox and copy the verification code that Mobbin sent.

### Login with Code

```swift
try await mobbinAPI.verify(code: ...)
```

## Token

After a successful login, MobbinAPI can obtain a token, which will be used in all future steps. If you create a `MobbinAPI` object using `UserInfo` and do not want to log in again, you need to save the previous token and pass it as the initial value for the `MobbinAPI` object.

#### Token Compositions

```swift
struct Token {
    ...
}
```

* `accessToken`: Used for Authentication
* `refreshToken`: Used for refreshing `accessToken`
* `generatedTime`: When the `accessToken` was generated

### Refresh Token

Mobbin has a strict policy regarding tokens, wherein each token only lasts for one day. Therefore, it is necessary to refresh the token daily.

```swift
try await mobbinAPI.refreshToken()
```

## Workspace

MobbinAPI currently only supports **one workspace account**.

### Workspace Compositions

* `name`: Workspace Name (usually email prefix)
* `id`: Workspace ID
* `type`: Type of Workspace (usually `personaly`)

### Fetch Workspace

```swift
let workspace = try await mobbinAPI.fetchWorkspace()
```

## iOS Apps

MobbinAPI can fetch all iOS apps that Mobbin has.

### Count

This variable displays the number of apps that Mobbin has, but it appears to be incorrect. Perhaps the developers of Mobbin should rectify it, as it shows a higher number than the actual count.

```swift
let iOSAppsCount = try await mobbinAPI.iOSAppsCount
```

### App Compositions

```swift
struct App {
    ....
}
```

* `id`: The ID of this App
* `appName`: The name of this App
* `appCategory`: The category of this App
* `appStyle`: The style of this App (seems a **future** feature)
* `appLogoUrl`: The url of the App's logo
* `appTagline`: The tag line of the App
* `companyHqRegion`: The HQ region of the App (*Honestly, I don't know what it is...*)
* `companyStage`: The current stage of the company behind this app
* `platform`: The platform where the app runs on
* `createdAt`: When this app row was created
* `appVersionId`: The ID of the version
* `appVersionCreatedAt`: When the version was created
* `appVersionUpdatedAt`: When the version was updated
* `appVersionPublishedAt`: When the version was published
* `previewScreenUrls`: Three preview images' urls

### Fetch All the Apps

```swift
try await mobbinAPI.getAlliOSApps()
```

### Page query

This method will return 24 apps, which represents a page. To query the next page, use the last app you queried previously. Use `nil` to query the first page.

```swift
try await mobbinAPI.queryNextPage(nil) // Query first page
try await mobbinAPI.queryNextPage(App(...))
```

### Query Details

After you successfully queried apps, you can query the detailed information for certian app.

#### Screens

Mobbin can provide all the screens snapshots of the app.

##### Screen Compositions

```swift
struct Screen {
    ....
}
```

* `screenNumber`: The number of the screen
* `screenUrl`: The URL of the image of this screen
* `appVersionId`: The ID of the App's Version
* `id`: The ID of the screen
* `screenElements`: A array that contains all the elements in the screen
* `screenPatterns`: A array that contains all the patterns in the screen
* `updatedAt`: When the screen was updated
* `createdAt`: When the screen was created

##### Query Screens

```swift
try await api.getiOSScreens(of: App(...))
```

#### Flows

Mobbin can provide the entire flows of the app, which consists of a series of screens.

##### Flow Compositions

```swift
struct Flow {
    ...
}
```

* `id`: The ID of the flow
* `name`: The name of the flow
* `actions`: A array that contains all the actions in the flow
* `parentAppSectionId`: The ID of the parent flow (flow is a **tree sturture**)
* `order`: The order of the flow
* `updatedAt`: When the screen was updated
* `appVersionId`: The app verion ID of the app, which contains this flow
* `screens`: All the screens contained in the flow

##### Flow.Screen Compositions

```swift
struct Flow {
    ...
    struct Screen {
        ....
    }
}
```

* `appScreenId`: The ID of the Screen
* `order`: The order of the flow
* `hotspotWidth`: The width of the hotspot (if there is one)
* `hotspotHeight`: The height of the hotspot (if there is one)
* `hotspotX`: The x coordinate of the hotspot (if there is one)
* `hotspotY`: The y coordinate of the hotspot (if there is one)
* `hotspotType`: The type of the hotspot (if there is one)
* `screenUrl`: The url of the screen's image

##### Query Flows

```swift
try await api.getiOSFlows(of: App(...))
```

##### Generate Tree Structure Flow

MobbinAPI is capable of generating a tree structure based on the flow array. `Tree` is an Enum with a single case `.children`.

```swift
let tree = api.generateTreeSturctureFlow(from: flows)
```

## iOS Screens

Will support in the future.

## iOS Flows

Will support in the future.

## Android

Will support in the future.

## Web

Will support in the future.

## Collection

MobbinAPI supports **full control** over an account's collections.

### Platforms Count

Platform count refers to the number of screens or flows in a particular collection's platform.

```swift
let platfrom = try await api.platformCount(of: Collection(...))
```

### Query Collection

```swift
let collections = try await api.queryCollections()
```

### Delete Collection

```swift
try await api.delete(collection: Collection(...))
```

### Create Collection

```swift
let workspace = try await api.fetchWorkspace()

try await api.createCollection(in: workspace, name: "...", description: "...")
```

### Eidt Collection

```swift
let newCollection = try await api.edit(collection: collection, name: "...", description: "...")
```

### Apps in the Collection

The following method can fetch apps in collections. The result is a `Collection.App` structure, which is almost the same as the normal `App` structure.

```swift
let apps = try await api.queryApps(in: Collection(...))
```

### Screens in the Collection

The following method can fetch screens in collections. The result is a `Collection.Screen` structure, which is almost the same as the normal `Screen` structure.

```swift
let apps = try await api.queryScreens(in: Collection(...))
```

### Flows in the Collection

The following method can fetch flows in collections. The result is a `Collection.Flow` structure, which is almost the same as the normal `Flow` structure.

```swift
let apps = try await api.queryFlows(in: Collection(...))
```

## "Mobbin" API

Mobbins's API is very special in that some features require the use of Mobbin's own API service instead of a third-party service. The `MobbinAPI` provides control over these levels.

### Get Mobbin Query Token

Almost all of Mobbin's API endpoints use the GET method, and Mobbin requires a query token to authenticate requests. The duration of the token's validity is uncertain, so the best practice is to obtain a new token each time.

```swift
let token = try await mobbinAPI.getMobbinQueryToken()
```

This method will generate a Mobbin query token, which can used in the future actions.

### AppStore URL

Mobbin collects the download URL for every app, but it is not visible through the third-party API service. Therefore, we need to use Mobbin's own API.

```swift
let downloadURL = try await mobbinAPI.downloadURL(of: App(...), mobbinToken: "...")
let downloadURL = try await mobbinAPI.downloadURL(of: App(...),)
```

### Versions

Mobbin provides a special feature for paid users, which allows them to view previous versions of an app. This feature can be easily accessed using the `MobbinAPI`.

```swift
let versions: [Version] = try await mobbinAPI.versions(of: App(...), mobbinToken: "...")
let versions: [Version] = try await mobbinAPI.versions(of: App(...),)
```

#### Verison Compositions 

* `id`: The id of the version (same as `App`'s `appVersionId`)
* `createAt`: The create date of the version (same as `App`'s `appVersionCreatedAt`)
* `updateAt`: The update date of the version (same as `App`'s `appVersionUpdatedAt`)

#### Fetch Screens and Flows by Version

The default fetch methods assume fetching the latest version, but you can control which version you want to fetch by passing the specific `Version`.

```swift
let flows = try await api.getiOSFlows(by: Version(...))
let screens = try await api.getiOSScreens(by: Version(...))
```
