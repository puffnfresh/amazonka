{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ELB.V2012_06_01.DeleteLoadBalancerListeners
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes listeners from the load balancer for the specified port.
module Network.AWS.ELB.V2012_06_01.DeleteLoadBalancerListeners
    (
    -- * Request
      DeleteLoadBalancerListeners
    -- ** Request constructor
    , mkDeleteLoadBalancerListenerInput
    -- ** Request lenses
    , dlbliLoadBalancerName
    , dlbliLoadBalancerPorts

    -- * Response
    , DeleteLoadBalancerListenersResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.ELB.V2012_06_01.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteLoadBalancerListeners' request.
mkDeleteLoadBalancerListenerInput :: Text -- ^ 'dlbliLoadBalancerName'
                                  -> [Integer] -- ^ 'dlbliLoadBalancerPorts'
                                  -> DeleteLoadBalancerListeners
mkDeleteLoadBalancerListenerInput p1 p2 = DeleteLoadBalancerListeners
    { _dlbliLoadBalancerName = p1
    , _dlbliLoadBalancerPorts = p2
    }
{-# INLINE mkDeleteLoadBalancerListenerInput #-}

data DeleteLoadBalancerListeners = DeleteLoadBalancerListeners
    { _dlbliLoadBalancerName :: Text
      -- ^ The mnemonic name associated with the load balancer.
    , _dlbliLoadBalancerPorts :: [Integer]
      -- ^ The client port number(s) of the load balancer listener(s) to be
      -- removed.
    } deriving (Show, Generic)

-- | The mnemonic name associated with the load balancer.
dlbliLoadBalancerName :: Lens' DeleteLoadBalancerListeners (Text)
dlbliLoadBalancerName = lens _dlbliLoadBalancerName (\s a -> s { _dlbliLoadBalancerName = a })
{-# INLINE dlbliLoadBalancerName #-}

-- | The client port number(s) of the load balancer listener(s) to be removed.
dlbliLoadBalancerPorts :: Lens' DeleteLoadBalancerListeners ([Integer])
dlbliLoadBalancerPorts = lens _dlbliLoadBalancerPorts (\s a -> s { _dlbliLoadBalancerPorts = a })
{-# INLINE dlbliLoadBalancerPorts #-}

instance ToQuery DeleteLoadBalancerListeners where
    toQuery = genericQuery def

    deriving (Eq, Show, Generic)

instance AWSRequest DeleteLoadBalancerListeners where
    type Sv DeleteLoadBalancerListeners = ELB
    type Rs DeleteLoadBalancerListeners = DeleteLoadBalancerListenersResponse

    request = post "DeleteLoadBalancerListeners"
    response _ = nullaryResponse DeleteLoadBalancerListenersResponse
