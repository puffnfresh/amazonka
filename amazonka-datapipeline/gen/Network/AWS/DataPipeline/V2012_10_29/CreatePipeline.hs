{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.DataPipeline.V2012_10_29.CreatePipeline
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a new empty pipeline. When this action succeeds, you can then use
-- the PutPipelineDefinition action to populate the pipeline. POST / HTTP/1.1
-- Content-Type: application/x-amz-json-1.1 X-Amz-Target:
-- DataPipeline.CreatePipeline Content-Length: 91 Host:
-- datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 17:49:52
-- GMT Authorization: AuthParams {"name": "myPipeline", "uniqueId":
-- "123456789", "description": "This is my first pipeline"} HTTP/1.1 200
-- x-amzn-RequestId: b16911ce-0774-11e2-af6f-6bc7a6be60d9 Content-Type:
-- application/x-amz-json-1.1 Content-Length: 40 Date: Mon, 12 Nov 2012
-- 17:50:53 GMT {"pipelineId": "df-06372391ZG65EXAMPLE"}.
module Network.AWS.DataPipeline.V2012_10_29.CreatePipeline
    (
    -- * Request
      CreatePipeline
    -- ** Request constructor
    , mkCreatePipelineInput
    -- ** Request lenses
    , cpiName
    , cpiUniqueId
    , cpiDescription

    -- * Response
    , CreatePipelineResponse
    -- ** Response lenses
    , cpoPipelineId
    ) where

import           Network.AWS.DataPipeline.V2012_10_29.Types
import           Network.AWS.Prelude
import           Network.AWS.Request.JSON
import qualified Network.AWS.Types.Map    as Map

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CreatePipeline' request.
mkCreatePipelineInput :: Text -- ^ 'cpiName'
                      -> Text -- ^ 'cpiUniqueId'
                      -> CreatePipeline
mkCreatePipelineInput p1 p2 = CreatePipeline
    { _cpiName = p1
    , _cpiUniqueId = p2
    , _cpiDescription = Nothing
    }
{-# INLINE mkCreatePipelineInput #-}

data CreatePipeline = CreatePipeline
    { _cpiName :: Text
      -- ^ The name of the new pipeline. You can use the same name for
      -- multiple pipelines associated with your AWS account, because AWS
      -- Data Pipeline assigns each new pipeline a unique pipeline
      -- identifier.
    , _cpiUniqueId :: Text
      -- ^ A unique identifier that you specify. This identifier is not the
      -- same as the pipeline identifier assigned by AWS Data Pipeline.
      -- You are responsible for defining the format and ensuring the
      -- uniqueness of this identifier. You use this parameter to ensure
      -- idempotency during repeated calls to CreatePipeline. For example,
      -- if the first call to CreatePipeline does not return a clear
      -- success, you can pass in the same unique identifier and pipeline
      -- name combination on a subsequent call to CreatePipeline.
      -- CreatePipeline ensures that if a pipeline already exists with the
      -- same name and unique identifier, a new pipeline will not be
      -- created. Instead, you'll receive the pipeline identifier from the
      -- previous attempt. The uniqueness of the name and unique
      -- identifier combination is scoped to the AWS account or IAM user
      -- credentials.
    , _cpiDescription :: Maybe Text
      -- ^ The description of the new pipeline.
    } deriving (Show, Generic)

-- | The name of the new pipeline. You can use the same name for multiple
-- pipelines associated with your AWS account, because AWS Data Pipeline
-- assigns each new pipeline a unique pipeline identifier.
cpiName :: Lens' CreatePipeline (Text)
cpiName = lens _cpiName (\s a -> s { _cpiName = a })
{-# INLINE cpiName #-}

-- | A unique identifier that you specify. This identifier is not the same as
-- the pipeline identifier assigned by AWS Data Pipeline. You are responsible
-- for defining the format and ensuring the uniqueness of this identifier. You
-- use this parameter to ensure idempotency during repeated calls to
-- CreatePipeline. For example, if the first call to CreatePipeline does not
-- return a clear success, you can pass in the same unique identifier and
-- pipeline name combination on a subsequent call to CreatePipeline.
-- CreatePipeline ensures that if a pipeline already exists with the same name
-- and unique identifier, a new pipeline will not be created. Instead, you'll
-- receive the pipeline identifier from the previous attempt. The uniqueness
-- of the name and unique identifier combination is scoped to the AWS account
-- or IAM user credentials.
cpiUniqueId :: Lens' CreatePipeline (Text)
cpiUniqueId = lens _cpiUniqueId (\s a -> s { _cpiUniqueId = a })
{-# INLINE cpiUniqueId #-}

-- | The description of the new pipeline.
cpiDescription :: Lens' CreatePipeline (Maybe Text)
cpiDescription = lens _cpiDescription (\s a -> s { _cpiDescription = a })
{-# INLINE cpiDescription #-}

instance ToPath CreatePipeline

instance ToQuery CreatePipeline

instance ToHeaders CreatePipeline

instance ToJSON CreatePipeline

newtype CreatePipelineResponse = CreatePipelineResponse
    { _cpoPipelineId :: Text
      -- ^ The ID that AWS Data Pipeline assigns the newly created pipeline.
      -- The ID is a string of the form: df-06372391ZG65EXAMPLE.
    } deriving (Show, Generic)

-- | The ID that AWS Data Pipeline assigns the newly created pipeline. The ID is
-- a string of the form: df-06372391ZG65EXAMPLE.
cpoPipelineId :: Lens' CreatePipelineResponse (Text)
cpoPipelineId = lens _cpoPipelineId (\s a -> s { _cpoPipelineId = a })
{-# INLINE cpoPipelineId #-}

instance FromJSON CreatePipelineResponse

instance AWSRequest CreatePipeline where
    type Sv CreatePipeline = DataPipeline
    type Rs CreatePipeline = CreatePipelineResponse

    request = get
    response _ = jsonResponse
