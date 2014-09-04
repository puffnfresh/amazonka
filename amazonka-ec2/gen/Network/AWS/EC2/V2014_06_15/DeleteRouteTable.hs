{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.DeleteRouteTable
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified route table. You must disassociate the route table
-- from any subnets before you can delete it. You can't delete the main route
-- table. Example This example deletes the specified route table.
-- https://ec2.amazonaws.com/?Action=DeleteRouteTable
-- &amp;RouteTableId=rtb-e4ad488d &amp;AUTHPARAMS &lt;DeleteRouteTableResponse
-- xmlns="http://ec2.amazonaws.com/doc/2014-06-15/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;return&gt;true&lt;/return&gt; &lt;/DeleteRouteTableResponse&gt;.
module Network.AWS.EC2.V2014_06_15.DeleteRouteTable
    (
    -- * Request
      DeleteRouteTable
    -- ** Request constructor
    , mkDeleteRouteTableRequest
    -- ** Request lenses
    , drtrRouteTableId

    -- * Response
    , DeleteRouteTableResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteRouteTable' request.
mkDeleteRouteTableRequest :: Text -- ^ 'drtrRouteTableId'
                          -> DeleteRouteTable
mkDeleteRouteTableRequest p1 = DeleteRouteTable
    { _drtrRouteTableId = p1
    }
{-# INLINE mkDeleteRouteTableRequest #-}

newtype DeleteRouteTable = DeleteRouteTable
    { _drtrRouteTableId :: Text
      -- ^ The ID of the route table.
    } deriving (Show, Generic)

-- | The ID of the route table.
drtrRouteTableId :: Lens' DeleteRouteTable (Text)
drtrRouteTableId = lens _drtrRouteTableId (\s a -> s { _drtrRouteTableId = a })
{-# INLINE drtrRouteTableId #-}

instance ToQuery DeleteRouteTable where
    toQuery = genericQuery def

data DeleteRouteTableResponse = DeleteRouteTableResponse
    deriving (Eq, Show, Generic)

instance AWSRequest DeleteRouteTable where
    type Sv DeleteRouteTable = EC2
    type Rs DeleteRouteTable = DeleteRouteTableResponse

    request = post "DeleteRouteTable"
    response _ = nullaryResponse DeleteRouteTableResponse
