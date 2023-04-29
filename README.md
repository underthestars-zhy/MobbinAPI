![](./Github/Mobbin.png)

# MobbinAPI

MobbinAPI is an third-party unofficial open-source intuitive SWIFT API for [Mobbin](https://mobbin.com).

* 100% build in **SWIFT**
* 100% build with **ASYNC**
* Fetch Apps, Screens, Flows and Collections
* Support **Free** Mobbin Account
* Persistent "Login" (Refresh Token)

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

If creating the `MobbinAPI` by email or by UserInfo but didn't set the token, run following steps is a **must**.

### Send Email

```swift
try await mobbinAPI.sendEmail()
```

Check the email inbox and copy the verify code that Mobbin sent.

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

Mobbin has a strict policy on the token. Every token only lasts for one day. So every day, you need to refresh the token.

```swift
try await mobbinAPI.refreshToken()
```

## Workspace

MobbinAPI currently only support one workspace account.

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

This variable can show how many apps thta Mobbin has. However, it seems that this number is wrong. Maybe Mobbin's developers should fix it. It is bigger that actual number.

```swift
mobbinAPI.iOSAppsCount
```

### App Compositions

```swift
struct App {
    ....
}
```

`id`: The ID of this App
`appName`: The name of this App
`appCategory`: The category of this App
`appStyle`: The style of this App (seems a **future** feature)
`appLogoUrl`: The url of the App's logo
`appTagline`: The tag line of the App
`companyHqRegion`: The HQ region of the App (*Honestly, I don't know what it is...*)
`companyStage`: The current stage of the company behind this app
`platform`: The platform where the app runs on
`createdAt`: When this app row was created
`appVersionId`: The ID of the version
`appVersionCreatedAt`: When the version was created
`appVersionUpdatedAt`: When the version was updated
`appVersionPublishedAt`: When the version was published
`previewScreenUrls`: Three preview images' urls

### Fetch All the Apps

```swift
try await mobbinAPI.getAlliOSApps()
```

### Page query

This method will return 24 apps, which is a page. If you want to query the next page, using the last app you queried privously. `nil` for querying the first page.

```swift
try await mobbinAPI.queryNextPage(nil) // Query first page
try await mobbinAPI.queryNextPage(App(...))
```

## iOS Screens

Will support in the future.

## iOS Flows

Will support in the future.

## Android

Will support in the future.

## Web

Will support in the future.
