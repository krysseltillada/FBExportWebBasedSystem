var convertMass = function (from, to, value) {
                return math.unit(value, from).toNumber(to);
            };

var formatMoney = function (val, sign, formatValue) {

    return accounting.formatMoney(val,
                                    {
                                        symbol : sign,
                                        format : formatValue
                                    });
};

var convertFlatpickrDateToSystemDate = function (date) {
        return flatpickr.formatDate(flatpickr.parseDate(date, "F j, Y"), "Y-m-d");
};