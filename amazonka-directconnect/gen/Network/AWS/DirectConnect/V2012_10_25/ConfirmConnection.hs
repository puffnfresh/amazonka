{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.DirectConnect.V2012_10_25.ConfirmConnection
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Confirm the creation of a hosted connection on an interconnect. Upon
-- creation, the hosted connection is initially in the 'Ordering' state, and
-- will remain in this state until the owner calls ConfirmConnection to
-- confirm creation of the hosted connection.
module Network.AWS.DirectConnect.V2012_10_25.ConfirmConnection
    (
    -- * Request
      ConfirmConnection
    -- ** Request constructor
    , mkConfirmConnectionRequest
    -- ** Request lenses
    , ccrConnectionId

    -- * Response
    , ConfirmConnectionResponse
    -- ** Response lenses
    , ccsConnectionState
    ) where

import           Network.AWS.DirectConnect.V2012_10_25.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ConfirmConnection' request.
mkConfirmConnectionRequest :: Text -- ^ 'ccrConnectionId'
                           -> ConfirmConnection
mkConfirmConnectionRequest p1 = ConfirmConnection
    { _ccrConnectionId = p1
    }
{-# INLINE mkConfirmConnectionRequest #-}

newtype ConfirmConnection = ConfirmConnection
    { _ccrConnectionId :: Text
      -- ^ ID of the connection. Example: dxcon-fg5678gh Default: None.
    } deriving (Show, Generic)

-- | ID of the connection. Example: dxcon-fg5678gh Default: None.
ccrConnectionId :: Lens' ConfirmConnection (Text)
ccrConnectionId = lens _ccrConnectionId (\s a -> s { _ccrConnectionId = a })
{-# INLINE ccrConnectionId #-}

instance ToPath ConfirmConnection

instance ToQuery ConfirmConnection

instance ToHeaders ConfirmConnection

instance ToJSON ConfirmConnection

newtype ConfirmConnectionResponse = ConfirmConnectionResponse
    { _ccsConnectionState :: Maybe ConnectionState
      -- ^ State of the connection. Ordering: The initial state of a hosted
      -- connection provisioned on an interconnect. The connection stays
      -- in the ordering state until the owner of the hosted connection
      -- confirms or declines the connection order. Requested: The initial
      -- state of a standard connection. The connection stays in the
      -- requested state until the Letter of Authorization (LOA) is sent
      -- to the customer. Pending: The connection has been approved, and
      -- is being initialized. Available: The network link is up, and the
      -- connection is ready for use. Down: The network link is down.
      -- Deleted: The connection has been deleted. Rejected: A hosted
      -- connection in the 'Ordering' state will enter the 'Rejected'
      -- state if it is deleted by the end customer.
    } deriving (Show, Generic)

-- | State of the connection. Ordering: The initial state of a hosted connection
-- provisioned on an interconnect. The connection stays in the ordering state
-- until the owner of the hosted connection confirms or declines the
-- connection order. Requested: The initial state of a standard connection.
-- The connection stays in the requested state until the Letter of
-- Authorization (LOA) is sent to the customer. Pending: The connection has
-- been approved, and is being initialized. Available: The network link is up,
-- and the connection is ready for use. Down: The network link is down.
-- Deleted: The connection has been deleted. Rejected: A hosted connection in
-- the 'Ordering' state will enter the 'Rejected' state if it is deleted by
-- the end customer.
ccsConnectionState :: Lens' ConfirmConnectionResponse (Maybe ConnectionState)
ccsConnectionState = lens _ccsConnectionState (\s a -> s { _ccsConnectionState = a })
{-# INLINE ccsConnectionState #-}

instance FromJSON ConfirmConnectionResponse

instance AWSRequest ConfirmConnection where
    type Sv ConfirmConnection = DirectConnect
    type Rs ConfirmConnection = ConfirmConnectionResponse

    request = get
    response _ = jsonResponse
