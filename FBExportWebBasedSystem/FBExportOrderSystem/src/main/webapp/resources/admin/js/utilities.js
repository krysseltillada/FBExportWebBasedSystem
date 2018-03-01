var convertMass = function (from, to, value) {
                return math.unit(value, from).toNumber(to);
            };

var formatMoney = function (val, sign, formatValue) {

    console.log("taee");

    return accounting.formatMoney(val,
                                    {
                                        symbol : sign,
                                        format : formatValue
                                    });
};