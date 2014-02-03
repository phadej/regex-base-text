# regex-data-text

Compatibility layer for using [regex-base](http://hackage.haskell.org/package/regex-base) engines with
[`Data.Text`](http://hackage.haskell.org/package/text).

This modules provides `RegexMaker` and `RegexLike` instances for using `Text`
with any regexp engine which provides such instances for `ByteString`.

Also provides `Extract` `Text` instance.
