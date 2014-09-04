{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DeleteInstance
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes a specified instance. You must stop an instance before you can
-- delete it. For more information, see Deleting Instances. Required
-- Permissions: To use this action, an IAM user must have a Manage permissions
-- level for the stack, or an attached policy that explicitly grants
-- permissions. For more information on user permissions, see Managing User
-- Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DeleteInstance
    (
    -- * Request
      DeleteInstance
    -- ** Request constructor
    , mkDeleteInstanceRequest
    -- ** Request lenses
    , dirInstanceId
    , dirDeleteElasticIp
    , dirDeleteVolumes

    -- * Response
    , DeleteInstanceResponse
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteInstance' request.
mkDeleteInstanceRequest :: Text -- ^ 'dirInstanceId'
                        -> DeleteInstance
mkDeleteInstanceRequest p1 = DeleteInstance
    { _dirInstanceId = p1
    , _dirDeleteElasticIp = Nothing
    , _dirDeleteVolumes = Nothing
    }
{-# INLINE mkDeleteInstanceRequest #-}

data DeleteInstance = DeleteInstance
    { _dirInstanceId :: Text
      -- ^ The instance ID.
    , _dirDeleteElasticIp :: Maybe Bool
      -- ^ Whether to delete the instance Elastic IP address.
    , _dirDeleteVolumes :: Maybe Bool
      -- ^ Whether to delete the instance's Amazon EBS volumes.
    } deriving (Show, Generic)

-- | The instance ID.
dirInstanceId :: Lens' DeleteInstance (Text)
dirInstanceId = lens _dirInstanceId (\s a -> s { _dirInstanceId = a })
{-# INLINE dirInstanceId #-}

-- | Whether to delete the instance Elastic IP address.
dirDeleteElasticIp :: Lens' DeleteInstance (Maybe Bool)
dirDeleteElasticIp = lens _dirDeleteElasticIp (\s a -> s { _dirDeleteElasticIp = a })
{-# INLINE dirDeleteElasticIp #-}

-- | Whether to delete the instance's Amazon EBS volumes.
dirDeleteVolumes :: Lens' DeleteInstance (Maybe Bool)
dirDeleteVolumes = lens _dirDeleteVolumes (\s a -> s { _dirDeleteVolumes = a })
{-# INLINE dirDeleteVolumes #-}

instance ToPath DeleteInstance

instance ToQuery DeleteInstance

instance ToHeaders DeleteInstance

instance ToJSON DeleteInstance

data DeleteInstanceResponse = DeleteInstanceResponse
    deriving (Eq, Show, Generic)

instance AWSRequest DeleteInstance where
    type Sv DeleteInstance = OpsWorks
    type Rs DeleteInstance = DeleteInstanceResponse

    request = get
    response _ = nullaryResponse DeleteInstanceResponse
