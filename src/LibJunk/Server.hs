module Server(serve) where

import Network
import LibJunk.IO

serve :: Int -> (Handle -> IO()) -> IO ()
serve port action = do
    sock <- listenOn (PortNumber (toEnum port))
    accept_loop sock action

accept_loop :: Socket -> (Handle -> IO()) -> IO ()
accept_loop s action = do
  (h, _, _) <- accept s
  ignoreExns $ action h
  accept_loop s serve
