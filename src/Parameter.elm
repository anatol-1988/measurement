module Parameter exposing (Parameter(..), toString)

{-| Parameters codes according to
<https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters>
-}


type Parameter
    = ProtocolVersion
    | TrackingID
    | AnonymizeIP
    | DataSource
    | QueueTime
    | CacheBuster
    | ClientID
    | UserID
    | SessionControl
    | IPOverride
    | UserAgentOverride
    | GeographicalOverride
    | DocumentReferrer
    | CampaignName
    | CampaignSource
    | CampaignMedium
    | CampaignKeyword
    | CampaignContent
    | CampaignID
    | GoogleAdsID
    | GoogleDisplayAdsID
    | ScreenResolution
    | Viewportsize
    | DocumentEncoding
    | ScreenColors
    | UserLanguage
    | JavaEnabled
    | FlashVersion
    | Hittype
    | NonInteractionHit
    | DocumentlocationURL
    | DocumentHostName
    | DocumentPath
    | DocumentTitle
    | ScreenName
    | ContentGroup Int
    | LinkID
    | ApplicationName
    | ApplicationID
    | ApplicationVersion
    | ApplicationInstallerID
    | EventCategory
    | EventAction
    | EventLabel
    | EventValue
    | TransactionID
    | TransactionAffiliation
    | TransactionRevenue
    | TransactionShipping
    | TransactionTax
    | ItemName
    | ItemPrice
    | ItemQuantity
    | ItemCode
    | ItemCategory
    | ProductSKU Int
    | ProductName Int
    | ProductBrand Int
    | ProductCategory Int
    | ProductVariant Int
    | ProductPrice Int
    | ProductQuantity Int
    | ProductCouponCode Int
    | ProductPosition Int
    | ProductCustomDimension Int Int
    | ProductCustomMetric Int Int
    | ProductImpressionListName Int
    | ProductImpressionSKU Int Int
    | ProductImpressionName Int Int
    | ProductImpressionBrand Int Int
    | ProductImpressionCategory Int Int
    | ProductImpressionVariant Int Int
    | ProductImpressionPosition Int Int
    | ProductImpressionPrice Int Int
    | ProductImpressionCustomDimension Int Int Int
    | ProductImpressionCustomMetric Int Int Int
    | ProductAction
    | Affiliation
    | Revenue
    | Tax
    | Shipping
    | CouponCode
    | ProductActionList
    | CheckoutStep
    | CheckoutStepOption
    | PromotionID Int
    | PromotionName Int
    | PromotionCreative Int
    | PromotionPosition Int
    | PromotionAction
    | CurrencyCode
    | SocialNetwork
    | SocialAction
    | SocialActionTarget
    | Usertimingcategory
    | Usertimingvariablename
    | Usertimingtime
    | Usertiminglabel
    | PageLoadTime
    | DNSTime
    | PageDownloadTime
    | RedirectResponseTime
    | TCPConnectTime
    | ServerResponseTime
    | DOMInteractiveTime
    | ContentLoadTime
    | ExceptionDescription
    | IsExceptionFatal
    | CustomDimension1
    | CustomMetric1


