module Parameter exposing (Parameter(..), toString)


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
    | ContentGroup1
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
    | ProductSKU1
    | ProductName1
    | ProductBrand1
    | ProductCategory1
    | ProductVariant1
    | ProductPrice1
    | ProductQuantity1
    | ProductCouponCode1
    | ProductPosition1
    | ProductCustomDimension1
    | ProductCustomMetric1
    | ProductAction
    | Affiliation
    | Revenue
    | Tax
    | Shipping
    | CouponCode
    | ProductActionList
    | CheckoutStep
    | CheckoutStepOption
    | ProductImpressionListName1
    | ProductImpressionSKU1
    | ProductImpressionName1
    | ProductImpressionBrand1
    | ProductImpressionCategory1
    | ProductImpressionVariant1
    | ProductImpressionPosition1
    | ProductImpressionPrice1
    | ProductImpressionCustomDimension1
    | ProductImpressionCustomMetric1
    | PromotionID1
    | PromotionName1
    | PromotionCreative1
    | PromotionPosition1
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

        ContentGroup1 ->
            "cg1"

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

        ProductSKU1 ->
            "pr1id"

        ProductName1 ->
            "pr1nm"

        ProductBrand1 ->
            "pr1br"

        ProductCategory1 ->
            "pr1ca"

        ProductVariant1 ->
            "pr1va"

        ProductPrice1 ->
            "pr1pr"

        ProductQuantity1 ->
            "pr1qt"

        ProductCouponCode1 ->
            "pr1cc"

        ProductPosition1 ->
            "pr1ps"

        ProductCustomDimension1 ->
            "pr1cd1"

        ProductCustomMetric1 ->
            "pr1cm1"

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

        ProductImpressionListName1 ->
            "il1nm"

        ProductImpressionSKU1 ->
            "il1pi1id"

        ProductImpressionName1 ->
            "il1pi1nm"

        ProductImpressionBrand1 ->
            "il1pi1br"

        ProductImpressionCategory1 ->
            "il1pi1ca"

        ProductImpressionVariant1 ->
            "il1pi2va"

        ProductImpressionPosition1 ->
            "il1pi2ps"

        ProductImpressionPrice1 ->
            "il1pi2pr"

        ProductImpressionCustomDimension1 ->
            "il1pi2cd3"

        ProductImpressionCustomMetric1 ->
            "il1pi2cm3"

        PromotionID1 ->
            "promo1id"

        PromotionName1 ->
            "promo1nm"

        PromotionCreative1 ->
            "promo1cr"

        PromotionPosition1 ->
            "promo1ps"

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
