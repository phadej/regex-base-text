{-|
This modules provides 'RegexMaker' and 'RegexLike' instances for using 'Text'
with any regexp engine which provides such instances for 'ByteString'.

Also provides `Extract` `Text` instance.
-}
module Text.Regex.Base.Text (
  module Text.Regex.Base
 ) where

import Text.Regex.Base

import Data.Text (Text)
import qualified Data.Text as T
import Data.Text.Encoding (encodeUtf8)

import Data.ByteString (ByteString)

import Text.Regex.Base.Impl (polymatch, polymatchM)

instance RegexContext r ByteString ByteString => RegexContext r Text Text where
  match = polymatch
  matchM = polymatchM

instance RegexMaker r c e ByteString => RegexMaker r c e Text where
  makeRegexOptsM c e source = makeRegexOptsM c e (encodeUtf8 source)

instance RegexLike r ByteString => RegexLike r Text where
  matchOnce r s = matchOnce r (encodeUtf8 s)
  matchAll r s = matchAll r (encodeUtf8 s)
  matchCount r s = matchCount r (encodeUtf8 s)

instance Extract Text where
  before = T.take
  after = T.drop
  empty = T.empty
