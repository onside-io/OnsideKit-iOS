// Onside JS Bridge — TypeScript declarations for `window.onside`.
//
// Setup:
//   await window.onside.initializeOnside('v1');
//
// After initialization:
//   - Every function on `window.onside` is a JS → native call and returns a
//     Promise. There are no synchronous functions, including the setters.
//   - Native → JS events are delivered via callbacks; assign your handler
//     to the corresponding optional property
//     (e.g. `window.onside.onTransactionsUpdated = ...`).
//
// A rejected call carries one of two shapes:
//
//   1. A domain error — the native error enum, serialized as
//      `{ <caseName>: {} }`. Discriminate with `'caseName' in error`, or
//      pattern-match the union types below.
//   2. A bridge error — an `Error` instance with `name === 'PontoonBridgeError'`
//      and a stable `code`. Raised when the call never reached native logic:
//      malformed arguments, an unknown function, a frame the security policy
//      refuses. See `OnsideBridgeError`.
//
// Check `error instanceof Error` (or `'code' in error`) to tell them apart.
//
// The bridge is installed in the main frame only, and only for documents whose
// origin the host allowed when configuring the web view. Sub-frames and opaque
// origins (for example `loadHTMLString` without a base URL) never receive it.
//
// Properties named `_pontoon*` on `window.onside` are reserved by the bridge
// and must not be assigned by page code.

declare global {
  interface Window {
    onside: OnsideJSBridge;
  }
}

export interface OnsideJSBridge {
  // ───────────────────────── Bootstrap ─────────────────────────

  /**
   * Bootstrap the bridge. Must be awaited before any other call — until it
   * resolves the other functions are not defined, so calling one throws a
   * `TypeError` synchronously rather than rejecting.
   *
   * Idempotent: safe to call again after a page reload, and safe to call twice.
   * Currently only `'v1'` is supported; any other value rejects with a
   * `PontoonBridgeError` whose `code` is `'invalidArguments'`.
   *
   * Rejects with `OnsideInitializeError` if the bridge could not be installed.
   */
  initializeOnside(version: 'v1'): Promise<void>;

  // ─────────────────────── Configuration ───────────────────────

  /** Override the theme used for native UI presented from JS. */
  setAppearance(theme: 'light' | 'dark' | 'system'): Promise<void>;

  /** Force local-only login methods on the login screen. */
  setShouldForceLocalLoginMethods(force: boolean): Promise<void>;

  /**
   * Default country code assumed when system region is unknown.
   * Empty string clears the assumption.
   */
  setDefaultCountryCodeAssumption(countryCode: string): Promise<void>;

  // ──────────────────────── Analytics ──────────────────────────

  /**
   * Track an analytics event. `name` may be a predefined Onside event
   * (`purchaseCompleted`, `subscriptionStarted`, ...) or any custom
   * identifier. Validation (length limits, reserved prefixes,
   * max 25 effective parameters, value truncation) is enforced natively.
   */
  trackEvent(input: {
    name: string;
    parameters?: Record<string, JSEventParameterValue>;
  }): Promise<void>;

  // ─────────────────────────── Auth ────────────────────────────

  /** Show the login flow. Rejects with `OnsideLoginError`. */
  requestLogin(): Promise<void>;

  /** Log out the current user. */
  logout(): Promise<void>;

  // ──────────────────────────── UI ─────────────────────────────

  /**
   * Show the payment-methods management screen.
   * Rejects with `OnsidePaymentMethodsManagerError`.
   */
  presentPaymentMethodsManager(): Promise<void>;

  // ───────────────────────── Storefront ────────────────────────

  /** Currently selected storefront, or `null` if none. */
  getCurrentStorefront(): Promise<JSStorefront | null>;

  // ───────────────────────── Products ──────────────────────────

  /**
   * Load products by identifiers. Loaded products are also cached
   * natively for `purchase()` to look them up by `productIdentifier`.
   * Rejects with `OnsideProductsRequestError`.
   */
  loadProducts(input: { productIdentifiers: string[] }): Promise<JSProductsResponse>;

  // ───────────────────────── Payments ──────────────────────────

  /**
   * Initiate a purchase. The product must be in the in-memory cache
   * populated by a prior `loadProducts` call; otherwise the promise
   * rejects with `{ unknownProduct: {} }`.
   *
   * Subsequent state changes for this transaction are delivered via
   * `onTransactionsUpdated`. The promise itself only reports the
   * synchronous pre-flight outcome.
   *
   * Rejects with `JSPurchaseError`.
   */
  purchase(input: {
    productIdentifier: string;
    appAccountToken?: string;
  }): Promise<void>;

