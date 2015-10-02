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
-- Module      : Network.Google.Resource.Gmail.Users.Messages.Import
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Imports a message into only this user\'s mailbox, with standard email
-- delivery scanning and classification similar to receiving via SMTP. Does
-- not send a message.
--
-- /See:/ <https://developers.google.com/gmail/api/ Gmail API Reference> for @GmailUsersMessagesImport@.
module Network.Google.Resource.Gmail.Users.Messages.Import
    (
    -- * REST Resource
      UsersMessagesImportResource

    -- * Creating a Request
    , usersMessagesImport'
    , UsersMessagesImport'

    -- * Request Lenses
    , uQuotaUser
    , uPrettyPrint
    , uUserIP
    , uUserId
    , uMedia
    , uKey
    , uProcessForCalendar
    , uDeleted
    , uNeverMarkSpam
    , uOAuthToken
    , uMessage
    , uInternalDateSource
    , uFields
    ) where

import           Network.Google.Gmail.Types
import           Network.Google.Prelude

-- | A resource alias for @GmailUsersMessagesImport@ which the
-- 'UsersMessagesImport'' request conforms to.
type UsersMessagesImportResource =
     Capture "userId" Text :>
       "messages" :>
         "import" :>
           QueryParam "quotaUser" Text :>
             QueryParam "prettyPrint" Bool :>
               QueryParam "userIp" Text :>
                 QueryParam "key" Key :>
                   QueryParam "processForCalendar" Bool :>
                     QueryParam "deleted" Bool :>
                       QueryParam "neverMarkSpam" Bool :>
                         QueryParam "oauth_token" OAuthToken :>
                           QueryParam "internalDateSource"
                             GmailUsersMessagesImportInternalDateSource
                             :>
                             QueryParam "fields" Text :>
                               QueryParam "alt" AltJSON :>
                                 MultipartRelated '[JSON] Message Body :>
                                   Post '[JSON] Message

-- | Imports a message into only this user\'s mailbox, with standard email
-- delivery scanning and classification similar to receiving via SMTP. Does
-- not send a message.
--
-- /See:/ 'usersMessagesImport'' smart constructor.
data UsersMessagesImport' = UsersMessagesImport'
    { _uQuotaUser          :: !(Maybe Text)
    , _uPrettyPrint        :: !Bool
    , _uUserIP             :: !(Maybe Text)
    , _uUserId             :: !Text
    , _uMedia              :: !Body
    , _uKey                :: !(Maybe Key)
    , _uProcessForCalendar :: !Bool
    , _uDeleted            :: !Bool
    , _uNeverMarkSpam      :: !Bool
    , _uOAuthToken         :: !(Maybe OAuthToken)
    , _uMessage            :: !Message
    , _uInternalDateSource :: !GmailUsersMessagesImportInternalDateSource
    , _uFields             :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UsersMessagesImport'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uQuotaUser'
--
-- * 'uPrettyPrint'
--
-- * 'uUserIP'
--
-- * 'uUserId'
--
-- * 'uMedia'
--
-- * 'uKey'
--
-- * 'uProcessForCalendar'
--
-- * 'uDeleted'
--
-- * 'uNeverMarkSpam'
--
-- * 'uOAuthToken'
--
-- * 'uMessage'
--
-- * 'uInternalDateSource'
--
-- * 'uFields'
usersMessagesImport'
    :: Text -- ^ 'media'
    -> Body -- ^ 'Message'
    -> Message
    -> UsersMessagesImport'
usersMessagesImport' pUUserId_ pUMedia_ pUMessage_ =
    UsersMessagesImport'
    { _uQuotaUser = Nothing
    , _uPrettyPrint = True
    , _uUserIP = Nothing
    , _uUserId = pUUserId_
    , _uMedia = pUMedia_
    , _uKey = Nothing
    , _uProcessForCalendar = False
    , _uDeleted = False
    , _uNeverMarkSpam = False
    , _uOAuthToken = Nothing
    , _uMessage = pUMessage_
    , _uInternalDateSource = GUMIIDSDateHeader
    , _uFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
uQuotaUser :: Lens' UsersMessagesImport' (Maybe Text)
uQuotaUser
  = lens _uQuotaUser (\ s a -> s{_uQuotaUser = a})

-- | Returns response with indentations and line breaks.
uPrettyPrint :: Lens' UsersMessagesImport' Bool
uPrettyPrint
  = lens _uPrettyPrint (\ s a -> s{_uPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
uUserIP :: Lens' UsersMessagesImport' (Maybe Text)
uUserIP = lens _uUserIP (\ s a -> s{_uUserIP = a})

-- | The user\'s email address. The special value me can be used to indicate
-- the authenticated user.
uUserId :: Lens' UsersMessagesImport' Text
uUserId = lens _uUserId (\ s a -> s{_uUserId = a})

uMedia :: Lens' UsersMessagesImport' Body
uMedia = lens _uMedia (\ s a -> s{_uMedia = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
uKey :: Lens' UsersMessagesImport' (Maybe Key)
uKey = lens _uKey (\ s a -> s{_uKey = a})

-- | Process calendar invites in the email and add any extracted meetings to
-- the Google Calendar for this user.
uProcessForCalendar :: Lens' UsersMessagesImport' Bool
uProcessForCalendar
  = lens _uProcessForCalendar
      (\ s a -> s{_uProcessForCalendar = a})

-- | Mark the email as permanently deleted (not TRASH) and only visible in
-- Google Apps Vault to a Vault administrator. Only used for Google Apps
-- for Work accounts.
uDeleted :: Lens' UsersMessagesImport' Bool
uDeleted = lens _uDeleted (\ s a -> s{_uDeleted = a})

-- | Ignore the Gmail spam classifier decision and never mark this email as
-- SPAM in the mailbox.
uNeverMarkSpam :: Lens' UsersMessagesImport' Bool
uNeverMarkSpam
  = lens _uNeverMarkSpam
      (\ s a -> s{_uNeverMarkSpam = a})

-- | OAuth 2.0 token for the current user.
uOAuthToken :: Lens' UsersMessagesImport' (Maybe OAuthToken)
uOAuthToken
  = lens _uOAuthToken (\ s a -> s{_uOAuthToken = a})

-- | Multipart request metadata.
uMessage :: Lens' UsersMessagesImport' Message
uMessage = lens _uMessage (\ s a -> s{_uMessage = a})

-- | Source for Gmail\'s internal date of the message.
uInternalDateSource :: Lens' UsersMessagesImport' GmailUsersMessagesImportInternalDateSource
uInternalDateSource
  = lens _uInternalDateSource
      (\ s a -> s{_uInternalDateSource = a})

-- | Selector specifying which fields to include in a partial response.
uFields :: Lens' UsersMessagesImport' (Maybe Text)
uFields = lens _uFields (\ s a -> s{_uFields = a})

instance GoogleAuth UsersMessagesImport' where
        authKey = uKey . _Just
        authToken = uOAuthToken . _Just

instance GoogleRequest UsersMessagesImport' where
        type Rs UsersMessagesImport' = Message
        request = requestWithRoute defReq gmailURL
        requestWithRoute r u UsersMessagesImport'{..}
          = go _uQuotaUser (Just _uPrettyPrint) _uUserIP
              _uUserId
              _uMedia
              _uKey
              (Just _uProcessForCalendar)
              (Just _uDeleted)
              (Just _uNeverMarkSpam)
              _uOAuthToken
              (Just _uInternalDateSource)
              _uFields
              (Just AltJSON)
              _uMessage
          where go
                  = clientWithRoute
                      (Proxy :: Proxy UsersMessagesImportResource)
                      r
                      u