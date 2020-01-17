module Query exposing (toQuery)

import Currency exposing (Currency)
import HitType exposing (HitType(..))
import Parameter exposing (Parameter(..))
import Url.Builder exposing (QueryParameter, int, string)


boolToInt : Bool -> Int
boolToInt bool =
    if bool == True then
        1

    else
        0


toString : HitType -> String
toString hitType =
    case hitType of
        Pageview ->
            "pageview"

        Screenview ->
            "screenview"

        Event ->
            "event"

        Transaction ->
            "transaction"

        Item ->
            "item"

        Social ->
            "social"

        Exception ->
            "exception"

        Timing ->
            "timing"


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
            string "t" <| toString type_

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
