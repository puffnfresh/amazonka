{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.V2013_09_09.DescribeDBLogFiles
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns a list of DB log files for the DB instance.
-- https://rds.amazonaws.com/ ?DBInstanceIdentifier=rrak-mysql &MaxRecords=100
-- &Version=2013-02-12 &Action=DescribeDBLogFiles &SignatureVersion=4
-- &SignatureMethod=HmacSHA256 &Timestamp=20130327T173621Z
-- &X-Amz-Algorithm=AWS4-HMAC-SHA256 &X-Amz-Date=20130327T173621Z
-- &X-Amz-SignedHeaders=Host &X-Amz-Expires=20130327T173621Z
-- &X-Amz-Credential= &X-Amz-Signature= 1364403600000
-- error/mysql-error-running.log 0 1364338800000
-- error/mysql-error-running.log.0 0 1364342400000
-- error/mysql-error-running.log.1 0 1364346000000
-- error/mysql-error-running.log.2 0 1364349600000
-- error/mysql-error-running.log.3 0 1364405700000 error/mysql-error.log 0
-- d70fb3b3-9704-11e2-a0db-871552e0ef19.
module Network.AWS.RDS.V2013_09_09.DescribeDBLogFiles
    (
    -- * Request
      DescribeDBLogFiles
    -- ** Request constructor
    , mkDescribeDBLogFilesMessage
    -- ** Request lenses
    , ddblfmDBInstanceIdentifier
    , ddblfmFilenameContains
    , ddblfmFileLastWritten
    , ddblfmFileSize
    , ddblfmMaxRecords
    , ddblfmMarker

    -- * Response
    , DescribeDBLogFilesResponse
    -- ** Response lenses
    , ddblfrDescribeDBLogFiles
    , ddblfrMarker
    ) where

import Network.AWS.Request.Query
import Network.AWS.RDS.V2013_09_09.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeDBLogFiles' request.
mkDescribeDBLogFilesMessage :: Text -- ^ 'ddblfmDBInstanceIdentifier'
                            -> DescribeDBLogFiles
mkDescribeDBLogFilesMessage p1 = DescribeDBLogFiles
    { _ddblfmDBInstanceIdentifier = p1
    , _ddblfmFilenameContains = Nothing
    , _ddblfmFileLastWritten = Nothing
    , _ddblfmFileSize = Nothing
    , _ddblfmMaxRecords = Nothing
    , _ddblfmMarker = Nothing
    }
{-# INLINE mkDescribeDBLogFilesMessage #-}

data DescribeDBLogFiles = DescribeDBLogFiles
    { _ddblfmDBInstanceIdentifier :: Text
      -- ^ The customer-assigned name of the DB instance that contains the
      -- log files you want to list. Constraints: Must contain from 1 to
      -- 63 alphanumeric characters or hyphens First character must be a
      -- letter Cannot end with a hyphen or contain two consecutive
      -- hyphens.
    , _ddblfmFilenameContains :: Maybe Text
      -- ^ Filters the available log files for log file names that contain
      -- the specified string.
    , _ddblfmFileLastWritten :: Maybe Integer
      -- ^ Filters the available log files for files written since the
      -- specified date, in POSIX timestamp format.
    , _ddblfmFileSize :: Maybe Integer
      -- ^ Filters the available log files for files larger than the
      -- specified size.
    , _ddblfmMaxRecords :: Maybe Integer
      -- ^ The maximum number of records to include in the response. If more
      -- records exist than the specified MaxRecords value, a pagination
      -- token called a marker is included in the response so that the
      -- remaining results can be retrieved.
    , _ddblfmMarker :: Maybe Text
      -- ^ The pagination token provided in the previous request. If this
      -- parameter is specified the response includes only records beyond
      -- the marker, up to MaxRecords.
    } deriving (Show, Generic)

-- | The customer-assigned name of the DB instance that contains the log files
-- you want to list. Constraints: Must contain from 1 to 63 alphanumeric
-- characters or hyphens First character must be a letter Cannot end with a
-- hyphen or contain two consecutive hyphens.
ddblfmDBInstanceIdentifier :: Lens' DescribeDBLogFiles (Text)
ddblfmDBInstanceIdentifier = lens _ddblfmDBInstanceIdentifier (\s a -> s { _ddblfmDBInstanceIdentifier = a })
{-# INLINE ddblfmDBInstanceIdentifier #-}

-- | Filters the available log files for log file names that contain the
-- specified string.
ddblfmFilenameContains :: Lens' DescribeDBLogFiles (Maybe Text)
ddblfmFilenameContains = lens _ddblfmFilenameContains (\s a -> s { _ddblfmFilenameContains = a })
{-# INLINE ddblfmFilenameContains #-}

-- | Filters the available log files for files written since the specified date,
-- in POSIX timestamp format.
ddblfmFileLastWritten :: Lens' DescribeDBLogFiles (Maybe Integer)
ddblfmFileLastWritten = lens _ddblfmFileLastWritten (\s a -> s { _ddblfmFileLastWritten = a })
{-# INLINE ddblfmFileLastWritten #-}

-- | Filters the available log files for files larger than the specified size.
ddblfmFileSize :: Lens' DescribeDBLogFiles (Maybe Integer)
ddblfmFileSize = lens _ddblfmFileSize (\s a -> s { _ddblfmFileSize = a })
{-# INLINE ddblfmFileSize #-}

-- | The maximum number of records to include in the response. If more records
-- exist than the specified MaxRecords value, a pagination token called a
-- marker is included in the response so that the remaining results can be
-- retrieved.
ddblfmMaxRecords :: Lens' DescribeDBLogFiles (Maybe Integer)
ddblfmMaxRecords = lens _ddblfmMaxRecords (\s a -> s { _ddblfmMaxRecords = a })
{-# INLINE ddblfmMaxRecords #-}

-- | The pagination token provided in the previous request. If this parameter is
-- specified the response includes only records beyond the marker, up to
-- MaxRecords.
ddblfmMarker :: Lens' DescribeDBLogFiles (Maybe Text)
ddblfmMarker = lens _ddblfmMarker (\s a -> s { _ddblfmMarker = a })
{-# INLINE ddblfmMarker #-}

instance ToQuery DescribeDBLogFiles where
    toQuery = genericQuery def

data DescribeDBLogFilesResponse = DescribeDBLogFilesResponse
    { _ddblfrDescribeDBLogFiles :: [DescribeDBLogFilesDetails]
      -- ^ The DB log files returned.
    , _ddblfrMarker :: Maybe Text
      -- ^ An optional paging token.
    } deriving (Show, Generic)

-- | The DB log files returned.
ddblfrDescribeDBLogFiles :: Lens' DescribeDBLogFilesResponse ([DescribeDBLogFilesDetails])
ddblfrDescribeDBLogFiles = lens _ddblfrDescribeDBLogFiles (\s a -> s { _ddblfrDescribeDBLogFiles = a })
{-# INLINE ddblfrDescribeDBLogFiles #-}

-- | An optional paging token.
ddblfrMarker :: Lens' DescribeDBLogFilesResponse (Maybe Text)
ddblfrMarker = lens _ddblfrMarker (\s a -> s { _ddblfrMarker = a })
{-# INLINE ddblfrMarker #-}

instance FromXML DescribeDBLogFilesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeDBLogFiles where
    type Sv DescribeDBLogFiles = RDS
    type Rs DescribeDBLogFiles = DescribeDBLogFilesResponse

    request = post "DescribeDBLogFiles"
    response _ = xmlResponse

instance AWSPager DescribeDBLogFiles where
    next rq rs = (\x -> rq { _ddblfmMarker = Just x })
        <$> (_ddblfrMarker rs)
