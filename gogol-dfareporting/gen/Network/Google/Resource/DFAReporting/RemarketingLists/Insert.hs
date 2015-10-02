{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.DFAReporting.RemarketingLists.Insert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Inserts a new remarketing list.
--
-- /See:/ <https://developers.google.com/doubleclick-advertisers/reporting/ DCM/DFA Reporting And Trafficking API Reference> for @DfareportingRemarketingListsInsert@.
module Network.Google.Resource.DFAReporting.RemarketingLists.Insert
    (
    -- * REST Resource
      RemarketingListsInsertResource

    -- * Creating a Request
    , remarketingListsInsert'
    , RemarketingListsInsert'

    -- * Request Lenses
    , rliQuotaUser
    , rliPrettyPrint
    , rliUserIP
    , rliProfileId
    , rliRemarketingList
    , rliKey
    , rliOAuthToken
    , rliFields
    ) where

import           Network.Google.DFAReporting.Types
import           Network.Google.Prelude

-- | A resource alias for @DfareportingRemarketingListsInsert@ which the
-- 'RemarketingListsInsert'' request conforms to.
type RemarketingListsInsertResource =
     "userprofiles" :>
       Capture "profileId" Int64 :>
         "remarketingLists" :>
           QueryParam "quotaUser" Text :>
             QueryParam "prettyPrint" Bool :>
               QueryParam "userIp" Text :>
                 QueryParam "key" Key :>
                   QueryParam "oauth_token" OAuthToken :>
                     QueryParam "fields" Text :>
                       QueryParam "alt" AltJSON :>
                         ReqBody '[JSON] RemarketingList :>
                           Post '[JSON] RemarketingList

-- | Inserts a new remarketing list.
--
-- /See:/ 'remarketingListsInsert'' smart constructor.
data RemarketingListsInsert' = RemarketingListsInsert'
    { _rliQuotaUser       :: !(Maybe Text)
    , _rliPrettyPrint     :: !Bool
    , _rliUserIP          :: !(Maybe Text)
    , _rliProfileId       :: !Int64
    , _rliRemarketingList :: !RemarketingList
    , _rliKey             :: !(Maybe Key)
    , _rliOAuthToken      :: !(Maybe OAuthToken)
    , _rliFields          :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RemarketingListsInsert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rliQuotaUser'
--
-- * 'rliPrettyPrint'
--
-- * 'rliUserIP'
--
-- * 'rliProfileId'
--
-- * 'rliRemarketingList'
--
-- * 'rliKey'
--
-- * 'rliOAuthToken'
--
-- * 'rliFields'
remarketingListsInsert'
    :: Int64 -- ^ 'profileId'
    -> RemarketingList -- ^ 'RemarketingList'
    -> RemarketingListsInsert'
remarketingListsInsert' pRliProfileId_ pRliRemarketingList_ =
    RemarketingListsInsert'
    { _rliQuotaUser = Nothing
    , _rliPrettyPrint = True
    , _rliUserIP = Nothing
    , _rliProfileId = pRliProfileId_
    , _rliRemarketingList = pRliRemarketingList_
    , _rliKey = Nothing
    , _rliOAuthToken = Nothing
    , _rliFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
rliQuotaUser :: Lens' RemarketingListsInsert' (Maybe Text)
rliQuotaUser
  = lens _rliQuotaUser (\ s a -> s{_rliQuotaUser = a})

-- | Returns response with indentations and line breaks.
rliPrettyPrint :: Lens' RemarketingListsInsert' Bool
rliPrettyPrint
  = lens _rliPrettyPrint
      (\ s a -> s{_rliPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
rliUserIP :: Lens' RemarketingListsInsert' (Maybe Text)
rliUserIP
  = lens _rliUserIP (\ s a -> s{_rliUserIP = a})

-- | User profile ID associated with this request.
rliProfileId :: Lens' RemarketingListsInsert' Int64
rliProfileId
  = lens _rliProfileId (\ s a -> s{_rliProfileId = a})

-- | Multipart request metadata.
rliRemarketingList :: Lens' RemarketingListsInsert' RemarketingList
rliRemarketingList
  = lens _rliRemarketingList
      (\ s a -> s{_rliRemarketingList = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
rliKey :: Lens' RemarketingListsInsert' (Maybe Key)
rliKey = lens _rliKey (\ s a -> s{_rliKey = a})

-- | OAuth 2.0 token for the current user.
rliOAuthToken :: Lens' RemarketingListsInsert' (Maybe OAuthToken)
rliOAuthToken
  = lens _rliOAuthToken
      (\ s a -> s{_rliOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
rliFields :: Lens' RemarketingListsInsert' (Maybe Text)
rliFields
  = lens _rliFields (\ s a -> s{_rliFields = a})

instance GoogleAuth RemarketingListsInsert' where
        authKey = rliKey . _Just
        authToken = rliOAuthToken . _Just

instance GoogleRequest RemarketingListsInsert' where
        type Rs RemarketingListsInsert' = RemarketingList
        request = requestWithRoute defReq dFAReportingURL
        requestWithRoute r u RemarketingListsInsert'{..}
          = go _rliQuotaUser (Just _rliPrettyPrint) _rliUserIP
              _rliProfileId
              _rliKey
              _rliOAuthToken
              _rliFields
              (Just AltJSON)
              _rliRemarketingList
          where go
                  = clientWithRoute
                      (Proxy :: Proxy RemarketingListsInsertResource)
                      r
                      u