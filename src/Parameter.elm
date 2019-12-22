module Parameter exposing (..)

{-| Parameters codes according to
https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters
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
    | ProductAction
    | Affiliation
    | Revenue
    | Tax
    | Shipping
    | CouponCode
    | ProductActionList
    | CheckoutStep
    | CheckoutStepOption
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


contentGroup : Int -> String
contentGroup groupIndex =
    "cg" ++ String.fromInt groupIndex


productSKU : Int -> String
productSKU productIndex =
    "pr" ++ String.fromInt productIndex ++ "id"


productName : Int -> String
productName productIndex =
    "pr" ++ String.fromInt productIndex ++ "nm"


productBrand : Int -> String
productBrand productIndex =
    "pr" ++ String.fromInt productIndex ++ "br"


productCategory : Int -> String
productCategory productIndex =
    "pr" ++ String.fromInt productIndex ++ "ca"


productVariant : Int -> String
productVariant productIndex =
    "pr" ++ String.fromInt productIndex ++ "va"


productPrice : Int -> String
productPrice productIndex =
    "pr" ++ String.fromInt productIndex ++ "pr"


productQuantity : Int -> String
productQuantity productIndex =
    "pr" ++ String.fromInt productIndex ++ "qt"


productCouponCode : Int -> String
productCouponCode productIndex =
    "pr" ++ String.fromInt productIndex ++ "cc"


productPosition : Int -> String
productPosition productIndex =
    "pr" ++ String.fromInt productIndex ++ "ps"


productCustomDimension : Int -> Int -> String
productCustomDimension productIndex dimensionIndex =
    "pr"
        ++ String.fromInt productIndex
        ++ "cd"
        ++ String.fromInt dimensionIndex


productCustomMetric : Int -> Int -> String
productCustomMetric productIndex metricIndex =
    "pr" ++ String.fromInt productIndex ++ "cm" ++ String.fromInt metricIndex


productImpressionListName : Int -> String
productImpressionListName listIndex =
    "il" ++ String.fromInt listIndex ++ "nm"


productImpressionSKU : Int -> Int -> String
productImpressionSKU listIndex productIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "id"


productImpressionName : Int -> Int -> String
productImpressionName listIndex productIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "nm"


productImpressionBrand : Int -> Int -> String
productImpressionBrand listIndex productIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "br"


productImpressionCategory : Int -> Int -> String
productImpressionCategory listIndex productIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "ca"


productImpressionVariant : Int -> Int -> String
productImpressionVariant listIndex productIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "va"


productImpressionPosition : Int -> Int -> String
productImpressionPosition listIndex productIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "ps"


productImpressionPrice : Int -> Int -> String
productImpressionPrice listIndex productIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "pr"


productImpressionCustomDimension : Int -> Int -> Int -> String
productImpressionCustomDimension listIndex productIndex dimensionIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "cd"
        ++ String.fromInt dimensionIndex


productImpressionCustomMetric : Int -> Int -> Int -> String
productImpressionCustomMetric listIndex productIndex metricIndex =
    "il"
        ++ String.fromInt listIndex
        ++ "pi"
        ++ String.fromInt productIndex
        ++ "cm"
        ++ String.fromInt metricIndex


promotionID : Int -> String
promotionID promoIndex =
    "promo" ++ String.fromInt promoIndex ++ "id"


promotionName : Int -> String
promotionName promoIndex =
    "promo" ++ String.fromInt promoIndex ++ "nm"


promotionCreative : Int -> String
promotionCreative promoIndex =
    "promo" ++ String.fromInt promoIndex ++ "cr"


promotionPosition : Int -> String
promotionPosition promoIndex =
    "promo" ++ String.fromInt promoIndex ++ "ps"
