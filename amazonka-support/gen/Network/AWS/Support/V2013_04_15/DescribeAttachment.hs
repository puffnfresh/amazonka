{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Support.V2013_04_15.DescribeAttachment
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the attachment that has the specified ID. Attachment IDs are
-- generated by the case management system when you add an attachment to a
-- case or case communication. Attachment IDs are returned in the
-- AttachmentDetails objects that are returned by the DescribeCommunications
-- operation.
module Network.AWS.Support.V2013_04_15.DescribeAttachment
    (
    -- * Request
      DescribeAttachment
    -- ** Request constructor
    , mkDescribeAttachmentRequest
    -- ** Request lenses
    , darAttachmentId

    -- * Response
    , DescribeAttachmentResponse
    -- ** Response lenses
    , dasAttachment
    ) where

import           Network.AWS.Support.V2013_04_15.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeAttachment' request.
mkDescribeAttachmentRequest :: Text -- ^ 'darAttachmentId'
                            -> DescribeAttachment
mkDescribeAttachmentRequest p1 = DescribeAttachment
    { _darAttachmentId = p1
    }
{-# INLINE mkDescribeAttachmentRequest #-}

newtype DescribeAttachment = DescribeAttachment
    { _darAttachmentId :: Text
      -- ^ The ID of the attachment to return. Attachment IDs are returned
      -- by the DescribeCommunications operation.
    } deriving (Show, Generic)

-- | The ID of the attachment to return. Attachment IDs are returned by the
-- DescribeCommunications operation.
darAttachmentId :: Lens' DescribeAttachment (Text)
darAttachmentId = lens _darAttachmentId (\s a -> s { _darAttachmentId = a })
{-# INLINE darAttachmentId #-}

instance ToPath DescribeAttachment

instance ToQuery DescribeAttachment

instance ToHeaders DescribeAttachment

instance ToJSON DescribeAttachment

newtype DescribeAttachmentResponse = DescribeAttachmentResponse
    { _dasAttachment :: Maybe Attachment
      -- ^ The attachment content and file name.
    } deriving (Show, Generic)

-- | The attachment content and file name.
dasAttachment :: Lens' DescribeAttachmentResponse (Maybe Attachment)
dasAttachment = lens _dasAttachment (\s a -> s { _dasAttachment = a })
{-# INLINE dasAttachment #-}

instance FromJSON DescribeAttachmentResponse

instance AWSRequest DescribeAttachment where
    type Sv DescribeAttachment = Support
    type Rs DescribeAttachment = DescribeAttachmentResponse

    request = get
    response _ = jsonResponse
