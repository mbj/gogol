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
-- Module      : Network.Google.Resource.Directory.Members.Insert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Add user to the specified group.
--
-- /See:/ <https://developers.google.com/admin-sdk/directory/ Admin Directory API Reference> for @DirectoryMembersInsert@.
module Network.Google.Resource.Directory.Members.Insert
    (
    -- * REST Resource
      MembersInsertResource

    -- * Creating a Request
    , membersInsert'
    , MembersInsert'

    -- * Request Lenses
    , miQuotaUser
    , miPrettyPrint
    , miUserIP
    , miGroupKey
    , miKey
    , miMember
    , miOAuthToken
    , miFields
    ) where

import           Network.Google.AdminDirectory.Types
import           Network.Google.Prelude

-- | A resource alias for @DirectoryMembersInsert@ which the
-- 'MembersInsert'' request conforms to.
type MembersInsertResource =
     "groups" :>
       Capture "groupKey" Text :>
         "members" :>
           QueryParam "quotaUser" Text :>
             QueryParam "prettyPrint" Bool :>
               QueryParam "userIp" Text :>
                 QueryParam "key" Key :>
                   QueryParam "oauth_token" OAuthToken :>
                     QueryParam "fields" Text :>
                       QueryParam "alt" AltJSON :>
                         ReqBody '[JSON] Member :> Post '[JSON] Member

-- | Add user to the specified group.
--
-- /See:/ 'membersInsert'' smart constructor.
data MembersInsert' = MembersInsert'
    { _miQuotaUser   :: !(Maybe Text)
    , _miPrettyPrint :: !Bool
    , _miUserIP      :: !(Maybe Text)
    , _miGroupKey    :: !Text
    , _miKey         :: !(Maybe Key)
    , _miMember      :: !Member
    , _miOAuthToken  :: !(Maybe OAuthToken)
    , _miFields      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'MembersInsert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'miQuotaUser'
--
-- * 'miPrettyPrint'
--
-- * 'miUserIP'
--
-- * 'miGroupKey'
--
-- * 'miKey'
--
-- * 'miMember'
--
-- * 'miOAuthToken'
--
-- * 'miFields'
membersInsert'
    :: Text -- ^ 'groupKey'
    -> Member -- ^ 'Member'
    -> MembersInsert'
membersInsert' pMiGroupKey_ pMiMember_ =
    MembersInsert'
    { _miQuotaUser = Nothing
    , _miPrettyPrint = True
    , _miUserIP = Nothing
    , _miGroupKey = pMiGroupKey_
    , _miKey = Nothing
    , _miMember = pMiMember_
    , _miOAuthToken = Nothing
    , _miFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
miQuotaUser :: Lens' MembersInsert' (Maybe Text)
miQuotaUser
  = lens _miQuotaUser (\ s a -> s{_miQuotaUser = a})

-- | Returns response with indentations and line breaks.
miPrettyPrint :: Lens' MembersInsert' Bool
miPrettyPrint
  = lens _miPrettyPrint
      (\ s a -> s{_miPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
miUserIP :: Lens' MembersInsert' (Maybe Text)
miUserIP = lens _miUserIP (\ s a -> s{_miUserIP = a})

-- | Email or immutable Id of the group
miGroupKey :: Lens' MembersInsert' Text
miGroupKey
  = lens _miGroupKey (\ s a -> s{_miGroupKey = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
miKey :: Lens' MembersInsert' (Maybe Key)
miKey = lens _miKey (\ s a -> s{_miKey = a})

-- | Multipart request metadata.
miMember :: Lens' MembersInsert' Member
miMember = lens _miMember (\ s a -> s{_miMember = a})

-- | OAuth 2.0 token for the current user.
miOAuthToken :: Lens' MembersInsert' (Maybe OAuthToken)
miOAuthToken
  = lens _miOAuthToken (\ s a -> s{_miOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
miFields :: Lens' MembersInsert' (Maybe Text)
miFields = lens _miFields (\ s a -> s{_miFields = a})

instance GoogleAuth MembersInsert' where
        authKey = miKey . _Just
        authToken = miOAuthToken . _Just

instance GoogleRequest MembersInsert' where
        type Rs MembersInsert' = Member
        request = requestWithRoute defReq adminDirectoryURL
        requestWithRoute r u MembersInsert'{..}
          = go _miQuotaUser (Just _miPrettyPrint) _miUserIP
              _miGroupKey
              _miKey
              _miOAuthToken
              _miFields
              (Just AltJSON)
              _miMember
          where go
                  = clientWithRoute
                      (Proxy :: Proxy MembersInsertResource)
                      r
                      u