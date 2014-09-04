{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.StorageGateway.V2013_06_30.CreateStorediSCSIVolume
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation creates a volume on a specified gateway. This operation is
-- supported only for the gateway-cached volume architecture. The size of the
-- volume to create is inferred from the disk size. You can choose to preserve
-- existing data on the disk, create volume from an existing snapshot, or
-- create an empty volume. If you choose to create an empty gateway volume,
-- then any existing data on the disk is erased. In the request you must
-- specify the gateway and the disk information on which you are creating the
-- volume. In response, AWS Storage Gateway creates the volume and returns
-- volume information such as the volume Amazon Resource Name (ARN), its size,
-- and the iSCSI target ARN that initiators can use to connect to the volume
-- target. Example Request The following example shows a request that
-- specifies that a local disk of a gateway be configured as a volume. POST /
-- HTTP/1.1 Host: storagegateway.us-east-1.amazonaws.com x-amz-Date:
-- 20120425T120000Z Authorization:
-- CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG Content-type:
-- application/x-amz-json-1.1 x-amz-target:
-- StorageGateway_20120630.CreateStorediSCSIVolume { "GatewayARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway",
-- "DiskId": "pci-0000:03:00.0-scsi-0:0:0:0", "PreserveExistingData": true,
-- "TargetName": "myvolume", "NetworkInterfaceId": "10.1.1.1" } HTTP/1.1 200
-- OK x-amzn-RequestId: CSOC7TJPLR0OOKIRLGOHVAICUFVV4KQNSO5AEMVJF66Q9ASUAAJG
-- Date: Wed, 25 Apr 2012 12:00:02 GMT Content-type:
-- application/x-amz-json-1.1 Content-length: 215 { "VolumeARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway/volume/vol-1122AABB",
-- "VolumeSizeInBytes": 1099511627776, "TargetARN":
-- "arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway/target/iqn.1997-05.com.amazon:myvolume"
-- }.
module Network.AWS.StorageGateway.V2013_06_30.CreateStorediSCSIVolume
    (
    -- * Request
      CreateStorediSCSIVolume
    -- ** Request constructor
    , mkCreateStorediSCSIVolumeInput
    -- ** Request lenses
    , csscsiviGatewayARN
    , csscsiviDiskId
    , csscsiviSnapshotId
    , csscsiviPreserveExistingData
    , csscsiviTargetName
    , csscsiviNetworkInterfaceId

    -- * Response
    , CreateStorediSCSIVolumeResponse
    -- ** Response lenses
    , csscsivoVolumeARN
    , csscsivoVolumeSizeInBytes
    , csscsivoTargetARN
    ) where

import           Network.AWS.StorageGateway.V2013_06_30.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CreateStorediSCSIVolume' request.
mkCreateStorediSCSIVolumeInput :: Text -- ^ 'csscsiviGatewayARN'
                               -> Text -- ^ 'csscsiviDiskId'
                               -> Bool -- ^ 'csscsiviPreserveExistingData'
                               -> Text -- ^ 'csscsiviTargetName'
                               -> Text -- ^ 'csscsiviNetworkInterfaceId'
                               -> CreateStorediSCSIVolume
mkCreateStorediSCSIVolumeInput p1 p2 p3 p4 p5 = CreateStorediSCSIVolume
    { _csscsiviGatewayARN = p1
    , _csscsiviDiskId = p2
    , _csscsiviSnapshotId = Nothing
    , _csscsiviPreserveExistingData = p4
    , _csscsiviTargetName = p5
    , _csscsiviNetworkInterfaceId = p6
    }
{-# INLINE mkCreateStorediSCSIVolumeInput #-}

data CreateStorediSCSIVolume = CreateStorediSCSIVolume
    { _csscsiviGatewayARN :: Text
      -- ^ The Amazon Resource Name (ARN) of the gateway. Use the
      -- ListGateways operation to return a list of gateways for your
      -- account and region.
    , _csscsiviDiskId :: Text
      -- ^ The unique identifier for the gateway local disk that is
      -- configured as a stored volume. Use ListLocalDisks to list disk
      -- IDs for a gateway.
    , _csscsiviSnapshotId :: Maybe Text
      -- ^ The snapshot ID (e.g. "snap-1122aabb") of the snapshot to restore
      -- as the new stored volume. Specify this field if you want to
      -- create the iSCSI storage volume from a snapshot otherwise do not
      -- include this field. To list snapshots for your account use
      -- DescribeSnapshots in the Amazon Elastic Compute Cloud API
      -- Reference.
    , _csscsiviPreserveExistingData :: Bool
      -- ^ Specify this field as true if you want to preserve the data on
      -- the local disk. Otherwise, specifying this field as false creates
      -- an empty volume. Valid Values: true, false.
    , _csscsiviTargetName :: Text
      -- ^ The name of the iSCSI target used by initiators to connect to the
      -- target and as a suffix for the target ARN. For example,
      -- specifying TargetName as myvolume results in the target ARN of
      -- arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway/target/iqn.1997-05.com.amazon:myvolume.
      -- The target name must be unique across all volumes of a gateway.
    , _csscsiviNetworkInterfaceId :: Text
      -- ^ The network interface of the gateway on which to expose the iSCSI
      -- target. Only IPv4 addresses are accepted. Use
      -- DescribeGatewayInformation to get a list of the network
      -- interfaces available on a gateway. Valid Values: A valid IP
      -- address.
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) of the gateway. Use the ListGateways
-- operation to return a list of gateways for your account and region.
csscsiviGatewayARN :: Lens' CreateStorediSCSIVolume (Text)
csscsiviGatewayARN = lens _csscsiviGatewayARN (\s a -> s { _csscsiviGatewayARN = a })
{-# INLINE csscsiviGatewayARN #-}

-- | The unique identifier for the gateway local disk that is configured as a
-- stored volume. Use ListLocalDisks to list disk IDs for a gateway.
csscsiviDiskId :: Lens' CreateStorediSCSIVolume (Text)
csscsiviDiskId = lens _csscsiviDiskId (\s a -> s { _csscsiviDiskId = a })
{-# INLINE csscsiviDiskId #-}

-- | The snapshot ID (e.g. "snap-1122aabb") of the snapshot to restore as the
-- new stored volume. Specify this field if you want to create the iSCSI
-- storage volume from a snapshot otherwise do not include this field. To list
-- snapshots for your account use DescribeSnapshots in the Amazon Elastic
-- Compute Cloud API Reference.
csscsiviSnapshotId :: Lens' CreateStorediSCSIVolume (Maybe Text)
csscsiviSnapshotId = lens _csscsiviSnapshotId (\s a -> s { _csscsiviSnapshotId = a })
{-# INLINE csscsiviSnapshotId #-}

-- | Specify this field as true if you want to preserve the data on the local
-- disk. Otherwise, specifying this field as false creates an empty volume.
-- Valid Values: true, false.
csscsiviPreserveExistingData :: Lens' CreateStorediSCSIVolume (Bool)
csscsiviPreserveExistingData = lens _csscsiviPreserveExistingData (\s a -> s { _csscsiviPreserveExistingData = a })
{-# INLINE csscsiviPreserveExistingData #-}

-- | The name of the iSCSI target used by initiators to connect to the target
-- and as a suffix for the target ARN. For example, specifying TargetName as
-- myvolume results in the target ARN of
-- arn:aws:storagegateway:us-east-1:111122223333:gateway/mygateway/target/iqn.1997-05.com.amazon:myvolume.
-- The target name must be unique across all volumes of a gateway.
csscsiviTargetName :: Lens' CreateStorediSCSIVolume (Text)
csscsiviTargetName = lens _csscsiviTargetName (\s a -> s { _csscsiviTargetName = a })
{-# INLINE csscsiviTargetName #-}

-- | The network interface of the gateway on which to expose the iSCSI target.
-- Only IPv4 addresses are accepted. Use DescribeGatewayInformation to get a
-- list of the network interfaces available on a gateway. Valid Values: A
-- valid IP address.
csscsiviNetworkInterfaceId :: Lens' CreateStorediSCSIVolume (Text)
csscsiviNetworkInterfaceId = lens _csscsiviNetworkInterfaceId (\s a -> s { _csscsiviNetworkInterfaceId = a })
{-# INLINE csscsiviNetworkInterfaceId #-}

instance ToPath CreateStorediSCSIVolume

instance ToQuery CreateStorediSCSIVolume

instance ToHeaders CreateStorediSCSIVolume

instance ToJSON CreateStorediSCSIVolume

data CreateStorediSCSIVolumeResponse = CreateStorediSCSIVolumeResponse
    { _csscsivoVolumeARN :: Maybe Text
      -- ^ The Amazon Resource Name (ARN) of the configured volume.
    , _csscsivoVolumeSizeInBytes :: Maybe Integer
      -- ^ The size of the volume in bytes.
    , _csscsivoTargetARN :: Maybe Text
      -- ^ he Amazon Resource Name (ARN) of the volume target that includes
      -- the iSCSI name that initiators can use to connect to the target.
    } deriving (Show, Generic)

-- | The Amazon Resource Name (ARN) of the configured volume.
csscsivoVolumeARN :: Lens' CreateStorediSCSIVolumeResponse (Maybe Text)
csscsivoVolumeARN = lens _csscsivoVolumeARN (\s a -> s { _csscsivoVolumeARN = a })
{-# INLINE csscsivoVolumeARN #-}

-- | The size of the volume in bytes.
csscsivoVolumeSizeInBytes :: Lens' CreateStorediSCSIVolumeResponse (Maybe Integer)
csscsivoVolumeSizeInBytes = lens _csscsivoVolumeSizeInBytes (\s a -> s { _csscsivoVolumeSizeInBytes = a })
{-# INLINE csscsivoVolumeSizeInBytes #-}

-- | he Amazon Resource Name (ARN) of the volume target that includes the iSCSI
-- name that initiators can use to connect to the target.
csscsivoTargetARN :: Lens' CreateStorediSCSIVolumeResponse (Maybe Text)
csscsivoTargetARN = lens _csscsivoTargetARN (\s a -> s { _csscsivoTargetARN = a })
{-# INLINE csscsivoTargetARN #-}

instance FromJSON CreateStorediSCSIVolumeResponse

instance AWSRequest CreateStorediSCSIVolume where
    type Sv CreateStorediSCSIVolume = StorageGateway
    type Rs CreateStorediSCSIVolume = CreateStorediSCSIVolumeResponse

    request = get
    response _ = jsonResponse
