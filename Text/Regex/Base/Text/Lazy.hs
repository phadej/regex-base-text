{-|
This modules provides 'RegexMaker' and 'RegexLike' instances for using lazy
'Text' with any regexp engine which provides such instances for lazy
'ByteString'.

Also provides `Extract` `Text` instance.
-}
module Text.Regex.Base.Text.Lazy (
  module Text.Regex.Base
 ) where

import Text.Regex.Base

import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as T
import Data.Text.Lazy.Encoding (encodeUtf8)

import Data.ByteString.Lazy (ByteString)

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
  before n = T.take (fromIntegral n)
  after n = T.drop (fromIntegral n)
  empty = T.empty
