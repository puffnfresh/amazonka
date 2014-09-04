{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorCheckResult
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the results of the Trusted Advisor check that has the specified
-- check ID. Check IDs can be obtained by calling
-- DescribeTrustedAdvisorChecks. The response contains a
-- TrustedAdvisorCheckResult object, which contains these three objects:
-- TrustedAdvisorCategorySpecificSummary TrustedAdvisorResourceDetail
-- TrustedAdvisorResourcesSummary In addition, the response contains these
-- fields: Status. The alert status of the check: "ok" (green), "warning"
-- (yellow), "error" (red), or "not_available". Timestamp. The time of the
-- last refresh of the check. CheckId. The unique identifier for the check.
module Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorCheckResult
    (
    -- * Request
      DescribeTrustedAdvisorCheckResult
    -- ** Request constructor
    , mkDescribeTrustedAdvisorCheckResultRequest
    -- ** Request lenses
    , dtacrrCheckId
    , dtacrrLanguage

    -- * Response
    , DescribeTrustedAdvisorCheckResultResponse
    -- ** Response lenses
    , dtacrsResult
    ) where

import           Network.AWS.Support.V2013_04_15.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeTrustedAdvisorCheckResult' request.
mkDescribeTrustedAdvisorCheckResultRequest :: Text -- ^ 'dtacrrCheckId'
                                           -> DescribeTrustedAdvisorCheckResult
mkDescribeTrustedAdvisorCheckResultRequest p1 = DescribeTrustedAdvisorCheckResult
    { _dtacrrCheckId = p1
    , _dtacrrLanguage = Nothing
    }
{-# INLINE mkDescribeTrustedAdvisorCheckResultRequest #-}

data DescribeTrustedAdvisorCheckResult = DescribeTrustedAdvisorCheckResult
    { _dtacrrCheckId :: Text
      -- ^ The unique identifier for the Trusted Advisor check.
    , _dtacrrLanguage :: Maybe Text
      -- ^ The ISO 639-1 code for the language in which AWS provides
      -- support. AWS Support currently supports English ("en") and
      -- Japanese ("ja"). Language parameters must be passed explicitly
      -- for operations that take them.
    } deriving (Show, Generic)

-- | The unique identifier for the Trusted Advisor check.
dtacrrCheckId :: Lens' DescribeTrustedAdvisorCheckResult (Text)
dtacrrCheckId = lens _dtacrrCheckId (\s a -> s { _dtacrrCheckId = a })
{-# INLINE dtacrrCheckId #-}

-- | The ISO 639-1 code for the language in which AWS provides support. AWS
-- Support currently supports English ("en") and Japanese ("ja"). Language
-- parameters must be passed explicitly for operations that take them.
dtacrrLanguage :: Lens' DescribeTrustedAdvisorCheckResult (Maybe Text)
dtacrrLanguage = lens _dtacrrLanguage (\s a -> s { _dtacrrLanguage = a })
{-# INLINE dtacrrLanguage #-}

instance ToPath DescribeTrustedAdvisorCheckResult

instance ToQuery DescribeTrustedAdvisorCheckResult

instance ToHeaders DescribeTrustedAdvisorCheckResult

instance ToJSON DescribeTrustedAdvisorCheckResult

newtype DescribeTrustedAdvisorCheckResultResponse = DescribeTrustedAdvisorCheckResultResponse
    { _dtacrsResult :: Maybe TrustedAdvisorCheckResult
      -- ^ The detailed results of the Trusted Advisor check.
    } deriving (Show, Generic)

-- | The detailed results of the Trusted Advisor check.
dtacrsResult :: Lens' DescribeTrustedAdvisorCheckResultResponse (Maybe TrustedAdvisorCheckResult)
dtacrsResult = lens _dtacrsResult (\s a -> s { _dtacrsResult = a })
{-# INLINE dtacrsResult #-}

instance FromJSON DescribeTrustedAdvisorCheckResultResponse

instance AWSRequest DescribeTrustedAdvisorCheckResult where
    type Sv DescribeTrustedAdvisorCheckResult = Support
    type Rs DescribeTrustedAdvisorCheckResult = DescribeTrustedAdvisorCheckResultResponse

    request = get
    response _ = jsonResponse
