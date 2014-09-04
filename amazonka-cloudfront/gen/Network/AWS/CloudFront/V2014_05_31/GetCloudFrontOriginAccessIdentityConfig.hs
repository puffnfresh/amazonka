{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudFront.V2014_05_31.GetCloudFrontOriginAccessIdentityConfig
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Get the configuration information about an origin access identity.
module Network.AWS.CloudFront.V2014_05_31.GetCloudFrontOriginAccessIdentityConfig
    (
    -- * Request
      GetCloudFrontOriginAccessIdentityConfig
    -- ** Request constructor
    , mkGetCloudFrontOriginAccessIdentityConfigRequest
    -- ** Request lenses
    , gcfoaicrId

    -- * Response
    , GetCloudFrontOriginAccessIdentityConfigResponse
    -- ** Response lenses
    , gcfoaicsCloudFrontOriginAccessIdentityConfig
    , gcfoaicsETag
    ) where

import Network.AWS.Request.RestXML
import Network.AWS.CloudFront.V2014_05_31.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetCloudFrontOriginAccessIdentityConfig' request.
mkGetCloudFrontOriginAccessIdentityConfigRequest :: Text -- ^ 'gcfoaicrId'
                                                 -> GetCloudFrontOriginAccessIdentityConfig
mkGetCloudFrontOriginAccessIdentityConfigRequest p1 = GetCloudFrontOriginAccessIdentityConfig
    { _gcfoaicrId = p1
    }
{-# INLINE mkGetCloudFrontOriginAccessIdentityConfigRequest #-}

newtype GetCloudFrontOriginAccessIdentityConfig = GetCloudFrontOriginAccessIdentityConfig
    { _gcfoaicrId :: Text
      -- ^ The identity's id.
    } deriving (Show, Generic)

-- | The identity's id.
gcfoaicrId :: Lens' GetCloudFrontOriginAccessIdentityConfig (Text)
gcfoaicrId = lens _gcfoaicrId (\s a -> s { _gcfoaicrId = a })
{-# INLINE gcfoaicrId #-}

instance ToPath GetCloudFrontOriginAccessIdentityConfig where
    toPath GetCloudFrontOriginAccessIdentityConfig{..} = mconcat
        [ "/2014-05-31/origin-access-identity/cloudfront/"
        , toBS _gcfoaicrId
        , "/config"
        ]

instance ToQuery GetCloudFrontOriginAccessIdentityConfig

instance ToHeaders GetCloudFrontOriginAccessIdentityConfig

instance ToXML GetCloudFrontOriginAccessIdentityConfig where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "GetCloudFrontOriginAccessIdentityConfigRequest"

data GetCloudFrontOriginAccessIdentityConfigResponse = GetCloudFrontOriginAccessIdentityConfigResponse
    { _gcfoaicsCloudFrontOriginAccessIdentityConfig :: Maybe CloudFrontOriginAccessIdentityConfig
      -- ^ The origin access identity's configuration information.
    , _gcfoaicsETag :: Maybe Text
      -- ^ The current version of the configuration. For example:
      -- E2QWRUHAPOMQZL.
    } deriving (Show, Generic)

-- | The origin access identity's configuration information.
gcfoaicsCloudFrontOriginAccessIdentityConfig :: Lens' GetCloudFrontOriginAccessIdentityConfigResponse (Maybe CloudFrontOriginAccessIdentityConfig)
gcfoaicsCloudFrontOriginAccessIdentityConfig = lens _gcfoaicsCloudFrontOriginAccessIdentityConfig (\s a -> s { _gcfoaicsCloudFrontOriginAccessIdentityConfig = a })
{-# INLINE gcfoaicsCloudFrontOriginAccessIdentityConfig #-}

-- | The current version of the configuration. For example: E2QWRUHAPOMQZL.
gcfoaicsETag :: Lens' GetCloudFrontOriginAccessIdentityConfigResponse (Maybe Text)
gcfoaicsETag = lens _gcfoaicsETag (\s a -> s { _gcfoaicsETag = a })
{-# INLINE gcfoaicsETag #-}

instance AWSRequest GetCloudFrontOriginAccessIdentityConfig where
    type Sv GetCloudFrontOriginAccessIdentityConfig = CloudFront
    type Rs GetCloudFrontOriginAccessIdentityConfig = GetCloudFrontOriginAccessIdentityConfigResponse

    request = get
    response _ = cursorResponse $ \hs xml ->
        pure GetCloudFrontOriginAccessIdentityConfigResponse
            <*> xml %|? "CloudFrontOriginAccessIdentityConfig"
            <*> hs ~:? "ETag"
