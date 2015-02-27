function Crypto(text){
  this.text = text;
}

Crypto.prototype.normalizePlaintext = function() {
  return this.text.replace(/\W/g,"").toLowerCase();
}

Crypto.prototype.size = function() {
  var normalizedText = this.normalizePlaintext();
  return Math.ceil(Math.sqrt(normalizedText.length));
}

Crypto.prototype.plaintextSegments = function() {
  var normalizedText = this.normalizePlaintext();
  var squareSize = this.size();
  segment = "";
  square = [];
  normalizedText.split("").forEach(function(element, index, array) {
    if (segment.length < squareSize - 1) {
      if (index == array.length - 1) {
        segment += element;
        square.push(segment);
      }
      segment += element;
    } else {
      segment += element;
      square.push(segment);
      segment = "";
    }
  });
  return square;
}

Crypto.prototype.ciphertext = function() {
  var square = this.plaintextSegments();
  var normalizedPlaintext = this.normalizePlaintext();
  var cipherText = "";
  var index = 0;
  while (cipherText.length < normalizedPlaintext.length) {
    square.every(function(element) {
      if (element[index] == undefined) {
        return false;
      } else {
        cipherText += element[index];
      }
    });
    index++;
  }
  return cipherText;
}

module.exports = Crypto
