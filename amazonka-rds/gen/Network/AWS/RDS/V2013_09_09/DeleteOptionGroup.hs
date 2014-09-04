{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.V2013_09_09.DeleteOptionGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes an existing option group. https://rds.amazonaws.com/
-- ?Action=DeleteOptionGroup &OptionGroupName=myoptiongroup.
module Network.AWS.RDS.V2013_09_09.DeleteOptionGroup
    (
    -- * Request
      DeleteOptionGroup
    -- ** Request constructor
    , mkDeleteOptionGroupMessage
    -- ** Request lenses
    , dogmOptionGroupName

    -- * Response
    , DeleteOptionGroupResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.RDS.V2013_09_09.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteOptionGroup' request.
mkDeleteOptionGroupMessage :: Text -- ^ 'dogmOptionGroupName'
                           -> DeleteOptionGroup
mkDeleteOptionGroupMessage p1 = DeleteOptionGroup
    { _dogmOptionGroupName = p1
    }
{-# INLINE mkDeleteOptionGroupMessage #-}

newtype DeleteOptionGroup = DeleteOptionGroup
    { _dogmOptionGroupName :: Text
      -- ^ The name of the option group to be deleted. You cannot delete
      -- default option groups.
    } deriving (Show, Generic)

-- | The name of the option group to be deleted. You cannot delete default
-- option groups.
dogmOptionGroupName :: Lens' DeleteOptionGroup (Text)
dogmOptionGroupName = lens _dogmOptionGroupName (\s a -> s { _dogmOptionGroupName = a })
{-# INLINE dogmOptionGroupName #-}

instance ToQuery DeleteOptionGroup where
    toQuery = genericQuery def

data DeleteOptionGroupResponse = DeleteOptionGroupResponse
    deriving (Eq, Show, Generic)

instance AWSRequest DeleteOptionGroup where
    type Sv DeleteOptionGroup = RDS
    type Rs DeleteOptionGroup = DeleteOptionGroupResponse

    request = post "DeleteOptionGroup"
    response _ = nullaryResponse DeleteOptionGroupResponse
