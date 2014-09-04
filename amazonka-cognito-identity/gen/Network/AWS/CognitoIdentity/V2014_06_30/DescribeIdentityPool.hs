{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CognitoIdentity.V2014_06_30.DescribeIdentityPool
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Gets details about a particular identity pool, including the pool name, ID
-- description, creation date, and current number of users.
-- DescribeIdentityPool The following are an example request and response for
-- the DescribeIdentityPool operation. { "IdentityPoolId":
-- "us-east-1:af4311ca-835e-4b49-814c-2290EXAMPLE1" } {
-- "IdentityPoolDescription": "My identity pool", "IdentityPoolId":
-- "us-east-1:af4311ca-835e-4b49-814c-2290EXAMPLE1", "IdentityPoolName":
-- "MyIdentityPool", "SupportedLoginProviders": { "www.amazon.com":
-- "Amazon_App_ID", "graph.facebook.com": "Facebook_App_ID",
-- "accounts.google.com": "Google_App_ID" }, "Unauthenticated": true }.
module Network.AWS.CognitoIdentity.V2014_06_30.DescribeIdentityPool
    (
    -- * Request
      DescribeIdentityPool
    -- ** Request constructor
    , mkDescribeIdentityPoolInput
    -- ** Request lenses
    , dipjIdentityPoolId

    -- * Response
    , DescribeIdentityPoolResponse
    -- ** Response lenses
    , isIdentityPoolId
    , isIdentityPoolName
    , isAllowUnauthenticatedIdentities
    , isSupportedLoginProviders
    ) where

import           Network.AWS.CognitoIdentity.V2014_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeIdentityPool' request.
mkDescribeIdentityPoolInput :: Text -- ^ 'dipjIdentityPoolId'
                            -> DescribeIdentityPool
mkDescribeIdentityPoolInput p1 = DescribeIdentityPool
    { _dipjIdentityPoolId = p1
    }
{-# INLINE mkDescribeIdentityPoolInput #-}

newtype DescribeIdentityPool = DescribeIdentityPool
    { _dipjIdentityPoolId :: Text
      -- ^ An identity pool ID in the format REGION:GUID.
    } deriving (Show, Generic)

-- | An identity pool ID in the format REGION:GUID.
dipjIdentityPoolId :: Lens' DescribeIdentityPool (Text)
dipjIdentityPoolId = lens _dipjIdentityPoolId (\s a -> s { _dipjIdentityPoolId = a })
{-# INLINE dipjIdentityPoolId #-}

instance ToPath DescribeIdentityPool

instance ToQuery DescribeIdentityPool

instance ToHeaders DescribeIdentityPool

instance ToJSON DescribeIdentityPool

data DescribeIdentityPoolResponse = DescribeIdentityPoolResponse
    { _isIdentityPoolId :: Text
      -- ^ An identity pool ID in the format REGION:GUID.
    , _isIdentityPoolName :: Text
      -- ^ A string that you provide.
    , _isAllowUnauthenticatedIdentities :: Bool
      -- ^ TRUE if the identity pool supports unauthenticated logins.
    , _isSupportedLoginProviders :: Map Text Text
      -- ^ Optional key:value pairs mapping provider names to provider app
      -- IDs.
    } deriving (Show, Generic)

-- | An identity pool ID in the format REGION:GUID.
isIdentityPoolId :: Lens' DescribeIdentityPoolResponse (Text)
isIdentityPoolId = lens _isIdentityPoolId (\s a -> s { _isIdentityPoolId = a })
{-# INLINE isIdentityPoolId #-}

-- | A string that you provide.
isIdentityPoolName :: Lens' DescribeIdentityPoolResponse (Text)
isIdentityPoolName = lens _isIdentityPoolName (\s a -> s { _isIdentityPoolName = a })
{-# INLINE isIdentityPoolName #-}

-- | TRUE if the identity pool supports unauthenticated logins.
isAllowUnauthenticatedIdentities :: Lens' DescribeIdentityPoolResponse (Bool)
isAllowUnauthenticatedIdentities = lens _isAllowUnauthenticatedIdentities (\s a -> s { _isAllowUnauthenticatedIdentities = a })
{-# INLINE isAllowUnauthenticatedIdentities #-}

-- | Optional key:value pairs mapping provider names to provider app IDs.
isSupportedLoginProviders :: Lens' DescribeIdentityPoolResponse (Map Text Text)
isSupportedLoginProviders = lens _isSupportedLoginProviders (\s a -> s { _isSupportedLoginProviders = a })
{-# INLINE isSupportedLoginProviders #-}

instance FromJSON DescribeIdentityPoolResponse

instance AWSRequest DescribeIdentityPool where
    type Sv DescribeIdentityPool = CognitoIdentity
    type Rs DescribeIdentityPool = DescribeIdentityPoolResponse

    request = get
    response _ = jsonResponse
