--
-- Control structures mostly
--
module Monad where

import Control.Monad


doUntil :: Monad m => m Bool -> m ()
doUntil m = do
  v <- m
  if v then doUntil m else return ()

loopM :: Monad m => Int -> (a -> m a) -> a -> m a
loopM 0 _ v = return v
loopM n m v = do
  v' <- m v
  loopM (n-1) m v'
