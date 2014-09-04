{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CognitoIdentity.V2014_06_30.CreateIdentityPool
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a new identity pool. The identity pool is a store of user identity
-- information that is specific to your AWS account. CreateIdentityPool The
-- following example shows a request and response for a CreateIdentityPool
-- operation. { "IdentityPoolName": "MyIdentityPool",
-- "IdentityPoolDescription": "My identity pool", "Unauthenticated": true,
-- "SupportedLoginProviders": { "graph.facebook.com": "Facebook_App_ID",
-- "accounts.google.com": "Google_App_ID", "www.amazon.com": "Amazon_App_ID" }
-- } { "IdentityPoolDescription": "My identity pool", "IdentityPoolId":
-- "us-east-1:1a234b56-7890-1cd2-3e45-f6g7hEXAMPLE", "IdentityPoolName":
-- "MyIdentityPool", "SupportedLoginProviders": { "www.amazon.com":
-- "Amazon_App_ID", "graph.facebook.com": "Facebook_App_ID",
-- "accounts.google.com": "Google_App_ID" }, "Unauthenticated": true }.
module Network.AWS.CognitoIdentity.V2014_06_30.CreateIdentityPool
    (
    -- * Request
      CreateIdentityPool
    -- ** Request constructor
    , mkCreateIdentityPoolInput
    -- ** Request lenses
    , cipiIdentityPoolName
    , cipiAllowUnauthenticatedIdentities
    , cipiSupportedLoginProviders

    -- * Response
    , CreateIdentityPoolResponse
    -- ** Response lenses
    , iqIdentityPoolId
    , iqIdentityPoolName
    , iqAllowUnauthenticatedIdentities
    , iqSupportedLoginProviders
    ) where

import           Network.AWS.CognitoIdentity.V2014_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CreateIdentityPool' request.
mkCreateIdentityPoolInput :: Text -- ^ 'cipiIdentityPoolName'
                          -> Bool -- ^ 'cipiAllowUnauthenticatedIdentities'
                          -> CreateIdentityPool
mkCreateIdentityPoolInput p1 p2 = CreateIdentityPool
    { _cipiIdentityPoolName = p1
    , _cipiAllowUnauthenticatedIdentities = p2
    , _cipiSupportedLoginProviders = mempty
    }
{-# INLINE mkCreateIdentityPoolInput #-}

data CreateIdentityPool = CreateIdentityPool
    { _cipiIdentityPoolName :: Text
      -- ^ A string that you provide.
    , _cipiAllowUnauthenticatedIdentities :: Bool
      -- ^ TRUE if the identity pool supports unauthenticated logins.
    , _cipiSupportedLoginProviders :: Map Text Text
      -- ^ Optional key:value pairs mapping provider names to provider app
      -- IDs.
    } deriving (Show, Generic)

-- | A string that you provide.
cipiIdentityPoolName :: Lens' CreateIdentityPool (Text)
cipiIdentityPoolName = lens _cipiIdentityPoolName (\s a -> s { _cipiIdentityPoolName = a })
{-# INLINE cipiIdentityPoolName #-}

-- | TRUE if the identity pool supports unauthenticated logins.
cipiAllowUnauthenticatedIdentities :: Lens' CreateIdentityPool (Bool)
cipiAllowUnauthenticatedIdentities = lens _cipiAllowUnauthenticatedIdentities (\s a -> s { _cipiAllowUnauthenticatedIdentities = a })
{-# INLINE cipiAllowUnauthenticatedIdentities #-}

-- | Optional key:value pairs mapping provider names to provider app IDs.
cipiSupportedLoginProviders :: Lens' CreateIdentityPool (Map Text Text)
cipiSupportedLoginProviders = lens _cipiSupportedLoginProviders (\s a -> s { _cipiSupportedLoginProviders = a })
{-# INLINE cipiSupportedLoginProviders #-}

instance ToPath CreateIdentityPool

instance ToQuery CreateIdentityPool

instance ToHeaders CreateIdentityPool

instance ToJSON CreateIdentityPool

data CreateIdentityPoolResponse = CreateIdentityPoolResponse
    { _iqIdentityPoolId :: Text
      -- ^ An identity pool ID in the format REGION:GUID.
    , _iqIdentityPoolName :: Text
      -- ^ A string that you provide.
    , _iqAllowUnauthenticatedIdentities :: Bool
      -- ^ TRUE if the identity pool supports unauthenticated logins.
    , _iqSupportedLoginProviders :: Map Text Text
      -- ^ Optional key:value pairs mapping provider names to provider app
      -- IDs.
    } deriving (Show, Generic)

-- | An identity pool ID in the format REGION:GUID.
iqIdentityPoolId :: Lens' CreateIdentityPoolResponse (Text)
iqIdentityPoolId = lens _iqIdentityPoolId (\s a -> s { _iqIdentityPoolId = a })
{-# INLINE iqIdentityPoolId #-}

-- | A string that you provide.
iqIdentityPoolName :: Lens' CreateIdentityPoolResponse (Text)
iqIdentityPoolName = lens _iqIdentityPoolName (\s a -> s { _iqIdentityPoolName = a })
{-# INLINE iqIdentityPoolName #-}

-- | TRUE if the identity pool supports unauthenticated logins.
iqAllowUnauthenticatedIdentities :: Lens' CreateIdentityPoolResponse (Bool)
iqAllowUnauthenticatedIdentities = lens _iqAllowUnauthenticatedIdentities (\s a -> s { _iqAllowUnauthenticatedIdentities = a })
{-# INLINE iqAllowUnauthenticatedIdentities #-}

-- | Optional key:value pairs mapping provider names to provider app IDs.
iqSupportedLoginProviders :: Lens' CreateIdentityPoolResponse (Map Text Text)
iqSupportedLoginProviders = lens _iqSupportedLoginProviders (\s a -> s { _iqSupportedLoginProviders = a })
{-# INLINE iqSupportedLoginProviders #-}

instance FromJSON CreateIdentityPoolResponse

instance AWSRequest CreateIdentityPool where
    type Sv CreateIdentityPool = CognitoIdentity
    type Rs CreateIdentityPool = CreateIdentityPoolResponse

    request = get
    response _ = jsonResponse
