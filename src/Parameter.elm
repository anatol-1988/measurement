module Parameter exposing (Parameter(..), toQuery)

import Currency exposing (Currency)
import HitType
import Url.Builder exposing (QueryParameter, int, string)


{-| Parameters codes according to
<https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters>
-}
type alias Text =
    String


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


boolToInt : Bool -> Int
boolToInt bool =
    if bool == True then
        1

    else
        0


toQuery : Parameter -> QueryParameter
toQuery param =
    case param of
        ProtocolVersion version ->
            string "v" version

        TrackingID id ->
            string "tid" id

        AnonymizeIP anonymize ->
            int "aip" <| boolToInt anonymize

        DataSource source ->
            string "ds" source

        QueueTime time ->
            int "qt" time

        CacheBuster cache ->
            string "z" cache

        ClientID id ->
            string "cid" id

        UserID id ->
            string "uid" id

        SessionControl control ->
            string "sc" control

        IPOverride ip ->
            string "uip" ip

        UserAgentOverride agent ->
            string "ua" agent

        GeographicalOverride geo ->
            string "geoid" geo

        DocumentReferrer referrer ->
            string "dr" referrer

        CampaignName name ->
            string "cn" name

        CampaignSource source ->
            string "cs" source

        CampaignMedium medium ->
            string "cm" medium

        CampaignKeyword keyword ->
            string "ck" keyword

        CampaignContent content ->
            string "cc" content

        CampaignID id ->
            string "ci" id

        GoogleAdsID id ->
            string "gclid" id

        GoogleDisplayAdsID id ->
            string "dclid" id

        ScreenResolution resolution ->
            string "sr" resolution

        Viewportsize size ->
            string "vp" size

        DocumentEncoding encoding ->
            string "de" encoding

        ScreenColors colors ->
            string "sd" colors

        UserLanguage lang ->
            string "ul" lang

        JavaEnabled enabled ->
            int "je" <| boolToInt enabled

        FlashVersion version ->
            string "fl" version

        Hittype type_ ->
            string "t" <| HitType.toString type_

        NonInteractionHit hit ->
            int "ni" <| boolToInt hit

        DocumentlocationURL url ->
            string "dl" url

        DocumentHostName name ->
            string "dh" name

        DocumentPath path ->
            string "dp" path

        DocumentTitle title ->
            string "dt" title

        ScreenName name ->
            string "cd" name

        ContentGroup groupIndex group ->
            string ("cg" ++ String.fromInt groupIndex) group

        LinkID id ->
            string "linkid" id

        ApplicationName name ->
            string "an" name

        ApplicationID id ->
            string "aid" id

        ApplicationVersion version ->
            string "av" version

        ApplicationInstallerID id ->
            string "aiid" id

        EventCategory category ->
            string "ec" category

        EventAction action ->
            string "ea" action

        EventLabel label ->
            string "el" label

        EventValue value ->
            int "ev" value

        TransactionID id ->
            string "ti" id

        TransactionAffiliation affilation ->
            string "ta" affilation

        TransactionRevenue revenue ->
            string "tr" <| Currency.toString revenue

        TransactionShipping shipping ->
            string "ts" <| Currency.toString shipping

        TransactionTax tax ->
            string "tt" <| Currency.toString tax

        ItemName name ->
            string "in" name

        ItemPrice price ->
            string "ip" <| Currency.toString price

        ItemQuantity quantity ->
            int "iq" quantity

        ItemCode code ->
            string "ic" code

        ItemCategory category ->
            string "iv" category

        ProductSKU productIndex sku ->
            string ("pr" ++ String.fromInt productIndex ++ "id") sku

        ProductName productIndex name ->
            string ("pr" ++ String.fromInt productIndex ++ "nm") name

        ProductBrand productIndex brand ->
            string ("pr" ++ String.fromInt productIndex ++ "br") brand

        ProductCategory productIndex category ->
            string ("pr" ++ String.fromInt productIndex ++ "ca") category

        ProductVariant productIndex variant ->
            string ("pr" ++ String.fromInt productIndex ++ "va") variant

        ProductPrice productIndex price ->
            string ("pr" ++ String.fromInt productIndex ++ "pr")
                (Currency.toString price)

        ProductQuantity productIndex quantity ->
            int ("pr" ++ String.fromInt productIndex ++ "qt") quantity

        ProductCouponCode productIndex code ->
            string ("pr" ++ String.fromInt productIndex ++ "cc") code

        ProductPosition productIndex position ->
            int ("pr" ++ String.fromInt productIndex ++ "ps") position

        ProductCustomDimension productIndex dimensionIndex dimension ->
            string
                ("pr"
                    ++ String.fromInt productIndex
                    ++ "cd"
                    ++ String.fromInt dimensionIndex
                )
                dimension

        ProductCustomMetric productIndex metricIndex metric ->
            int
                ("pr" ++ String.fromInt productIndex ++ "cm" ++ String.fromInt metricIndex)
                metric

        ProductImpressionListName listIndex name ->
            string ("il" ++ String.fromInt listIndex ++ "nm") name

        ProductImpressionSKU listIndex productIndex sku ->
            string
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "id"
                )
                sku

        ProductImpressionName listIndex productIndex name ->
            string
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "nm"
                )
                name

        ProductImpressionBrand listIndex productIndex brand ->
            string
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "br"
                )
                brand

        ProductImpressionCategory listIndex productIndex category ->
            string
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "ca"
                )
                category

        ProductImpressionVariant listIndex productIndex variant ->
            string
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "va"
                )
                variant

        ProductImpressionPosition listIndex productIndex position ->
            int
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "ps"
                )
                position

        ProductImpressionPrice listIndex productIndex price ->
            string
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "pr"
                )
                (Currency.toString price)

        ProductImpressionCustomDimension listIndex productIndex dimensionIndex dimension ->
            string
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "cd"
                    ++ String.fromInt dimensionIndex
                )
                dimension

        ProductImpressionCustomMetric listIndex productIndex metricIndex metric ->
            int
                ("il"
                    ++ String.fromInt listIndex
                    ++ "pi"
                    ++ String.fromInt productIndex
                    ++ "cm"
                    ++ String.fromInt metricIndex
                )
                metric

        ProductAction action ->
            string "pa" action

        Affiliation affilation ->
            string "ta" affilation

        Revenue revenue ->
            string "tr" <| Currency.toString revenue

        Tax tax ->
            string "tt" <| Currency.toString tax

        Shipping shipping ->
            string "ts" <| Currency.toString shipping

        CouponCode code ->
            string "tcc" code

        ProductActionList list ->
            string "pal" list

        CheckoutStep step ->
            int "cos" step

        CheckoutStepOption option ->
            string "col" option

        PromotionID promoIndex id ->
            string ("promo" ++ String.fromInt promoIndex ++ "id") id

        PromotionName promoIndex name ->
            string ("promo" ++ String.fromInt promoIndex ++ "nm") name

        PromotionCreative promoIndex creative ->
            string ("promo" ++ String.fromInt promoIndex ++ "cr") creative

        PromotionPosition promoIndex position ->
            string ("promo" ++ String.fromInt promoIndex ++ "ps") position

        PromotionAction action ->
            string "promoa" action

        CurrencyCode code ->
            string "cu" code

        SocialNetwork network ->
            string "sn" network

        SocialAction action ->
            string "sa" action

        SocialActionTarget target ->
            string "st" target

        Usertimingcategory category ->
            string "utc" category

        Usertimingvariablename name ->
            string "utv" name

        Usertimingtime time ->
            int "utt" time

        Usertiminglabel label ->
            string "utl" label

        PageLoadTime time ->
            int "plt" time

        DNSTime time ->
            int "dns" time

        PageDownloadTime time ->
            int "pdt" time

        RedirectResponseTime time ->
            int "rrt" time

        TCPConnectTime time ->
            int "tcp" time

        ServerResponseTime time ->
            int "srt" time

        DOMInteractiveTime time ->
            int "dit" time

        ContentLoadTime time ->
            int "clt" time

        ExceptionDescription description ->
            string "exd" description

        IsExceptionFatal fatal ->
            int "exf" <| boolToInt fatal

        CustomDimension dimension value ->
            string ("cd" ++ String.fromInt dimension) value

        CustomMetric metric value ->
            string ("cm" ++ String.fromInt metric) value
