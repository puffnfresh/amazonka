{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.DynamoDB.V2012_08_10.DeleteTable
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The DeleteTable operation deletes a table and all of its items. After a
-- DeleteTable request, the specified table is in the DELETING state until
-- DynamoDB completes the deletion. If the table is in the ACTIVE state, you
-- can delete it. If a table is in CREATING or UPDATING states, then DynamoDB
-- returns a ResourceInUseException. If the specified table does not exist,
-- DynamoDB returns a ResourceNotFoundException. If table is already in the
-- DELETING state, no error is returned. DynamoDB might continue to accept
-- data read and write operations, such as GetItem and PutItem, on a table in
-- the DELETING state until the table deletion is complete. When you delete a
-- table, any indexes on that table are also deleted. Use the DescribeTable
-- API to check the status of the table. Delete a Table This example deletes
-- the Reply table. { "TableDescription": { "ItemCount": 0,
-- "ProvisionedThroughput": { "NumberOfDecreasesToday": 0,
-- "ReadCapacityUnits": 5, "WriteCapacityUnits": 5 }, "TableName": "Reply",
-- "TableSizeBytes": 0, "TableStatus": "DELETING" } }.
module Network.AWS.DynamoDB.V2012_08_10.DeleteTable
    (
    -- * Request
      DeleteTable
    -- ** Request constructor
    , mkDeleteTableInput
    -- ** Request lenses
    , dtiTableName

    -- * Response
    , DeleteTableResponse
    -- ** Response lenses
    , dtoTableDescription
    ) where

import           Network.AWS.DynamoDB.V2012_08_10.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteTable' request.
mkDeleteTableInput :: Text -- ^ 'dtiTableName'
                   -> DeleteTable
mkDeleteTableInput p1 = DeleteTable
    { _dtiTableName = p1
    }
{-# INLINE mkDeleteTableInput #-}

newtype DeleteTable = DeleteTable
    { _dtiTableName :: Text
      -- ^ The name of the table to delete.
    } deriving (Show, Generic)

-- | The name of the table to delete.
dtiTableName :: Lens' DeleteTable (Text)
dtiTableName = lens _dtiTableName (\s a -> s { _dtiTableName = a })
{-# INLINE dtiTableName #-}

instance ToPath DeleteTable

instance ToQuery DeleteTable

instance ToHeaders DeleteTable

instance ToJSON DeleteTable

newtype DeleteTableResponse = DeleteTableResponse
    { _dtoTableDescription :: Maybe TableDescription
      -- ^ Represents the properties of a table.
    } deriving (Show, Generic)

-- | Represents the properties of a table.
dtoTableDescription :: Lens' DeleteTableResponse (Maybe TableDescription)
dtoTableDescription = lens _dtoTableDescription (\s a -> s { _dtoTableDescription = a })
{-# INLINE dtoTableDescription #-}

instance FromJSON DeleteTableResponse

instance AWSRequest DeleteTable where
    type Sv DeleteTable = DynamoDB
    type Rs DeleteTable = DeleteTableResponse

    request = get
    response _ = jsonResponse
