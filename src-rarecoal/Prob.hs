module Prob (runProb, ProbOpt(..)) where

import Rarecoal.Core (getProb)
import Rarecoal.ModelTemplate (getModelSpec, ModelDesc)

import Control.Error (Script, scriptIO, tryRight)

data ProbOpt = ProbOpt {
    prModelDesc :: ModelDesc,
    prBranchnames :: [String],
    prNvec :: [Int],
    prKvec :: [Int]
}

runProb :: ProbOpt -> Script ()
runProb opts = do
    modelSpec <- getModelSpec (prModelDesc opts) (prBranchnames opts)
    val <- tryRight $ getProb modelSpec (prNvec opts) False (prKvec opts)
    scriptIO $ print val
