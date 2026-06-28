// Onside JS Bridge — TypeScript declarations for `window.onside`.
//
// Setup:
//   await window.onside.initializeOnside('v1');
//
// After initialization:
//   - Functions on `window.onside` are JS → native calls.
//     Each returns a Promise (resolves with success payload, rejects with
//     a typed error envelope). A few setters return `void` synchronously.
//   - Native → JS events are delivered via callbacks; assign your handler
//     to the corresponding optional property
//     (e.g. `window.onside.onTransactionsUpdated = ...`).
//
// All native error enums serialize as `{ <caseName>: {} }`. Use
// `'caseName' in error` to discriminate, or pattern-match the union.

declare global {
  interface Window {
    onside: OnsideJSBridge;
  }
}

export interface OnsideJSBridge {
  // ───────────────────────── Bootstrap ─────────────────────────

  /**
   * Bootstrap the bridge. Must be awaited before any other call.
   * Currently only `'v1'` is supported.
   */
  initializeOnside(version: 'v1'): Promise<void>;

  // ─────────────────────── Configuration ───────────────────────

  /** Override the theme used for native UI presented from JS. */
  setAppearance(theme: 'light' | 'dark' | 'system'): void;

  /** Force local-only login methods on the login screen. */
  setShouldForceLocalLoginMethods(force: boolean): void;

  /**
   * Default country code assumed when system region is unknown.
   * Empty string clears the assumption.
   */
  setDefaultCountryCodeAssumption(countryCode: string): void;

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
  }): void;

  // ─────────────────────────── Auth ────────────────────────────

  /** Show the login flow. Rejects with `OnsideLoginError`. */
  requestLogin(): Promise<void>;

  /** Log out the current user. */
  logout(): void;

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
   * Async pre-flight gate the queue invokes before processing a
   * transaction in a particular storefront. Return `false` to cancel
   * the transaction. If no handler is registered, native defaults
   * to `true`.
   */
  shouldContinueTransaction?(input: {
    transaction: JSPaymentTransaction;
    storefront: JSStorefront;
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
  transactionIdentifier?: string;
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
  | { notSupportedInLocalTesting: {} };

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
  | { loginDiscarded: {} };

/** JS-bridge specific error for `finishTransaction`. */
export type JSFinishTransactionError = { unknownTransaction: {} };
