# MobbinAPI

MobbinAPI is an third-party unofficial open-source intuitive SWIFT API for [Mobbin](https://mobbin.com).

* 100% build in SWIFT
* 100% build with ASYNC
* Fetch Apps, Screens, Flows and Collections
* Support Free Mobbin Account
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

#### Composition of UserInfo

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

## Workspace

MobbinAPI currently only support one workspace account.

### Composition

* `name`: Workspace Name (usually email prefix)
* `id`: Workspace ID
* `type`: Type of Workspace (usually `personaly`)

### Fetch Workspace

```swift
let workspace = try await mobbinAPI.fetchWorkspace()
```
