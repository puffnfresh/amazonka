{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.RebootInstance
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Reboots a specified instance. For more information, see Starting, Stopping,
-- and Rebooting Instances. Required Permissions: To use this action, an IAM
-- user must have a Manage permissions level for the stack, or an attached
-- policy that explicitly grants permissions. For more information on user
-- permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.RebootInstance
    (
    -- * Request
      RebootInstance
    -- ** Request constructor
    , mkRebootInstanceRequest
    -- ** Request lenses
    , rirInstanceId

    -- * Response
    , RebootInstanceResponse
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'RebootInstance' request.
mkRebootInstanceRequest :: Text -- ^ 'rirInstanceId'
                        -> RebootInstance
mkRebootInstanceRequest p1 = RebootInstance
    { _rirInstanceId = p1
    }
{-# INLINE mkRebootInstanceRequest #-}

newtype RebootInstance = RebootInstance
    { _rirInstanceId :: Text
      -- ^ The instance ID.
    } deriving (Show, Generic)

-- | The instance ID.
rirInstanceId :: Lens' RebootInstance (Text)
rirInstanceId = lens _rirInstanceId (\s a -> s { _rirInstanceId = a })
{-# INLINE rirInstanceId #-}

instance ToPath RebootInstance

instance ToQuery RebootInstance

instance ToHeaders RebootInstance

instance ToJSON RebootInstance

data RebootInstanceResponse = RebootInstanceResponse
    deriving (Eq, Show, Generic)

instance AWSRequest RebootInstance where
    type Sv RebootInstance = OpsWorks
    type Rs RebootInstance = RebootInstanceResponse

    request = get
    response _ = nullaryResponse RebootInstanceResponse
