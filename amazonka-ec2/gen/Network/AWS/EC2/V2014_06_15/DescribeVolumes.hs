{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.DescribeVolumes
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Describes the specified Amazon EBS volumes. For more information about
-- Amazon EBS volumes, see Amazon EBS Volumes in the Amazon Elastic Compute
-- Cloud User Guide. Example This example describes all volumes associated
-- with your account. https://ec2.amazonaws.com/?Action=DescribeVolumes
-- &amp;AUTHPARAMS &lt;DescribeVolumesResponse
-- xmlns="http://ec2.amazonaws.com/doc/2014-02-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;volumeSet&gt; &lt;item&gt;
-- &lt;volumeId&gt;vol-1a2b3c4d&lt;/volumeId&gt; &lt;size&gt;80&lt;/size&gt;
-- &lt;snapshotId/&gt;
-- &lt;availabilityZone&gt;us-east-1a&lt;/availabilityZone&gt;
-- &lt;status&gt;in-use&lt;/status&gt;
-- &lt;createTime&gt;YYYY-MM-DDTHH:MM:SS.SSSZ&lt;/createTime&gt;
-- &lt;attachmentSet&gt; &lt;item&gt;
-- &lt;volumeId&gt;vol-1a2b3c4d&lt;/volumeId&gt;
-- &lt;instanceId&gt;i-1a2b3c4d&lt;/instanceId&gt;
-- &lt;device&gt;/dev/sdh&lt;/device&gt; &lt;status&gt;attached&lt;/status&gt;
-- &lt;attachTime&gt;YYYY-MM-DDTHH:MM:SS.SSSZ&lt;/attachTime&gt;
-- &lt;deleteOnTermination&gt;false&lt;/deleteOnTermination&gt; &lt;/item&gt;
-- &lt;/attachmentSet&gt; &lt;volumeType&gt;standard&lt;/volumeType&gt;
-- &lt;encrypted&gt;true&lt;/encrypted&gt; &lt;/item&gt; &lt;/volumeSet&gt;
-- &lt;/DescribeVolumesResponse&gt;.
module Network.AWS.EC2.V2014_06_15.DescribeVolumes
    (
    -- * Request
      DescribeVolumes
    -- ** Request constructor
    , mkDescribeVolumesRequest
    -- ** Request lenses
    , dvtVolumeIds
    , dvtFilters

    -- * Response
    , DescribeVolumesResponse
    -- ** Response lenses
    , dvuVolumes
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeVolumes' request.
mkDescribeVolumesRequest :: DescribeVolumes
mkDescribeVolumesRequest = DescribeVolumes
    { _dvtVolumeIds = mempty
    , _dvtFilters = mempty
    }
{-# INLINE mkDescribeVolumesRequest #-}

data DescribeVolumes = DescribeVolumes
    { _dvtVolumeIds :: [Text]
      -- ^ One or more volume IDs.
    , _dvtFilters :: [Filter]
      -- ^ One or more filters. attachment.attach-time - The time stamp when
      -- the attachment initiated. attachment.delete-on-termination -
      -- Whether the volume is deleted on instance termination.
      -- attachment.device - The device name that is exposed to the
      -- instance (for example, /dev/sda1). attachment.instance-id - The
      -- ID of the instance the volume is attached to. attachment.status -
      -- The attachment state (attaching | attached | detaching |
      -- detached). availability-zone - The Availability Zone in which the
      -- volume was created. create-time - The time stamp when the volume
      -- was created. encrypted - The encryption status of the volume.
      -- size - The size of the volume, in GiB. snapshot-id - The snapshot
      -- from which the volume was created. status - The status of the
      -- volume (creating | available | in-use | deleting | deleted |
      -- error). tag:key=value - The key/value combination of a tag
      -- assigned to the resource. tag-key - The key of a tag assigned to
      -- the resource. This filter is independent of the tag-value filter.
      -- For example, if you use both the filter "tag-key=Purpose" and the
      -- filter "tag-value=X", you get any resources assigned both the tag
      -- key Purpose (regardless of what the tag's value is), and the tag
      -- value X (regardless of what the tag's key is). If you want to
      -- list only resources where Purpose is X, see the tag:key=value
      -- filter. tag-value - The value of a tag assigned to the resource.
      -- This filter is independent of the tag-key filter. volume-id - The
      -- volume ID. volume-type - The Amazon EBS volume type. This can be
      -- gp2 for General Purpose (SSD) volumes, io1 for Provisioned IOPS
      -- (SSD) volumes, or standard for Magnetic volumes.
    } deriving (Show, Generic)

-- | One or more volume IDs.
dvtVolumeIds :: Lens' DescribeVolumes ([Text])
dvtVolumeIds = lens _dvtVolumeIds (\s a -> s { _dvtVolumeIds = a })
{-# INLINE dvtVolumeIds #-}

-- | One or more filters. attachment.attach-time - The time stamp when the
-- attachment initiated. attachment.delete-on-termination - Whether the volume
-- is deleted on instance termination. attachment.device - The device name
-- that is exposed to the instance (for example, /dev/sda1).
-- attachment.instance-id - The ID of the instance the volume is attached to.
-- attachment.status - The attachment state (attaching | attached | detaching
-- | detached). availability-zone - The Availability Zone in which the volume
-- was created. create-time - The time stamp when the volume was created.
-- encrypted - The encryption status of the volume. size - The size of the
-- volume, in GiB. snapshot-id - The snapshot from which the volume was
-- created. status - The status of the volume (creating | available | in-use |
-- deleting | deleted | error). tag:key=value - The key/value combination of a
-- tag assigned to the resource. tag-key - The key of a tag assigned to the
-- resource. This filter is independent of the tag-value filter. For example,
-- if you use both the filter "tag-key=Purpose" and the filter "tag-value=X",
-- you get any resources assigned both the tag key Purpose (regardless of what
-- the tag's value is), and the tag value X (regardless of what the tag's key
-- is). If you want to list only resources where Purpose is X, see the
-- tag:key=value filter. tag-value - The value of a tag assigned to the
-- resource. This filter is independent of the tag-key filter. volume-id - The
-- volume ID. volume-type - The Amazon EBS volume type. This can be gp2 for
-- General Purpose (SSD) volumes, io1 for Provisioned IOPS (SSD) volumes, or
-- standard for Magnetic volumes.
dvtFilters :: Lens' DescribeVolumes ([Filter])
dvtFilters = lens _dvtFilters (\s a -> s { _dvtFilters = a })
{-# INLINE dvtFilters #-}

instance ToQuery DescribeVolumes where
    toQuery = genericQuery def

newtype DescribeVolumesResponse = DescribeVolumesResponse
    { _dvuVolumes :: [Volume]
      -- ^ 
    } deriving (Show, Generic)

-- | 
dvuVolumes :: Lens' DescribeVolumesResponse ([Volume])
dvuVolumes = lens _dvuVolumes (\s a -> s { _dvuVolumes = a })
{-# INLINE dvuVolumes #-}

instance FromXML DescribeVolumesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeVolumes where
    type Sv DescribeVolumes = EC2
    type Rs DescribeVolumes = DescribeVolumesResponse

    request = post "DescribeVolumes"
    response _ = xmlResponse
