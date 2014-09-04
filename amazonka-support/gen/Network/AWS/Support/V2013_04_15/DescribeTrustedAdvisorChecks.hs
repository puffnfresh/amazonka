{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorChecks
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns information about all available Trusted Advisor checks, including
-- name, ID, category, description, and metadata. You must specify a language
-- code; English ("en") and Japanese ("ja") are currently supported. The
-- response contains a TrustedAdvisorCheckDescription for each check.
module Network.AWS.Support.V2013_04_15.DescribeTrustedAdvisorChecks
    (
    -- * Request
      DescribeTrustedAdvisorChecks
    -- ** Request constructor
    , mkDescribeTrustedAdvisorChecksRequest
    -- ** Request lenses
    , dtacrLanguage

    -- * Response
    , DescribeTrustedAdvisorChecksResponse
    -- ** Response lenses
    , dtacsChecks
    ) where

import           Network.AWS.Support.V2013_04_15.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeTrustedAdvisorChecks' request.
mkDescribeTrustedAdvisorChecksRequest :: Text -- ^ 'dtacrLanguage'
                                      -> DescribeTrustedAdvisorChecks
mkDescribeTrustedAdvisorChecksRequest p1 = DescribeTrustedAdvisorChecks
    { _dtacrLanguage = p1
    }
{-# INLINE mkDescribeTrustedAdvisorChecksRequest #-}

newtype DescribeTrustedAdvisorChecks = DescribeTrustedAdvisorChecks
    { _dtacrLanguage :: Text
      -- ^ The ISO 639-1 code for the language in which AWS provides
      -- support. AWS Support currently supports English ("en") and
      -- Japanese ("ja"). Language parameters must be passed explicitly
      -- for operations that take them.
    } deriving (Show, Generic)

-- | The ISO 639-1 code for the language in which AWS provides support. AWS
-- Support currently supports English ("en") and Japanese ("ja"). Language
-- parameters must be passed explicitly for operations that take them.
dtacrLanguage :: Lens' DescribeTrustedAdvisorChecks (Text)
dtacrLanguage = lens _dtacrLanguage (\s a -> s { _dtacrLanguage = a })
{-# INLINE dtacrLanguage #-}

instance ToPath DescribeTrustedAdvisorChecks

instance ToQuery DescribeTrustedAdvisorChecks

instance ToHeaders DescribeTrustedAdvisorChecks

instance ToJSON DescribeTrustedAdvisorChecks

newtype DescribeTrustedAdvisorChecksResponse = DescribeTrustedAdvisorChecksResponse
    { _dtacsChecks :: [TrustedAdvisorCheckDescription]
      -- ^ Information about all available Trusted Advisor checks.
    } deriving (Show, Generic)

-- | Information about all available Trusted Advisor checks.
dtacsChecks :: Lens' DescribeTrustedAdvisorChecksResponse ([TrustedAdvisorCheckDescription])
dtacsChecks = lens _dtacsChecks (\s a -> s { _dtacsChecks = a })
{-# INLINE dtacsChecks #-}

instance FromJSON DescribeTrustedAdvisorChecksResponse

instance AWSRequest DescribeTrustedAdvisorChecks where
    type Sv DescribeTrustedAdvisorChecks = Support
    type Rs DescribeTrustedAdvisorChecks = DescribeTrustedAdvisorChecksResponse

    request = get
    response _ = jsonResponse
