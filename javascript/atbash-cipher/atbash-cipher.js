var createAlphabet = function () {
  var output = [];
  for (var i = 97; i < 123; i++) {
    output.push(String.fromCharCode(i));
  }
  return output;
};

var sanitize = function(text) {
  return text.toLowerCase().replace(/[^a-z0-9]+/g, "");
};

var encrypt = function(unencrypted) {
  output = [];
  var i = 1;
  unencrypted.map(function(currentValue, index) {
    if (currentValue.match(/[0-9]/)) {
      output.push(currentValue)
    } else {
      var charKey = createAlphabet().indexOf(currentValue);
      output.push(createAlphabet().reverse()[charKey]);
    }
    if (i % 5 == 0) {
      output.push(" ")
    };
    i += 1
  });
  return output.join("").trim();
};

var atbash = {
  encode: function (unencryptedText) {
    sanitizedText = sanitize(unencryptedText);
    var convertedText = sanitizedText.split("");
    return encrypt(convertedText);
  }
};

module.exports = atbash
