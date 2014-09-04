{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Route53.V2013_04_01.GetChange
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This action returns the current status of a change batch request. The
-- status is one of the following values: - PENDING indicates that the changes
-- in this request have not replicated to all Route 53 DNS servers. This is
-- the initial status of all change batch requests. - INSYNC indicates that
-- the changes have replicated to all Amazon Route 53 DNS servers.
module Network.AWS.Route53.V2013_04_01.GetChange
    (
    -- * Request
      GetChange
    -- ** Request constructor
    , mkGetChangeRequest
    -- ** Request lenses
    , gcrId

    -- * Response
    , GetChangeResponse
    -- ** Response lenses
    , gcsChangeInfo
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.Route53.V2013_04_01.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetChange' request.
mkGetChangeRequest :: Text -- ^ 'gcrId'
                   -> GetChange
mkGetChangeRequest p1 = GetChange
    { _gcrId = p1
    }
{-# INLINE mkGetChangeRequest #-}

newtype GetChange = GetChange
    { _gcrId :: Text
      -- ^ The ID of the change batch request. The value that you specify
      -- here is the value that ChangeResourceRecordSets returned in the
      -- Id element when you submitted the request.
    } deriving (Show, Generic)

-- | The ID of the change batch request. The value that you specify here is the
-- value that ChangeResourceRecordSets returned in the Id element when you
-- submitted the request.
gcrId :: Lens' GetChange (Text)
gcrId = lens _gcrId (\s a -> s { _gcrId = a })
{-# INLINE gcrId #-}

instance ToPath GetChange where
    toPath GetChange{..} = mconcat
        [ "/2013-04-01/change/"
        , toBS _gcrId
        ]

instance ToQuery GetChange

instance ToHeaders GetChange

instance ToXML GetChange where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "GetChangeRequest"

newtype GetChangeResponse = GetChangeResponse
    { _gcsChangeInfo :: ChangeInfo
      -- ^ A complex type that contains information about the specified
      -- change batch, including the change batch ID, the status of the
      -- change, and the date and time of the request.
    } deriving (Show, Generic)

-- | A complex type that contains information about the specified change batch,
-- including the change batch ID, the status of the change, and the date and
-- time of the request.
gcsChangeInfo :: Lens' GetChangeResponse (ChangeInfo)
gcsChangeInfo = lens _gcsChangeInfo (\s a -> s { _gcsChangeInfo = a })
{-# INLINE gcsChangeInfo #-}

instance FromXML GetChangeResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetChange where
    type Sv GetChange = Route53
    type Rs GetChange = GetChangeResponse

    request = get
    response _ = xmlResponse
