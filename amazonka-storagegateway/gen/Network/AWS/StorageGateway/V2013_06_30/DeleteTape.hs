{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.StorageGateway.V2013_06_30.DeleteTape
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.StorageGateway.V2013_06_30.DeleteTape
    (
    -- * Request
      DeleteTape
    -- ** Request constructor
    , mkDeleteTapeInput
    -- ** Request lenses
    , dtiGatewayARN
    , dtiTapeARN

    -- * Response
    , DeleteTapeResponse
    -- ** Response lenses
    , dtoTapeARN
    ) where

import           Network.AWS.StorageGateway.V2013_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteTape' request.
mkDeleteTapeInput :: Text -- ^ 'dtiGatewayARN'
                  -> Text -- ^ 'dtiTapeARN'
                  -> DeleteTape
mkDeleteTapeInput p1 p2 = DeleteTape
    { _dtiGatewayARN = p1
    , _dtiTapeARN = p2
    }
{-# INLINE mkDeleteTapeInput #-}

data DeleteTape = DeleteTape
    { _dtiGatewayARN :: Text
      -- ^ The Amazon Resource Name (ARN) of the gateway. Use the
      -- ListGateways operation to return a list of gateways for your
      -- account and region.
    , _dtiTapeARN :: Text
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
-- operation to return a list of gateways for your account and region.
dtiGatewayARN :: Lens' DeleteTape (Text)
dtiGatewayARN = lens _dtiGatewayARN (\s a -> s { _dtiGatewayARN = a })
{-# INLINE dtiGatewayARN #-}

dtiTapeARN :: Lens' DeleteTape (Text)
dtiTapeARN = lens _dtiTapeARN (\s a -> s { _dtiTapeARN = a })
{-# INLINE dtiTapeARN #-}

instance ToPath DeleteTape

instance ToQuery DeleteTape

instance ToHeaders DeleteTape

instance ToJSON DeleteTape

newtype DeleteTapeResponse = DeleteTapeResponse
    { _dtoTapeARN :: Maybe Text
    } deriving (Show, Generic)

dtoTapeARN :: Lens' DeleteTapeResponse (Maybe Text)
dtoTapeARN = lens _dtoTapeARN (\s a -> s { _dtoTapeARN = a })
{-# INLINE dtoTapeARN #-}

instance FromJSON DeleteTapeResponse

instance AWSRequest DeleteTape where
    type Sv DeleteTape = StorageGateway
    type Rs DeleteTape = DeleteTapeResponse

    request = get
    response _ = jsonResponse
