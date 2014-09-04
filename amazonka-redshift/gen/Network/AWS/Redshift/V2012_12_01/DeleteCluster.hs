{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.DeleteCluster
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes a previously provisioned cluster. A successful response from the
-- web service indicates that the request was received correctly. If a final
-- cluster snapshot is requested the status of the cluster will be
-- "final-snapshot" while the snapshot is being taken, then it's "deleting"
-- once Amazon Redshift begins deleting the cluster. Use DescribeClusters to
-- monitor the status of the deletion. The delete operation cannot be canceled
-- or reverted once submitted. For more information about managing clusters,
-- go to Amazon Redshift Clusters in the Amazon Redshift Management Guide .
-- https://redshift.us-east-1.amazonaws.com/ ?Action=DeleteCluster
-- &ClusterIdentifier=examplecluster2 &SkipFinalClusterSnapshot=true
-- &Version=2012-12-01 &x-amz-algorithm=AWS4-HMAC-SHA256
-- &x-amz-credential=AKIAIOSFODNN7EXAMPLE/20130123/us-east-1/redshift/aws4_request
-- &x-amz-date=20130123T022400Z
-- &x-amz-signedheaders=content-type;host;x-amz-date 1.0 5439
-- examplecluster2.cobbanlpscsn.us-east-1.redshift.amazonaws.com deleting 2 1
-- true true dev sun:10:30-sun:11:00 in-sync default.redshift-1.0
-- 2013-01-23T00:11:32.804Z active default us-east-1a dw1.xlarge
-- examplecluster2 true masteruser f2e6b87e-6503-11e2-b343-393adc3f0a21.
module Network.AWS.Redshift.V2012_12_01.DeleteCluster
    (
    -- * Request
      DeleteCluster
    -- ** Request constructor
    , mkDeleteClusterMessage
    -- ** Request lenses
    , dcmClusterIdentifier
    , dcmSkipFinalClusterSnapshot
    , dcmFinalClusterSnapshotIdentifier

    -- * Response
    , DeleteClusterResponse
    -- ** Response lenses
    , cxCluster
    ) where

import Network.AWS.Request.Query
import Network.AWS.Redshift.V2012_12_01.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteCluster' request.
mkDeleteClusterMessage :: Text -- ^ 'dcmClusterIdentifier'
                       -> DeleteCluster
mkDeleteClusterMessage p1 = DeleteCluster
    { _dcmClusterIdentifier = p1
    , _dcmSkipFinalClusterSnapshot = Nothing
    , _dcmFinalClusterSnapshotIdentifier = Nothing
    }
{-# INLINE mkDeleteClusterMessage #-}

data DeleteCluster = DeleteCluster
    { _dcmClusterIdentifier :: Text
      -- ^ The identifier of the cluster to be deleted. Constraints: Must
      -- contain lowercase characters. Must contain from 1 to 63
      -- alphanumeric characters or hyphens. First character must be a
      -- letter. Cannot end with a hyphen or contain two consecutive
      -- hyphens.
    , _dcmSkipFinalClusterSnapshot :: Maybe Bool
      -- ^ Determines whether a final snapshot of the cluster is created
      -- before Amazon Redshift deletes the cluster. If true, a final
      -- cluster snapshot is not created. If false, a final cluster
      -- snapshot is created before the cluster is deleted. The
      -- FinalClusterSnapshotIdentifier parameter must be specified if
      -- SkipFinalClusterSnapshot is false. Default: false.
    , _dcmFinalClusterSnapshotIdentifier :: Maybe Text
      -- ^ The identifier of the final snapshot that is to be created
      -- immediately before deleting the cluster. If this parameter is
      -- provided, SkipFinalClusterSnapshot must be false. Constraints:
      -- Must be 1 to 255 alphanumeric characters. First character must be
      -- a letter. Cannot end with a hyphen or contain two consecutive
      -- hyphens.
    } deriving (Show, Generic)

-- | The identifier of the cluster to be deleted. Constraints: Must contain
-- lowercase characters. Must contain from 1 to 63 alphanumeric characters or
-- hyphens. First character must be a letter. Cannot end with a hyphen or
-- contain two consecutive hyphens.
dcmClusterIdentifier :: Lens' DeleteCluster (Text)
dcmClusterIdentifier = lens _dcmClusterIdentifier (\s a -> s { _dcmClusterIdentifier = a })
{-# INLINE dcmClusterIdentifier #-}

-- | Determines whether a final snapshot of the cluster is created before Amazon
-- Redshift deletes the cluster. If true, a final cluster snapshot is not
-- created. If false, a final cluster snapshot is created before the cluster
-- is deleted. The FinalClusterSnapshotIdentifier parameter must be specified
-- if SkipFinalClusterSnapshot is false. Default: false.
dcmSkipFinalClusterSnapshot :: Lens' DeleteCluster (Maybe Bool)
dcmSkipFinalClusterSnapshot = lens _dcmSkipFinalClusterSnapshot (\s a -> s { _dcmSkipFinalClusterSnapshot = a })
{-# INLINE dcmSkipFinalClusterSnapshot #-}

-- | The identifier of the final snapshot that is to be created immediately
-- before deleting the cluster. If this parameter is provided,
-- SkipFinalClusterSnapshot must be false. Constraints: Must be 1 to 255
-- alphanumeric characters. First character must be a letter. Cannot end with
-- a hyphen or contain two consecutive hyphens.
dcmFinalClusterSnapshotIdentifier :: Lens' DeleteCluster (Maybe Text)
dcmFinalClusterSnapshotIdentifier = lens _dcmFinalClusterSnapshotIdentifier (\s a -> s { _dcmFinalClusterSnapshotIdentifier = a })
{-# INLINE dcmFinalClusterSnapshotIdentifier #-}

instance ToQuery DeleteCluster where
    toQuery = genericQuery def

newtype DeleteClusterResponse = DeleteClusterResponse
    { _cxCluster :: Maybe Cluster
      -- ^ Describes a cluster.
    } deriving (Show, Generic)

-- | Describes a cluster.
cxCluster :: Lens' DeleteClusterResponse (Maybe Cluster)
cxCluster = lens _cxCluster (\s a -> s { _cxCluster = a })
{-# INLINE cxCluster #-}

instance FromXML DeleteClusterResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DeleteCluster where
    type Sv DeleteCluster = Redshift
    type Rs DeleteCluster = DeleteClusterResponse

    request = post "DeleteCluster"
    response _ = xmlResponse