  /**
   * Restore previously completed transactions. The promise only
   * reports the pre-flight outcome — actual completion is delivered
   * via `onRestoreCompletedTransactionsFinished` /
   * `onRestoreCompletedTransactionsFailedWithError`.
   *
   * Rejects with `OnsidePaymentQueueRequestRestoreError`.
   */
  restoreCompletedTransactions(): Promise<void>;

  /**
   * Snapshot of currently alive transactions in the payment queue.
   */
  getTransactions(): Promise<JSPaymentTransaction[]>;

  /**
   * Finish a transaction by its opaque id (`JSPaymentTransaction.id`).
   *
   * Removal is immediate only for a transaction that has not been sent for
   * payment yet. For `purchased`, `restored` and `failed` the transaction is
   * marked for completion and removed once that completes, so
   * `onTransactionsRemoved` may arrive noticeably later. A transaction that is
   * `purchasing` because payment is already in flight cannot be finished: the
   * promise still resolves, but nothing happens — wait for a terminal state.
   *
   * Rejects with `JSFinishTransactionError`.
   */
  finishTransaction(id: string): Promise<void>;

  // ──────────────────────── Attribution ────────────────────────

  /**
   * Fetch attribution metadata for the current install/user.
   * Rejects with `OnsideAttributionMetadataError`.
   */
  getAttributionMetadata(): Promise<JSAttributionMetadata>;

  // ────────────────────────── History ──────────────────────────

  /**
   * Fetch the signed in-apps history JWT for the current user.
   * Rejects with `OnsideSignedInAppsHistoryRequestError`.
   */
  getSignedInAppsHistory(): Promise<JSSignedInAppsHistory>;

  // ───────────────── Native → JS callbacks ─────────────────────
  // Assign a function to the property to receive events. All callbacks
  // are optional; a missing handler is a no-op (except where noted).

  /** Transactions added to the queue or transitioned to a new state. */
  onTransactionsUpdated?(transactions: JSPaymentTransaction[]): void | Promise<void>;

  /** Transactions removed from the queue (typically after `finishTransaction`). */
  onTransactionsRemoved?(transactions: JSPaymentTransaction[]): void | Promise<void>;

  /** Storefront selection changed; `null` when unavailable. */
  onStorefrontChanged?(storefront: JSStorefront | null): void | Promise<void>;

  /** `restoreCompletedTransactions` flow finished successfully. */
  onRestoreCompletedTransactionsFinished?(): void | Promise<void>;

  /** `restoreCompletedTransactions` flow failed. */
  onRestoreCompletedTransactionsFailedWithError?(
    error: OnsideTransactionsRestoreError
  ): void | Promise<void>;

  /**
   * Gate the queue invokes when a queued transaction is about to execute in a
   * storefront different from the one it was enqueued in — typically because
   * the user logged into an account registered in another country, where the
   * price or availability differs. Same-storefront purchases never call it.
   *
   * Return `false` to discard the transaction. It is then removed from the
   * queue and reported through `onTransactionsRemoved`; it does not reach
   * `failed`, and the originating `purchase` promise has already resolved.
   *
   * Native defaults to `true` when no handler is registered, when the handler
   * throws, and when it returns anything that is not a boolean — a handler that
   * forgets to `return` therefore approves the purchase.
   */
  shouldContinueTransaction?(input: {
    transaction: JSPaymentTransaction;
    storefront: JSStorefront;
  }): boolean | Promise<boolean>;

  /**
   * Async pre-flight gate the queue invokes when `purchase` had to log
   * the user in first. Fires after the login succeeds and before the
   * transaction is enqueued. Return `false` to drop the purchase — the
   * `purchase` call then rejects with `rejectedAfterLogin` and no
   * transaction callback is delivered.
   *
   * Native defaults to `true` when no handler is registered, when the handler
   * throws, and when it returns anything that is not a boolean.
   */
  shouldContinueTransactionAfterLogin?(input: {
    transaction: JSPaymentTransaction;
  }): boolean | Promise<boolean>;
}

// ═══════════════════════════ Domain types ═══════════════════════════

export interface JSPrice {
  value: number;
  currencyCode: string;
}

export interface JSPeriod {
  unit: 'day' | 'week' | 'month' | 'year';
  numberOfUnits: number;
}

export interface JSPricePeriod {
  price: JSPrice;
  period: JSPeriod;
}

