{-# LANGUAGE OverloadedStrings #-}

-- Module      : Test.AWS.DynamoDBStreams
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Test.AWS.DynamoDBStreams
    ( tests
    , fixtures
    ) where

import           Network.AWS.DynamoDBStreams
import           Test.AWS.Gen.DynamoDBStreams
import           Test.Tasty

tests :: [TestTree]
tests = []

fixtures :: [TestTree]
fixtures = []
