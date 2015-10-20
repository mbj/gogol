{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds      #-}
{-# OPTIONS_GHC -fno-warn-unused-imports    #-}

-- |
-- Module      : Network.Google.Resource.Genomics.Callsets.Delete
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes a call set.
--
-- /See:/ < Genomics API Reference> for @genomics.callsets.delete@.
module Network.Google.Resource.Genomics.Callsets.Delete
    (
    -- * REST Resource
      CallsetsDeleteResource

    -- * Creating a Request
    , callsetsDelete
    , CallsetsDelete

    -- * Request Lenses
    , cdXgafv
    , cdUploadProtocol
    , cdPp
    , cdAccessToken
    , cdUploadType
    , cdBearerToken
    , cdCallSetId
    , cdCallback
    ) where

import           Network.Google.Genomics.Types
import           Network.Google.Prelude

-- | A resource alias for @genomics.callsets.delete@ method which the
-- 'CallsetsDelete' request conforms to.
type CallsetsDeleteResource =
     "v1" :>
       "callsets" :>
         Capture "callSetId" Text :>
           QueryParam "$.xgafv" Text :>
             QueryParam "upload_protocol" Text :>
               QueryParam "pp" Bool :>
                 QueryParam "access_token" Text :>
                   QueryParam "uploadType" Text :>
                     QueryParam "bearer_token" Text :>
                       QueryParam "callback" Text :>
                         QueryParam "alt" AltJSON :> Delete '[JSON] Empty

-- | Deletes a call set.
--
-- /See:/ 'callsetsDelete' smart constructor.
data CallsetsDelete = CallsetsDelete
    { _cdXgafv          :: !(Maybe Text)
    , _cdUploadProtocol :: !(Maybe Text)
    , _cdPp             :: !Bool
    , _cdAccessToken    :: !(Maybe Text)
    , _cdUploadType     :: !(Maybe Text)
    , _cdBearerToken    :: !(Maybe Text)
    , _cdCallSetId      :: !Text
    , _cdCallback       :: !(Maybe Text)
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | Creates a value of 'CallsetsDelete' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cdXgafv'
--
-- * 'cdUploadProtocol'
--
-- * 'cdPp'
--
-- * 'cdAccessToken'
--
-- * 'cdUploadType'
--
-- * 'cdBearerToken'
--
-- * 'cdCallSetId'
--
-- * 'cdCallback'
callsetsDelete
    :: Text -- ^ 'cdCallSetId'
    -> CallsetsDelete
callsetsDelete pCdCallSetId_ =
    CallsetsDelete
    { _cdXgafv = Nothing
    , _cdUploadProtocol = Nothing
    , _cdPp = True
    , _cdAccessToken = Nothing
    , _cdUploadType = Nothing
    , _cdBearerToken = Nothing
    , _cdCallSetId = pCdCallSetId_
    , _cdCallback = Nothing
    }

-- | V1 error format.
cdXgafv :: Lens' CallsetsDelete (Maybe Text)
cdXgafv = lens _cdXgafv (\ s a -> s{_cdXgafv = a})

-- | Upload protocol for media (e.g. \"raw\", \"multipart\").
cdUploadProtocol :: Lens' CallsetsDelete (Maybe Text)
cdUploadProtocol
  = lens _cdUploadProtocol
      (\ s a -> s{_cdUploadProtocol = a})

-- | Pretty-print response.
cdPp :: Lens' CallsetsDelete Bool
cdPp = lens _cdPp (\ s a -> s{_cdPp = a})

-- | OAuth access token.
cdAccessToken :: Lens' CallsetsDelete (Maybe Text)
cdAccessToken
  = lens _cdAccessToken
      (\ s a -> s{_cdAccessToken = a})

-- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
cdUploadType :: Lens' CallsetsDelete (Maybe Text)
cdUploadType
  = lens _cdUploadType (\ s a -> s{_cdUploadType = a})

-- | OAuth bearer token.
cdBearerToken :: Lens' CallsetsDelete (Maybe Text)
cdBearerToken
  = lens _cdBearerToken
      (\ s a -> s{_cdBearerToken = a})

-- | The ID of the call set to be deleted.
cdCallSetId :: Lens' CallsetsDelete Text
cdCallSetId
  = lens _cdCallSetId (\ s a -> s{_cdCallSetId = a})

-- | JSONP
cdCallback :: Lens' CallsetsDelete (Maybe Text)
cdCallback
  = lens _cdCallback (\ s a -> s{_cdCallback = a})

instance GoogleRequest CallsetsDelete where
        type Rs CallsetsDelete = Empty
        requestClient CallsetsDelete{..}
          = go _cdCallSetId _cdXgafv _cdUploadProtocol
              (Just _cdPp)
              _cdAccessToken
              _cdUploadType
              _cdBearerToken
              _cdCallback
              (Just AltJSON)
              genomicsService
          where go
                  = buildClient (Proxy :: Proxy CallsetsDeleteResource)
                      mempty
