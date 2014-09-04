{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.OpsWorks.V2013_02_18.DescribeCommands
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes the results of specified commands. You must specify at least one
-- of the parameters. Required Permissions: To use this action, an IAM user
-- must have a Show, Deploy, or Manage permissions level for the stack, or an
-- attached policy that explicitly grants permissions. For more information on
-- user permissions, see Managing User Permissions.
module Network.AWS.OpsWorks.V2013_02_18.DescribeCommands
    (
    -- * Request
      DescribeCommands
    -- ** Request constructor
    , mkDescribeCommandsRequest
    -- ** Request lenses
    , dcrDeploymentId
    , dcrInstanceId
    , dcrCommandIds

    -- * Response
    , DescribeCommandsResponse
    -- ** Response lenses
    , dcsCommands
    ) where

import           Network.AWS.OpsWorks.V2013_02_18.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeCommands' request.
mkDescribeCommandsRequest :: DescribeCommands
mkDescribeCommandsRequest = DescribeCommands
    { _dcrDeploymentId = Nothing
    , _dcrInstanceId = Nothing
    , _dcrCommandIds = mempty
    }
{-# INLINE mkDescribeCommandsRequest #-}

data DescribeCommands = DescribeCommands
    { _dcrDeploymentId :: Maybe Text
      -- ^ The deployment ID. If you include this parameter,
      -- DescribeCommands returns a description of the commands associated
      -- with the specified deployment.
    , _dcrInstanceId :: Maybe Text
      -- ^ The instance ID. If you include this parameter, DescribeCommands
      -- returns a description of the commands associated with the
      -- specified instance.
    , _dcrCommandIds :: [Text]
      -- ^ An array of command IDs. If you include this parameter,
      -- DescribeCommands returns a description of the specified commands.
      -- Otherwise, it returns a description of every command.
    } deriving (Show, Generic)

-- | The deployment ID. If you include this parameter, DescribeCommands returns
-- a description of the commands associated with the specified deployment.
dcrDeploymentId :: Lens' DescribeCommands (Maybe Text)
dcrDeploymentId = lens _dcrDeploymentId (\s a -> s { _dcrDeploymentId = a })
{-# INLINE dcrDeploymentId #-}

-- | The instance ID. If you include this parameter, DescribeCommands returns a
-- description of the commands associated with the specified instance.
dcrInstanceId :: Lens' DescribeCommands (Maybe Text)
dcrInstanceId = lens _dcrInstanceId (\s a -> s { _dcrInstanceId = a })
{-# INLINE dcrInstanceId #-}

-- | An array of command IDs. If you include this parameter, DescribeCommands
-- returns a description of the specified commands. Otherwise, it returns a
-- description of every command.
dcrCommandIds :: Lens' DescribeCommands ([Text])
dcrCommandIds = lens _dcrCommandIds (\s a -> s { _dcrCommandIds = a })
{-# INLINE dcrCommandIds #-}

instance ToPath DescribeCommands

instance ToQuery DescribeCommands

instance ToHeaders DescribeCommands

instance ToJSON DescribeCommands

newtype DescribeCommandsResponse = DescribeCommandsResponse
    { _dcsCommands :: [Command]
      -- ^ An array of Command objects that describe each of the specified
      -- commands.
    } deriving (Show, Generic)

-- | An array of Command objects that describe each of the specified commands.
dcsCommands :: Lens' DescribeCommandsResponse ([Command])
dcsCommands = lens _dcsCommands (\s a -> s { _dcsCommands = a })
{-# INLINE dcsCommands #-}

instance FromJSON DescribeCommandsResponse

instance AWSRequest DescribeCommands where
    type Sv DescribeCommands = OpsWorks
    type Rs DescribeCommands = DescribeCommandsResponse

    request = get
    response _ = jsonResponse
