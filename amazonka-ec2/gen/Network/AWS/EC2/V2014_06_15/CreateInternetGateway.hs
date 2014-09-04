{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.CreateInternetGateway
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates an Internet gateway for use with a VPC. After creating the Internet
-- gateway, you attach it to a VPC using AttachInternetGateway. For more
-- information about your VPC and Internet gateway, see the Amazon Virtual
-- Private Cloud User Guide. Example This example creates an Internet gateway.
-- https://ec2.amazonaws.com/?Action=CreateInternetGateway &amp;AUTHPARAMS
-- 59dbff89-35bd-4eac-99ed-be587EXAMPLE igw-eaad4883.
module Network.AWS.EC2.V2014_06_15.CreateInternetGateway
    (
    -- * Request
      CreateInternetGateway
    -- ** Request constructor
    , mkCreateInternetGatewayRequest
    -- * Response
    , CreateInternetGatewayResponse
    -- ** Response lenses
    , cigsInternetGateway
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CreateInternetGateway' request.
mkCreateInternetGatewayRequest :: CreateInternetGateway
mkCreateInternetGatewayRequest = CreateInternetGateway
{-# INLINE mkCreateInternetGatewayRequest #-}

    deriving (Eq, Show, Generic)

instance ToQuery CreateInternetGateway where
    toQuery = genericQuery def

newtype CreateInternetGatewayResponse = CreateInternetGatewayResponse
    { _cigsInternetGateway :: Maybe InternetGateway
      -- ^ Information about the Internet gateway.
    } deriving (Show, Generic)

-- | Information about the Internet gateway.
cigsInternetGateway :: Lens' CreateInternetGatewayResponse (Maybe InternetGateway)
cigsInternetGateway = lens _cigsInternetGateway (\s a -> s { _cigsInternetGateway = a })
{-# INLINE cigsInternetGateway #-}

instance FromXML CreateInternetGatewayResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest CreateInternetGateway where
    type Sv CreateInternetGateway = EC2
    type Rs CreateInternetGateway = CreateInternetGatewayResponse

    request = post "CreateInternetGateway"
    response _ = xmlResponse
