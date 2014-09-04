{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SimpleDB.V2009_04_15.BatchPutAttributes
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The BatchPutAttributes operation creates or replaces attributes within one
-- or more items. By using this operation, the client can perform multiple
-- PutAttribute operation with a single call. This helps yield savings in
-- round trips and latencies, enabling Amazon SimpleDB to optimize requests
-- and generally produce better throughput. The client may specify the item
-- name with the Item.X.ItemName parameter. The client may specify new
-- attributes using a combination of the Item.X.Attribute.Y.Name and
-- Item.X.Attribute.Y.Value parameters. The client may specify the first
-- attribute for the first item using the parameters Item.0.Attribute.0.Name
-- and Item.0.Attribute.0.Value, and for the second attribute for the first
-- item by the parameters Item.0.Attribute.1.Name and
-- Item.0.Attribute.1.Value, and so on. Attributes are uniquely identified
-- within an item by their name/value combination. For example, a single item
-- can have the attributes { "first_name", "first_value" } and { "first_name",
-- "second_value" }. However, it cannot have two attribute instances where
-- both the Item.X.Attribute.Y.Name and Item.X.Attribute.Y.Value are the same.
-- Optionally, the requester can supply the Replace parameter for each
-- individual value. Setting this value to true will cause the new attribute
-- values to replace the existing attribute values. For example, if an item I
-- has the attributes { 'a', '1' }, { 'b', '2'} and { 'b', '3' } and the
-- requester does a BatchPutAttributes of {'I', 'b', '4' } with the Replace
-- parameter set to true, the final attributes of the item will be { 'a', '1'
-- } and { 'b', '4' }, replacing the previous values of the 'b' attribute with
-- the new value. You cannot specify an empty string as an item or as an
-- attribute name. The BatchPutAttributes operation succeeds or fails in its
-- entirety. There are no partial puts. This operation is vulnerable to
-- exceeding the maximum URL size when making a REST request using the HTTP
-- GET method. This operation does not support conditions using
-- Expected.X.Name, Expected.X.Value, or Expected.X.Exists. You can execute
-- multiple BatchPutAttributes operations and other operations in parallel.
-- However, large numbers of concurrent BatchPutAttributes calls can result in
-- Service Unavailable (503) responses. The following limitations are enforced
-- for this operation: 256 attribute name-value pairs per item 1 MB request
-- size 1 billion attributes per domain 10 GB of total user data storage per
-- domain 25 item limit per BatchPutAttributes operation.
module Network.AWS.SimpleDB.V2009_04_15.BatchPutAttributes
    (
    -- * Request
      BatchPutAttributes
    -- ** Request constructor
    , mkBatchPutAttributesRequest
    -- ** Request lenses
    , bparDomainName
    , bparItems

    -- * Response
    , BatchPutAttributesResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.SimpleDB.V2009_04_15.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'BatchPutAttributes' request.
mkBatchPutAttributesRequest :: Text -- ^ 'bparDomainName'
                            -> [ReplaceableItem] -- ^ 'bparItems'
                            -> BatchPutAttributes
mkBatchPutAttributesRequest p1 p2 = BatchPutAttributes
    { _bparDomainName = p1
    , _bparItems = p2
    }
{-# INLINE mkBatchPutAttributesRequest #-}

data BatchPutAttributes = BatchPutAttributes
    { _bparDomainName :: Text
      -- ^ The name of the domain in which the attributes are being stored.
    , _bparItems :: [ReplaceableItem]
      -- ^ A list of items on which to perform the operation.
    } deriving (Show, Generic)

-- | The name of the domain in which the attributes are being stored.
bparDomainName :: Lens' BatchPutAttributes (Text)
bparDomainName = lens _bparDomainName (\s a -> s { _bparDomainName = a })
{-# INLINE bparDomainName #-}

-- | A list of items on which to perform the operation.
bparItems :: Lens' BatchPutAttributes ([ReplaceableItem])
bparItems = lens _bparItems (\s a -> s { _bparItems = a })
{-# INLINE bparItems #-}

instance ToQuery BatchPutAttributes where
    toQuery = genericQuery def

data BatchPutAttributesResponse = BatchPutAttributesResponse
    deriving (Eq, Show, Generic)

instance AWSRequest BatchPutAttributes where
    type Sv BatchPutAttributes = SimpleDB
    type Rs BatchPutAttributes = BatchPutAttributesResponse

    request = post "BatchPutAttributes"
    response _ = nullaryResponse BatchPutAttributesResponse