export interface JSProduct {
  productIdentifier: string;
  localizedTitle: string;
  localizedDescription: string;
  iconUrl?: string;
  subscriptionGroupIdentifier?: string;
  subscriptionPeriod?: JSPeriod;
  price: JSPrice;
  introductoryPrice?: JSPricePeriod;
  discountedPrice?: JSPricePeriod;
}

export interface JSStorefront {
  /**
   * Opaque storefront handle. Stable for the lifetime of the app process only —
   * it is regenerated on every launch, so never persist it or compare it across
   * sessions. Use `countryCode` for anything durable.
   */
  id: string;
  countryCode: string;
}

export interface JSPayment {
  product: JSProduct;
  appAccountToken?: string;
}

export type JSPaymentTransactionState =
  | 'purchasing'
  | 'purchased'
  | 'restored'
  | 'failed';

export interface JSPaymentTransaction {
  /** Opaque UUID string. Use with `finishTransaction`. */
  id: string;
  /** Server-side order id. Absent until payment has been sent. */
  transactionIdentifier?: string;
  /**
   * Currently always equal to `transactionIdentifier`. Reserved for a future
   * renewal chain — do not group renewals by it yet.
   */
  originalTransactionIdentifier?: string;
  payment: JSPayment;
  transactionState: JSPaymentTransactionState;
  storefront: JSStorefront;
  error?: OnsidePaymentTransactionError;
}

export interface JSAttributionMetadata {
  refererUrl?: string;
}

export interface JSSignedInAppsHistory {
  /** Raw payload bytes, base64-encoded. */
  dataBase64: string;
  /** UTF-8 decoded payload, when applicable. */
  string?: string;
}

export interface JSProductsResponse {
  products: JSProduct[];
  invalidProductIdentifiers: string[];
}

/** Single value inside an event-parameter array. */
export type JSEventArrayParameterValue = string | number | boolean;

/** Event-parameter value: primitive or array of primitives. */
export type JSEventParameterValue =
  | string
  | number
  | boolean
  | JSEventArrayParameterValue[];

// ═════════════════════════════ Errors ═══════════════════════════════
// All native enums serialize as `{ <caseName>: {} }`. Discriminate by
// checking which key is present.

export type OnsideLoginError = { loginDiscarded: {} };

export type OnsideProductsRequestError =
  | { cancelled: {} }
  | { connectionError: {} }
  | { appNotRegistered: {} }
  | { invalidProductIdentifier: {} }
  | { serviceUnavailable: {} }
  | { internalError: {} };

export type OnsideSignedInAppsHistoryRequestError =
  | { notLoggedIn: {} }
  | { notSupportedInLocalTesting: {} }
  | { cancelled: {} }
  | { connectionError: {} }
  | { appNotRegistered: {} }
  | { serviceUnavailable: {} }
  | { internalError: {} };

export type OnsidePaymentMethodsManagerError =
  | { loginDiscarded: {} }
  | { notSupportedInLocalTesting: {} }
  | { presentationFailed: {} };

export type OnsidePaymentQueueRequestRestoreError = { loginDiscarded: {} };

export type OnsideTransactionsRestoreError =
  | { cancelled: {} }
  | { connectionError: {} }
  | { appNotRegistered: {} }
  | { serviceUnavailable: {} }
  | { internalError: {} };

export type OnsidePaymentTransactionError =
  | { cancelled: {} }
  | { presentationFailed: {} };

export type OnsideAttributionMetadataError =
  | { connectionError: {} }
  | { appNotRegistered: {} }
  | { serviceUnavailable: {} }
  | { internalError: {} };

/** JS-bridge specific error for `purchase`. */
export type JSPurchaseError =
  | { unknownProduct: {} }
  | { loginDiscarded: {} }
  | { rejectedAfterLogin: {} };

/** JS-bridge specific error for `finishTransaction`. */
export type JSFinishTransactionError = { unknownTransaction: {} };

/** Rejection of `initializeOnside` when the bridge could not be installed. */
export interface OnsideInitializeError {
  reason: string;
}

/**
 * A call that never reached native logic. Delivered as a real `Error`
 * instance, so `error instanceof Error` distinguishes it from every domain
 * error above.
 */
export interface OnsideBridgeError extends Error {
  name: 'PontoonBridgeError';
  code:
    | 'bridgeDetached'
    | 'brokenRequest'
    | 'disallowedFrame'
    | 'functionNotDefined'
    | 'invalidArguments'
    | 'parametersNotRepresentable'
    | 'cannotSerializeResponse';
}
