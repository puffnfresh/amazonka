{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudSearch.V2013_01_01.UpdateServiceAccessPolicies
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Configures the access rules that control access to the domain's document
-- and search endpoints. For more information, see Configuring Access for an
-- Amazon CloudSearch Domain.
module Network.AWS.CloudSearch.V2013_01_01.UpdateServiceAccessPolicies
    (
    -- * Request
      UpdateServiceAccessPolicies
    -- ** Request constructor
    , mkUpdateServiceAccessPoliciesRequest
    -- ** Request lenses
    , usaprDomainName
    , usaprAccessPolicies

    -- * Response
    , UpdateServiceAccessPoliciesResponse
    -- ** Response lenses
    , usapsAccessPolicies
    ) where

import Network.AWS.Request.Query
import Network.AWS.CloudSearch.V2013_01_01.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'UpdateServiceAccessPolicies' request.
mkUpdateServiceAccessPoliciesRequest :: Text -- ^ 'usaprDomainName'
                                     -> Text -- ^ 'usaprAccessPolicies'
                                     -> UpdateServiceAccessPolicies
mkUpdateServiceAccessPoliciesRequest p1 p2 = UpdateServiceAccessPolicies
    { _usaprDomainName = p1
    , _usaprAccessPolicies = p2
    }
{-# INLINE mkUpdateServiceAccessPoliciesRequest #-}

data UpdateServiceAccessPolicies = UpdateServiceAccessPolicies
    { _usaprDomainName :: Text
      -- ^ A string that represents the name of a domain. Domain names are
      -- unique across the domains owned by an account within an AWS
      -- region. Domain names start with a letter or number and can
      -- contain the following characters: a-z (lowercase), 0-9, and -
      -- (hyphen).
    , _usaprAccessPolicies :: Text
      -- ^ The access rules you want to configure. These rules replace any
      -- existing rules.
    } deriving (Show, Generic)

-- | A string that represents the name of a domain. Domain names are unique
-- across the domains owned by an account within an AWS region. Domain names
-- start with a letter or number and can contain the following characters: a-z
-- (lowercase), 0-9, and - (hyphen).
usaprDomainName :: Lens' UpdateServiceAccessPolicies (Text)
usaprDomainName = lens _usaprDomainName (\s a -> s { _usaprDomainName = a })
{-# INLINE usaprDomainName #-}

-- | The access rules you want to configure. These rules replace any existing
-- rules.
usaprAccessPolicies :: Lens' UpdateServiceAccessPolicies (Text)
usaprAccessPolicies = lens _usaprAccessPolicies (\s a -> s { _usaprAccessPolicies = a })
{-# INLINE usaprAccessPolicies #-}

instance ToQuery UpdateServiceAccessPolicies where
    toQuery = genericQuery def

newtype UpdateServiceAccessPoliciesResponse = UpdateServiceAccessPoliciesResponse
    { _usapsAccessPolicies :: AccessPoliciesStatus
      -- ^ The access rules configured for the domain.
    } deriving (Show, Generic)

-- | The access rules configured for the domain.
usapsAccessPolicies :: Lens' UpdateServiceAccessPoliciesResponse (AccessPoliciesStatus)
usapsAccessPolicies = lens _usapsAccessPolicies (\s a -> s { _usapsAccessPolicies = a })
{-# INLINE usapsAccessPolicies #-}

instance FromXML UpdateServiceAccessPoliciesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest UpdateServiceAccessPolicies where
    type Sv UpdateServiceAccessPolicies = CloudSearch
    type Rs UpdateServiceAccessPolicies = UpdateServiceAccessPoliciesResponse

    request = post "UpdateServiceAccessPolicies"
    response _ = xmlResponse
