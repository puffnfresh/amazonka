{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ElasticBeanstalk.V2010_12_01.DeleteApplicationVersion
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified version from the specified application. You cannot
-- delete an application version that is associated with a running
-- environment.
-- https://elasticbeanstalk.us-east-1.amazon.com/?ApplicationName=SampleApp
-- &VersionLabel=First%20Release &Operation=DeleteApplicationVersion
-- &AuthParams 58dc7339-f272-11df-8a78-9f77047e0d0c.
module Network.AWS.ElasticBeanstalk.V2010_12_01.DeleteApplicationVersion
    (
    -- * Request
      DeleteApplicationVersion
    -- ** Request constructor
    , mkDeleteApplicationVersionMessage
    -- ** Request lenses
    , davmApplicationName
    , davmVersionLabel
    , davmDeleteSourceBundle

    -- * Response
    , DeleteApplicationVersionResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.ElasticBeanstalk.V2010_12_01.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteApplicationVersion' request.
mkDeleteApplicationVersionMessage :: Text -- ^ 'davmApplicationName'
                                  -> Text -- ^ 'davmVersionLabel'
                                  -> DeleteApplicationVersion
mkDeleteApplicationVersionMessage p1 p2 = DeleteApplicationVersion
    { _davmApplicationName = p1
    , _davmVersionLabel = p2
    , _davmDeleteSourceBundle = Nothing
    }
{-# INLINE mkDeleteApplicationVersionMessage #-}

data DeleteApplicationVersion = DeleteApplicationVersion
    { _davmApplicationName :: Text
      -- ^ The name of the application to delete releases from.
    , _davmVersionLabel :: Text
      -- ^ The label of the version to delete.
    , _davmDeleteSourceBundle :: Maybe Bool
      -- ^ Indicates whether to delete the associated source bundle from
      -- Amazon S3: true: An attempt is made to delete the associated
      -- Amazon S3 source bundle specified at time of creation. false: No
      -- action is taken on the Amazon S3 source bundle specified at time
      -- of creation. Valid Values: true | false.
    } deriving (Show, Generic)

-- | The name of the application to delete releases from.
davmApplicationName :: Lens' DeleteApplicationVersion (Text)
davmApplicationName = lens _davmApplicationName (\s a -> s { _davmApplicationName = a })
{-# INLINE davmApplicationName #-}

-- | The label of the version to delete.
davmVersionLabel :: Lens' DeleteApplicationVersion (Text)
davmVersionLabel = lens _davmVersionLabel (\s a -> s { _davmVersionLabel = a })
{-# INLINE davmVersionLabel #-}

-- | Indicates whether to delete the associated source bundle from Amazon S3:
-- true: An attempt is made to delete the associated Amazon S3 source bundle
-- specified at time of creation. false: No action is taken on the Amazon S3
-- source bundle specified at time of creation. Valid Values: true | false.
davmDeleteSourceBundle :: Lens' DeleteApplicationVersion (Maybe Bool)
davmDeleteSourceBundle = lens _davmDeleteSourceBundle (\s a -> s { _davmDeleteSourceBundle = a })
{-# INLINE davmDeleteSourceBundle #-}

instance ToQuery DeleteApplicationVersion where
    toQuery = genericQuery def

data DeleteApplicationVersionResponse = DeleteApplicationVersionResponse
    deriving (Eq, Show, Generic)

instance AWSRequest DeleteApplicationVersion where
    type Sv DeleteApplicationVersion = ElasticBeanstalk
    type Rs DeleteApplicationVersion = DeleteApplicationVersionResponse

    request = post "DeleteApplicationVersion"
    response _ = nullaryResponse DeleteApplicationVersionResponse
