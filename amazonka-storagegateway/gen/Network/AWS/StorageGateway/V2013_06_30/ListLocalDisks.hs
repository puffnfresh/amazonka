{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.StorageGateway.V2013_06_30.ListLocalDisks
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation returns a list of the local disks of a gateway. To specify
-- which gateway to describe you use the Amazon Resource Name (ARN) of the
-- gateway in the body of the request. The request returns all disks,
-- specifying which are configured as working storage, stored volume or not
-- configured at all. Example Request The following example shows a request
-- that returns information about a gateway's local disks. POST / HTTP/1.1
-- Host: storagegateway.us-east-1.amazonaws.com x-amz-Date: 20120425T120000Z
-- Authorization: CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG
-- Content-type: application/x-amz-json-1.1 x-amz-target:
-- StorageGateway_20120630.ListLocalDisks { "GatewayARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway" }
-- HTTP/1.1 200 OK x-amzn-RequestId:
-- CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG Date: Wed, 25 Apr 2012
-- 12:00:02 GMT Content-type: application/x-amz-json-1.1 Content-length: 398 {
-- "Disks": [ { "DiskAllocationType": "UPLOAD_BUFFER", "DiskId":
-- "pci-0000:03:00.0-scsi-0:0:0:0", "DiskNode": "SCSI(0:0)", "DiskPath":
-- "/dev/sda", "DiskSizeInBytes": 1099511627776 }, { "DiskAllocationType":
-- "STORED_iSCSI_VOLUME", "DiskAllocationResource": "", "DiskId":
-- "pci-0000:03:00.0-scsi-0:0:1:0", "DiskNode": "SCSI(0:1)", "DiskPath":
-- "/dev/sdb", "DiskSizeInBytes": 1099511627776 } ], "GatewayARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway" }.
module Network.AWS.StorageGateway.V2013_06_30.ListLocalDisks
    (
    -- * Request
      ListLocalDisks
    -- ** Request constructor
    , mkListLocalDisksInput
    -- ** Request lenses
    , lldiGatewayARN

    -- * Response
    , ListLocalDisksResponse
    -- ** Response lenses
    , lldoGatewayARN
    , lldoDisks
    ) where

import           Network.AWS.StorageGateway.V2013_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ListLocalDisks' request.
mkListLocalDisksInput :: Text -- ^ 'lldiGatewayARN'
                      -> ListLocalDisks
mkListLocalDisksInput p1 = ListLocalDisks
    { _lldiGatewayARN = p1
    }
{-# INLINE mkListLocalDisksInput #-}

newtype ListLocalDisks = ListLocalDisks
    { _lldiGatewayARN :: Text
      -- ^ The Amazon Resource Name (ARN) of the gateway. Use the
      -- ListGateways operation to return a list of gateways for your
      -- account and region.
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
-- operation to return a list of gateways for your account and region.
lldiGatewayARN :: Lens' ListLocalDisks (Text)
lldiGatewayARN = lens _lldiGatewayARN (\s a -> s { _lldiGatewayARN = a })
{-# INLINE lldiGatewayARN #-}

instance ToPath ListLocalDisks

instance ToQuery ListLocalDisks

instance ToHeaders ListLocalDisks

instance ToJSON ListLocalDisks

data ListLocalDisksResponse = ListLocalDisksResponse
    { _lldoGatewayARN :: Maybe Text
      -- ^ The Amazon Resource Name (ARN) of the gateway. Use the
      -- ListGateways operation to return a list of gateways for your
      -- account and region.
    , _lldoDisks :: [DiskInformation]
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
-- operation to return a list of gateways for your account and region.
lldoGatewayARN :: Lens' ListLocalDisksResponse (Maybe Text)
lldoGatewayARN = lens _lldoGatewayARN (\s a -> s { _lldoGatewayARN = a })
{-# INLINE lldoGatewayARN #-}

lldoDisks :: Lens' ListLocalDisksResponse ([DiskInformation])
lldoDisks = lens _lldoDisks (\s a -> s { _lldoDisks = a })
{-# INLINE lldoDisks #-}

instance FromJSON ListLocalDisksResponse

instance AWSRequest ListLocalDisks where
    type Sv ListLocalDisks = StorageGateway
    type Rs ListLocalDisks = ListLocalDisksResponse

    request = get
    response _ = jsonResponse
