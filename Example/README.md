# OnsideKit Example App 🚀

This sample application demonstrates the core functionalities of the **OnsideKit SDK**.

## What this example demonstrates:
*   **User Authentication**
*   **Fetching Products**: Loading a list of available in-app purchases from the Onside backend.
*   **Making a Purchase**: Initiating and completing the purchase flow for a selected product.
*   **Restoring Purchases**: Implementing the "Restore Purchases" functionality to allow users to regain access to their non-consumable purchases.

## ⚠️ Important: Required Setup Steps
Before you can build and run this project, you must perform two essential configuration steps. The app will not function correctly without them.

### 1. Configure the Bundle Identifier
The app's Bundle ID must exactly match the one you registered for your application in the Onside Developer Console.

1.  Open the project file (`OnsideKitExample.xcodeproj`) in Xcode.
2.  Select the **"OnsideKitExample"** project in the Project Navigator, then select the **"OnsideKitExample"** target.
3.  Go to the **"Signing & Capabilities"** tab.
4.  Update the **Bundle Identifier** field with your app's unique identifier (e.g., `com.yourcompany.yourapp`).

### 2. Add Your Product SKUs

The example needs to know which products to fetch from the Onside backend. You must provide the SKUs (product identifiers) that you have already created in the developer console.

1.  Navigate to the `ProductsRepository.swift` file.
2.  Find the `productSKUs` property.
3.  Add the SKUs of the products you want to test.

Once these two steps are complete, you can build and run the app on a physical device or simulator.

## Further Reading
This example covers the basics. For more detailed information on advanced features, error handling, and the complete API, please refer to the official [**OnsideKit Documentation**](https://docs.onside.io/sdk/).
