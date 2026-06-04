<p align="center">
    <img src="Assets/icon.png" width="170" />
</p>
<h1 align="center">OnsideKit for iOS</h1>

![iOS](https://img.shields.io/badge/iOS-16.0%2B-blue.svg) ![Xcode](https://img.shields.io/badge/Xcode-26.0%2B-blue.svg) [![License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/onside-io/OnsideKit-iOS/blob/main/LICENSE)

**OnsideKit** lets you integrate in-app purchases into your iOS app. It handles the entire payment flow — from product display to checkout — providing a secure experience for your users while keeping integration simple. The API is intentionally modeled on Apple's StoreKit, so it feels familiar to experienced iOS developers.

## Features
*   **✨ Familiar StoreKit-like API** — a minimal learning curve if you know StoreKit.
*   **💳 Apple Pay & bank cards** — plus a built-in payment-methods management screen.
*   **🛒 Unified purchase flow** — one process for consumable and non-consumable products.
*   **⚠️ Clear, typed errors** — informative value types and a unified set of errors.
*   **🌐 Native, web & Unity** — a native Swift API, a JavaScript bridge for `WKWebView`-based apps, and a Unity package.
*   **🧪 Offline local testing** — develop and QA purchases with a `.storekit` file, no backend required.

## Requirements
*   iOS 16.0+
*   Xcode 26+

## Distributions
OnsideKit ships as two prebuilt binary `.xcframework` products:

| Product | Apple Pay | When to use |
| --- | --- | --- |
| **OnsideKit** | ✅ Included | The default — use it unless you have a reason not to. |
| **OnsideKitLite** | ❌ Excluded | The same SDK without the PassKit dependency, for apps that cannot include PassKit (no Apple Pay). |

## Installation

### Swift Package Manager
In Xcode: **File → Add Package Dependencies…**, enter the repository URL, and choose the **OnsideKit** (or **OnsideKitLite**) product:

```
https://github.com/onside-io/OnsideKit-iOS
```

Or add it to your `Package.swift`:

```swift
.package(url: "https://github.com/onside-io/OnsideKit-iOS", from: "0.8.1")
```

### CocoaPods
Add one of the pods to your `Podfile`:

```ruby
pod 'OnsideKit', :git => 'https://github.com/onside-io/OnsideKit-iOS.git'
# or, without Apple Pay / PassKit:
# pod 'OnsideKitLite', :git => 'https://github.com/onside-io/OnsideKit-iOS.git'
```

### Manual
Download `OnsideKit.xcframework.zip` (or `OnsideKitLite.xcframework.zip`) from the [Releases](https://github.com/onside-io/OnsideKit-iOS/releases) page, drag the `.xcframework` into your target's **Frameworks, Libraries, and Embedded Content**, and select **Embed & Sign**.

➡️ **[Full installation guide](https://docs.onside.io/sdk/getting-started/installation)**

## Getting Started
1.  **Configure products** in the [Onside Developer Console](https://developer.onside.io) to get the product identifiers you'll request from the SDK.
2.  **Initialize the SDK** at launch, register your callback URL scheme, and start fetching products and making purchases.

➡️ **[Quick Start](https://docs.onside.io/sdk/getting-started/quick-start)** — a minimal, end-to-end example.

## Documentation
The full documentation covers installation, initialization, authentication, products, purchasing, purchase validation, customization, attribution, local testing, and a complete API reference.

➡️ **[Read the full documentation](https://docs.onside.io/sdk/)**

### Other platforms
*   **Web (`WKWebView`)** — call OnsideKit from JavaScript via the bridge. The contract is in [`onside.d.ts`](onside.d.ts); see the [JS ↔ Native Bridge](https://docs.onside.io/sdk/integrations/js-bridge) guide.
*   **Unity** — integrate from C# with the OnsideKit Unity package, available as a `.unitypackage` on the [Releases](https://github.com/onside-io/OnsideKit-iOS/releases) page. See the [Unity](https://docs.onside.io/sdk/integrations/unity) guide.

## Example
A sample app is in [`Example/`](Example). It demonstrates authentication, fetching products, purchasing, and restoring purchases — see [`Example/README.md`](Example/README.md) for setup.

## Support
*   **Email**: [support@onside.io](mailto:support@onside.io)
*   **Apple Pay / merchant setup**: [merchant-support@onside.io](mailto:merchant-support@onside.io)
*   **Chat**: use the chat feature in the developer console.

## License
`OnsideKit` is released under the MIT License. See the [`LICENSE`](https://github.com/onside-io/OnsideKit-iOS/blob/main/LICENSE) file for more information.
