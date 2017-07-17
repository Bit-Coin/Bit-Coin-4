(function ($) {

    var priceTypesForPage = [['DAP', 'Drive Away No More To Pay'], ['PG', 'Price Guide']],
        popupDefaults = {
            url: "/popup.aspx",
            width: 600,
            height: 400,
            continueEventBubbling: true
        };

    function matchTextToType(text) {

        if (text.indexOf("Price Guide") >= 0) {
            return "PG";
        }

        for (var i = 0, j = priceTypesForPage.length; i < j; i++) {
            if (priceTypesForPage[i][1] == text) {
                return priceTypesForPage[i][0];
            }
        }
        return "";
    }

    $.fn.priceTypePopupLink = function (popupSettings, priceTypes) {
        if (!$.fn.priceTypePopupLink.selector) {
            $.fn.priceTypePopupLink.selector = this.selector;
        }

        if ($.isArray(priceTypes) && priceTypes.length > 0) {
            priceTypesForPage = priceTypes;
        }

        $.extend(popupDefaults, popupSettings);

        this.each(function () {
            var priceType = $.trim($(this).text().replace(/\s+/g, ' ')),
                type = matchTextToType(priceType);

            $(this).unbind("click").click(function (ev) {
                var popupWindow = window.open(popupDefaults.url + "#" + type, "PriceType", "directories=no,location=no,menubar=no,resizable=yes,scrollbars=yes,toolbar=no,status=no,width=" + popupDefaults.width + ",height=" + popupDefaults.height);
                popupWindow.focus();
                if (!popupDefaults.continueEventBubbling) {
                    ev.stopPropagation();
                    return false;
                }
            });
        });

        return this;
    };

})(jQuery);

function refreshPriceTypePopupLink(context) {
    if (context) {
        jQuery(jQuery.fn.priceTypePopupLink.selector, context).priceTypePopupLink();
    } else {
        jQuery(jQuery.fn.priceTypePopupLink.selector).priceTypePopupLink();
    }
}