{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ELB.V2012_06_01.DescribeLoadBalancerPolicies
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns detailed descriptions of the policies. If you specify a load
-- balancer name, the action returns the descriptions of all the policies
-- created for the load balancer. If you specify a policy name associated with
-- your load balancer, the action returns the description of that policy. If
-- you don't specify a load balancer name, the action returns descriptions of
-- the specified sample policies, or descriptions of all the sample policies.
-- The names of the sample policies have the ELBSample- prefix. Description of
-- all the policies associated with a load balancer
-- https://elasticloadbalancing.amazonaws.com/?LoadBalancerName=MyLoadBalancer
-- &Version=2012-06-01 &Action=DescribeLoadBalancerPolicies &AUTHPARAMS
-- MyDurationStickyPolicy LBCookieStickinessPolicyType CookieExpirationPeriod
-- 60 MyAppStickyPolicy AppCookieStickinessPolicyType CookieName MyAppCookie
-- 83c88b9d-12b7-11e3-8b82-87b12EXAMPLE Description of a specified policy
-- associated with the load balancer
-- https://elasticloadbalancing.amazonaws.com/?PolicyNames.member.1=EnableProxyProtocol
-- &LoadBalancerName=my-test-loadbalancer &Version=2012-06-01
-- &Action=DescribeLoadBalancerPolicies &AUTHPARAMS EnableProxyProtocol
-- ProxyProtocolPolicyType ProxyProtocol true
-- 1549581b-12b7-11e3-895e-1334aEXAMPLE.
module Network.AWS.ELB.V2012_06_01.DescribeLoadBalancerPolicies
    (
    -- * Request
      DescribeLoadBalancerPolicies
    -- ** Request constructor
    , mkDescribeLoadBalancerPoliciesInput
    -- ** Request lenses
    , dlbpjLoadBalancerName
    , dlbpjPolicyNames

    -- * Response
    , DescribeLoadBalancerPoliciesResponse
    -- ** Response lenses
    , dlbppPolicyDescriptions
    ) where

import Network.AWS.Request.Query
import Network.AWS.ELB.V2012_06_01.Types
import Network.AWS.Prelude

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeLoadBalancerPolicies' request.
mkDescribeLoadBalancerPoliciesInput :: DescribeLoadBalancerPolicies
mkDescribeLoadBalancerPoliciesInput = DescribeLoadBalancerPolicies
    { _dlbpjLoadBalancerName = Nothing
    , _dlbpjPolicyNames = mempty
    }
{-# INLINE mkDescribeLoadBalancerPoliciesInput #-}

data DescribeLoadBalancerPolicies = DescribeLoadBalancerPolicies
    { _dlbpjLoadBalancerName :: Maybe Text
      -- ^ The mnemonic name associated with the load balancer. If no name
      -- is specified, the operation returns the attributes of either all
      -- the sample policies pre-defined by Elastic Load Balancing or the
      -- specified sample polices.
    , _dlbpjPolicyNames :: [Text]
      -- ^ The names of load balancer policies you've created or Elastic
      -- Load Balancing sample policy names.
    } deriving (Show, Generic)

-- | The mnemonic name associated with the load balancer. If no name is
-- specified, the operation returns the attributes of either all the sample
-- policies pre-defined by Elastic Load Balancing or the specified sample
-- polices.
dlbpjLoadBalancerName :: Lens' DescribeLoadBalancerPolicies (Maybe Text)
dlbpjLoadBalancerName = lens _dlbpjLoadBalancerName (\s a -> s { _dlbpjLoadBalancerName = a })
{-# INLINE dlbpjLoadBalancerName #-}

-- | The names of load balancer policies you've created or Elastic Load
-- Balancing sample policy names.
dlbpjPolicyNames :: Lens' DescribeLoadBalancerPolicies ([Text])
dlbpjPolicyNames = lens _dlbpjPolicyNames (\s a -> s { _dlbpjPolicyNames = a })
{-# INLINE dlbpjPolicyNames #-}

instance ToQuery DescribeLoadBalancerPolicies where
    toQuery = genericQuery def

newtype DescribeLoadBalancerPoliciesResponse = DescribeLoadBalancerPoliciesResponse
    { _dlbppPolicyDescriptions :: [PolicyDescription]
      -- ^ A list of policy description structures.
    } deriving (Show, Generic)

-- | A list of policy description structures.
dlbppPolicyDescriptions :: Lens' DescribeLoadBalancerPoliciesResponse ([PolicyDescription])
dlbppPolicyDescriptions = lens _dlbppPolicyDescriptions (\s a -> s { _dlbppPolicyDescriptions = a })
{-# INLINE dlbppPolicyDescriptions #-}

instance FromXML DescribeLoadBalancerPoliciesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeLoadBalancerPolicies where
    type Sv DescribeLoadBalancerPolicies = ELB
    type Rs DescribeLoadBalancerPolicies = DescribeLoadBalancerPoliciesResponse

    request = post "DescribeLoadBalancerPolicies"
    response _ = xmlResponse