toString : Parameter -> String
toString param =
    case param of
        ProtocolVersion ->
            "v"

        TrackingID ->
            "tid"

        AnonymizeIP ->
            "aip"

        DataSource ->
            "ds"

        QueueTime ->
            "qt"

        CacheBuster ->
            "z"

        ClientID ->
            "cid"

        UserID ->
            "uid"

        SessionControl ->
            "sc"

        IPOverride ->
            "uip"

        UserAgentOverride ->
            "ua"

        GeographicalOverride ->
            "geoid"

        DocumentReferrer ->
            "dr"

        CampaignName ->
            "cn"

        CampaignSource ->
            "cs"

        CampaignMedium ->
            "cm"

        CampaignKeyword ->
            "ck"

        CampaignContent ->
            "cc"

        CampaignID ->
            "ci"

        GoogleAdsID ->
            "gclid"

        GoogleDisplayAdsID ->
            "dclid"

        ScreenResolution ->
            "sr"

        Viewportsize ->
            "vp"

        DocumentEncoding ->
            "de"

        ScreenColors ->
            "sd"

        UserLanguage ->
            "ul"

        JavaEnabled ->
            "je"

        FlashVersion ->
            "fl"

        Hittype ->
            "t"

        NonInteractionHit ->
            "ni"

        DocumentlocationURL ->
            "dl"

        DocumentHostName ->
            "dh"

        DocumentPath ->
            "dp"

        DocumentTitle ->
            "dt"

        ScreenName ->
            "cd"

        ContentGroup groupIndex ->
            "cg" ++ String.fromInt groupIndex

        LinkID ->
            "linkid"

        ApplicationName ->
            "an"

        ApplicationID ->
            "aid"

        ApplicationVersion ->
            "av"

        ApplicationInstallerID ->
            "aiid"

        EventCategory ->
            "ec"

        EventAction ->
            "ea"

        EventLabel ->
            "el"

        EventValue ->
            "ev"

        TransactionID ->
            "ti"

        TransactionAffiliation ->
            "ta"

        TransactionRevenue ->
            "tr"

        TransactionShipping ->
            "ts"

        TransactionTax ->
            "tt"

        ItemName ->
            "in"

        ItemPrice ->
            "ip"

        ItemQuantity ->
            "iq"

        ItemCode ->
            "ic"

        ItemCategory ->
            "iv"

        ProductSKU productIndex ->
            "pr" ++ String.fromInt productIndex ++ "id"

        ProductName productIndex ->
            "pr" ++ String.fromInt productIndex ++ "nm"

        ProductBrand productIndex ->
            "pr" ++ String.fromInt productIndex ++ "br"

        ProductCategory productIndex ->
            "pr" ++ String.fromInt productIndex ++ "ca"

        ProductVariant productIndex ->
            "pr" ++ String.fromInt productIndex ++ "va"

        ProductPrice productIndex ->
            "pr" ++ String.fromInt productIndex ++ "pr"

        ProductQuantity productIndex ->
            "pr" ++ String.fromInt productIndex ++ "qt"

        ProductCouponCode productIndex ->
            "pr" ++ String.fromInt productIndex ++ "cc"

        ProductPosition productIndex ->
            "pr" ++ String.fromInt productIndex ++ "ps"

        ProductCustomDimension productIndex dimensionIndex ->
            "pr"
                ++ String.fromInt productIndex
                ++ "cd"
                ++ String.fromInt dimensionIndex

        ProductCustomMetric productIndex metricIndex ->
            "pr" ++ String.fromInt productIndex ++ "cm" ++ String.fromInt metricIndex

        ProductImpressionListName listIndex ->
            "il" ++ String.fromInt listIndex ++ "nm"

        ProductImpressionSKU listIndex productIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "id"

        ProductImpressionName listIndex productIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "nm"

        ProductImpressionBrand listIndex productIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "br"

        ProductImpressionCategory listIndex productIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "ca"

        ProductImpressionVariant listIndex productIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "va"

        ProductImpressionPosition listIndex productIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "ps"

        ProductImpressionPrice listIndex productIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "pr"

        ProductImpressionCustomDimension listIndex productIndex dimensionIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "cd"
                ++ String.fromInt dimensionIndex

        ProductImpressionCustomMetric listIndex productIndex metricIndex ->
            "il"
                ++ String.fromInt listIndex
                ++ "pi"
                ++ String.fromInt productIndex
                ++ "cm"
                ++ String.fromInt metricIndex

        ProductAction ->
            "pa"

        Affiliation ->
            "ta"

        Revenue ->
            "tr"

        Tax ->
            "tt"

        Shipping ->
            "ts"

        CouponCode ->
            "tcc"

        ProductActionList ->
            "pal"

        CheckoutStep ->
            "cos"

        CheckoutStepOption ->
            "col"

        PromotionID promoIndex ->
            "promo" ++ String.fromInt promoIndex ++ "id"

        PromotionName promoIndex ->
            "promo" ++ String.fromInt promoIndex ++ "nm"

        PromotionCreative promoIndex ->
            "promo" ++ String.fromInt promoIndex ++ "cr"

        PromotionPosition promoIndex ->
            "promo" ++ String.fromInt promoIndex ++ "ps"

        PromotionAction ->
            "promoa"

        CurrencyCode ->
            "cu"

        SocialNetwork ->
            "sn"

        SocialAction ->
            "sa"

        SocialActionTarget ->
            "st"

        Usertimingcategory ->
            "utc"

        Usertimingvariablename ->
            "utv"

        Usertimingtime ->
            "utt"

        Usertiminglabel ->
            "utl"

        PageLoadTime ->
            "plt"

        DNSTime ->
            "dns"

        PageDownloadTime ->
            "pdt"

        RedirectResponseTime ->
            "rrt"

        TCPConnectTime ->
            "tcp"

        ServerResponseTime ->
            "srt"

        DOMInteractiveTime ->
            "dit"

        ContentLoadTime ->
            "clt"

        ExceptionDescription ->
            "exd"

        IsExceptionFatal ->
            "exf"

        CustomDimension1 ->
            "cd1"

        CustomMetric1 ->
            "cm1"
