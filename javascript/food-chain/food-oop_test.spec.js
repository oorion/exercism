var Song = require('./food-chain');

describe('Food Chain', function () {

  it('fly', function () {
    var expected = "I know an old lady who swallowed a fly.\nI don't know why she swallowed the fly. Perhaps she'll die.\n";
    var song = new Song("foobar");
    expect(song.verse(1)).toEqual(expected);
    expect(song.lyrics).toEqual("foobar");
  });

  xit('spider', function () {
    var expected = "I know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\n" +
      "She swallowed the spider to catch the fly.\n" + "I don't know why she swallowed the fly. Perhaps she'll die.\n";

    expect(song.verse(2)).toEqual(expected);
  });
});
