-----------------------------------------------------------------------------
--
-- Module      :  Language.PureScript.Types
-- Copyright   :  (c) Phil Freeman 2013
-- License     :  MIT
--
-- Maintainer  :  Phil Freeman <paf31@cantab.net>
-- Stability   :  experimental
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

{-# LANGUAGE DeriveDataTypeable #-}

module Language.PureScript.Types where

import Data.Data

data Type
  = TUnknown Int
  | Number
  | String
  | Boolean
  | Array Type
  | Object Row
  | Function [Type] Type
  | TypeVar String
  | TypeConstructor String
  | TypeApp Type Type
  | SaturatedTypeSynonym String [Type] deriving (Show, Eq, Data, Typeable)

data PolyType = PolyType [String] Type deriving (Show, Eq, Data, Typeable)

data Row
  = RUnknown Int
  | RowVar String
  | REmpty
  | RCons String Type Row deriving (Show, Eq, Data, Typeable)

monoType :: Type -> PolyType
monoType = PolyType []
