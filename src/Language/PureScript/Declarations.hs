-----------------------------------------------------------------------------
--
-- Module      :  Language.PureScript.Declarations
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

module Language.PureScript.Declarations where

import Language.PureScript.Values
import Language.PureScript.Types
import Language.PureScript.Names
import Language.PureScript.Kinds

import qualified Data.Data as D

type Precedence = Integer

data Associativity = Infixl | Infixr deriving (Show, D.Data, D.Typeable)

data Fixity = Fixity Associativity Precedence deriving (Show, D.Data, D.Typeable)

data Declaration
  = DataDeclaration String [String] [(String, Maybe Type)]
  | TypeSynonymDeclaration String [String] Type
  | TypeDeclaration Ident PolyType
  | ValueDeclaration Ident Value
  | ExternDeclaration Ident PolyType
  | ExternDataDeclaration String Kind
  | FixityDeclaration Fixity String deriving (Show, D.Data, D.Typeable)
