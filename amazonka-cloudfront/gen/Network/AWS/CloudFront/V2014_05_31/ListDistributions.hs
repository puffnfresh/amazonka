{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFront.V2014_05_31.ListDistributions
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | List distributions.
module Network.AWS.CloudFront.V2014_05_31.ListDistributions
    (
    -- * Request
      ListDistributions
    -- ** Request constructor
    , mkListDistributionsRequest
    -- ** Request lenses
    , ldrMarker
    , ldrMaxItems

    -- * Response
    , ListDistributionsResponse
    -- ** Response lenses
    , ldsDistributionList
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.CloudFront.V2014_05_31.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ListDistributions' request.
mkListDistributionsRequest :: ListDistributions
mkListDistributionsRequest = ListDistributions
    { _ldrMarker = Nothing
    , _ldrMaxItems = Nothing
    }
{-# INLINE mkListDistributionsRequest #-}

data ListDistributions = ListDistributions
    { _ldrMarker :: Maybe Text
      -- ^ Use this when paginating results to indicate where to begin in
      -- your list of distributions. The results include distributions in
      -- the list that occur after the marker. To get the next page of
      -- results, set the Marker to the value of the NextMarker from the
      -- current page's response (which is also the ID of the last
      -- distribution on that page).
    , _ldrMaxItems :: Maybe Text
      -- ^ The maximum number of distributions you want in the response
      -- body.
    } deriving (Show, Generic)

-- | Use this when paginating results to indicate where to begin in your list of
-- distributions. The results include distributions in the list that occur
-- after the marker. To get the next page of results, set the Marker to the
-- value of the NextMarker from the current page's response (which is also the
-- ID of the last distribution on that page).
ldrMarker :: Lens' ListDistributions (Maybe Text)
ldrMarker = lens _ldrMarker (\s a -> s { _ldrMarker = a })
{-# INLINE ldrMarker #-}

-- | The maximum number of distributions you want in the response body.
ldrMaxItems :: Lens' ListDistributions (Maybe Text)
ldrMaxItems = lens _ldrMaxItems (\s a -> s { _ldrMaxItems = a })
{-# INLINE ldrMaxItems #-}

instance ToPath ListDistributions where
    toPath = const "/2014-05-31/distribution"

instance ToQuery ListDistributions where
    toQuery ListDistributions{..} = mconcat
        [ "Marker" =? _ldrMarker
        , "MaxItems" =? _ldrMaxItems
        ]

instance ToHeaders ListDistributions

instance ToXML ListDistributions where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ListDistributionsRequest"

newtype ListDistributionsResponse = ListDistributionsResponse
    { _ldsDistributionList :: Maybe DistributionList
      -- ^ The DistributionList type.
    } deriving (Show, Generic)

-- | The DistributionList type.
ldsDistributionList :: Lens' ListDistributionsResponse (Maybe DistributionList)
ldsDistributionList = lens _ldsDistributionList (\s a -> s { _ldsDistributionList = a })
{-# INLINE ldsDistributionList #-}

instance FromXML ListDistributionsResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ListDistributions where
    type Sv ListDistributions = CloudFront
    type Rs ListDistributions = ListDistributionsResponse

    request = get
    response _ = xmlResponse

instance AWSPager ListDistributions where
    next rq rs
        | not (_dlIsTruncated $ _ldsDistributionList rs) = Nothing
        | otherwise = Just $ rq
            { _ldrMarker = _dlNextMarker $ _ldsDistributionList rs
            }
