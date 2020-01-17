module Parameter exposing (Parameter(..))

{-| Parameters codes according to
<https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters>


# Parameter

@docs Parameter

-}

import Currency exposing (Currency)
import HitType
import Url.Builder exposing (QueryParameter, int, string)


type alias Text =
    String


{-| Measurement Protocol Parameter
-}
type Parameter
    = ProtocolVersion Text
    | TrackingID Text
    | AnonymizeIP Bool
    | DataSource Text
    | QueueTime Int
    | CacheBuster Text
    | ClientID Text
    | UserID Text
    | SessionControl Text
    | IPOverride Text
    | UserAgentOverride Text
    | GeographicalOverride Text
    | DocumentReferrer Text
    | CampaignName Text
    | CampaignSource Text
    | CampaignMedium Text
    | CampaignKeyword Text
    | CampaignContent Text
    | CampaignID Text
    | GoogleAdsID Text
    | GoogleDisplayAdsID Text
    | ScreenResolution Text
    | Viewportsize Text
    | DocumentEncoding Text
    | ScreenColors Text
    | UserLanguage Text
    | JavaEnabled Bool
    | FlashVersion Text
    | Hittype HitType.HitType
    | NonInteractionHit Bool
    | DocumentlocationURL Text
    | DocumentHostName Text
    | DocumentPath Text
    | DocumentTitle Text
    | ScreenName Text
    | ContentGroup Int Text
    | LinkID Text
    | ApplicationName Text
    | ApplicationID Text
    | ApplicationVersion Text
    | ApplicationInstallerID Text
    | EventCategory Text
    | EventAction Text
    | EventLabel Text
    | EventValue Int
    | TransactionID Text
    | TransactionAffiliation Text
    | TransactionRevenue Currency
    | TransactionShipping Currency
    | TransactionTax Currency
    | ItemName Text
    | ItemPrice Currency
    | ItemQuantity Int
    | ItemCode Text
    | ItemCategory Text
    | ProductSKU Int Text
    | ProductName Int Text
    | ProductBrand Int Text
    | ProductCategory Int Text
    | ProductVariant Int Text
    | ProductPrice Int Currency
    | ProductQuantity Int Int
    | ProductCouponCode Int Text
    | ProductPosition Int Int
    | ProductCustomDimension Int Int Text
    | ProductCustomMetric Int Int Int
    | ProductImpressionListName Int Text
    | ProductImpressionSKU Int Int Text
    | ProductImpressionName Int Int Text
    | ProductImpressionBrand Int Int Text
    | ProductImpressionCategory Int Int Text
    | ProductImpressionVariant Int Int Text
    | ProductImpressionPosition Int Int Int
    | ProductImpressionPrice Int Int Currency
    | ProductImpressionCustomDimension Int Int Int Text
    | ProductImpressionCustomMetric Int Int Int Int
    | ProductAction Text
    | Affiliation Text
    | Revenue Currency
    | Tax Currency
    | Shipping Currency
    | CouponCode Text
    | ProductActionList Text
    | CheckoutStep Int
    | CheckoutStepOption Text
    | PromotionID Int Text
    | PromotionName Int Text
    | PromotionCreative Int Text
    | PromotionPosition Int Text
    | PromotionAction Text
    | CurrencyCode Text
    | SocialNetwork Text
    | SocialAction Text
    | SocialActionTarget Text
    | Usertimingcategory Text
    | Usertimingvariablename Text
    | Usertimingtime Int
    | Usertiminglabel Text
    | PageLoadTime Int
    | DNSTime Int
    | PageDownloadTime Int
    | RedirectResponseTime Int
    | TCPConnectTime Int
    | ServerResponseTime Int
    | DOMInteractiveTime Int
    | ContentLoadTime Int
    | ExceptionDescription Text
    | IsExceptionFatal Bool
    | CustomDimension Int Text
    | CustomMetric Int Text
