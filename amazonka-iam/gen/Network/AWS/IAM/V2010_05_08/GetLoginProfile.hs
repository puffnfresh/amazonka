{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.V2010_05_08.GetLoginProfile
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves the user name and password-creation date for the specified user.
-- If the user has not been assigned a password, the action returns a 404
-- (NoSuchEntity) error. https://iam.amazonaws.com/ ?Action=GetLoginProfile
-- &UserName=Bob &AUTHPARAMS Bob 2011-09-19T23:00:56Z
-- 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.GetLoginProfile
    (
    -- * Request
      GetLoginProfile
    -- ** Request constructor
    , mkGetLoginProfileRequest
    -- ** Request lenses
    , glprUserName

    -- * Response
    , GetLoginProfileResponse
    -- ** Response lenses
    , glpsLoginProfile
    ) where

import Network.AWS.Request.Query
import Network.AWS.IAM.V2010_05_08.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'GetLoginProfile' request.
mkGetLoginProfileRequest :: Text -- ^ 'glprUserName'
                         -> GetLoginProfile
mkGetLoginProfileRequest p1 = GetLoginProfile
    { _glprUserName = p1
    }
{-# INLINE mkGetLoginProfileRequest #-}

newtype GetLoginProfile = GetLoginProfile
    { _glprUserName :: Text
      -- ^ Name of the user whose login profile you want to retrieve.
    } deriving (Show, Generic)

-- | Name of the user whose login profile you want to retrieve.
glprUserName :: Lens' GetLoginProfile (Text)
glprUserName = lens _glprUserName (\s a -> s { _glprUserName = a })
{-# INLINE glprUserName #-}

instance ToQuery GetLoginProfile where
    toQuery = genericQuery def

newtype GetLoginProfileResponse = GetLoginProfileResponse
    { _glpsLoginProfile :: LoginProfile
      -- ^ User name and password create date for the user.
    } deriving (Show, Generic)

-- | User name and password create date for the user.
glpsLoginProfile :: Lens' GetLoginProfileResponse (LoginProfile)
glpsLoginProfile = lens _glpsLoginProfile (\s a -> s { _glpsLoginProfile = a })
{-# INLINE glpsLoginProfile #-}

instance FromXML GetLoginProfileResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest GetLoginProfile where
    type Sv GetLoginProfile = IAM
    type Rs GetLoginProfile = GetLoginProfileResponse

    request = post "GetLoginProfile"
    response _ = xmlResponse
