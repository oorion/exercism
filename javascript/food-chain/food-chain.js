function sing(data) {
  var expected = "I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.\n";
  return expected;
};

var Song = function Song(lyrics) {
  this.lyrics = lyrics;
};

Song.prototype.verse = function() {
  console.log(this.lyrics);
  return "I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.\n";
  // return this.lyrics;
}

module.exports = Song;
