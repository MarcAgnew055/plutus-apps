module Evaluation.Constant.Success
    ( test_applyBuiltinNameSuccess
    ) where

import           Language.PlutusCore.Constant
import           Language.PlutusCore.Generators
import           PlutusPrelude

import           Evaluation.Constant.Apply

import qualified Data.ByteString.Lazy           as BSL
import           Test.Tasty
import           Test.Tasty.Hedgehog

test_applyBuiltinNameSuccess :: TestTree
test_applyBuiltinNameSuccess =
    testGroup "applyBuiltinNameSuccess"
        [ test_typedAddIntegerSuccess
        , test_typedSubtractIntegerSuccess
        , test_typedMultiplyIntegerSuccess
        , test_typedDivideIntegerSuccess
        , test_typedQuotientIntegerSuccess
        , test_typedModIntegerSuccess
        , test_typedRemainderIntegerSuccess
        , test_typedLessThanIntegerSuccess
        , test_typedLessThanEqIntegerSuccess
        , test_typedGreaterThanIntegerSuccess
        , test_typedGreaterThanEqIntegerSuccess
        , test_typedEqIntegerSuccess
        , test_typedConcatenateSuccess
        , test_typedTakeByteStringSuccess
        , test_typedDropByteStringSuccess
        , test_typedEqByteStringSuccess
        ]

test_typedAddIntegerSuccess :: TestTree
test_typedAddIntegerSuccess
    = testProperty "typedAddInteger"
    $ prop_applyBuiltinNameSuccess typedAddInteger (+)
    $ genTypedBuiltinSum

test_typedSubtractIntegerSuccess :: TestTree
test_typedSubtractIntegerSuccess
    = testProperty "typedSubtractInteger"
    $ prop_applyBuiltinNameSuccess typedSubtractInteger (-)
    $ genTypedBuiltinSum

test_typedMultiplyIntegerSuccess :: TestTree
test_typedMultiplyIntegerSuccess
    = testProperty "typedMultiplyInteger"
    $ prop_applyBuiltinNameSuccess typedMultiplyInteger (*)
    $ genTypedBuiltinMultiply

test_typedDivideIntegerSuccess :: TestTree
test_typedDivideIntegerSuccess
    = testProperty "typedDivideInteger"
    $ prop_applyBuiltinNameSuccess typedDivideInteger div
    $ genTypedBuiltinDivide

test_typedQuotientIntegerSuccess :: TestTree
test_typedQuotientIntegerSuccess =
    testProperty "typedQuotientInteger"
    $ prop_applyBuiltinNameSuccess typedQuotientInteger quot
    $ genTypedBuiltinDivide

test_typedModIntegerSuccess :: TestTree
test_typedModIntegerSuccess
    = testProperty "typedModInteger"
    $ prop_applyBuiltinNameSuccess typedModInteger mod
    $ genTypedBuiltinDivide

test_typedRemainderIntegerSuccess :: TestTree
test_typedRemainderIntegerSuccess
    = testProperty "typedRemainderInteger"
    $ prop_applyBuiltinNameSuccess typedRemainderInteger rem
    $ genTypedBuiltinDivide

test_typedLessThanIntegerSuccess :: TestTree
test_typedLessThanIntegerSuccess
    = testProperty "typedLessThanInteger"
    $ prop_applyBuiltinNameSuccess typedLessThanInteger (<)
    $ genTypedBuiltinDef

test_typedLessThanEqIntegerSuccess :: TestTree
test_typedLessThanEqIntegerSuccess
    = testProperty "typedLessThanEqInteger"
    $ prop_applyBuiltinNameSuccess typedLessThanEqInteger (<=)
    $ genTypedBuiltinDef

test_typedGreaterThanIntegerSuccess :: TestTree
test_typedGreaterThanIntegerSuccess
    = testProperty "typedGreaterThanInteger"
    $ prop_applyBuiltinNameSuccess typedGreaterThanInteger (>)
    $ genTypedBuiltinDef

test_typedGreaterThanEqIntegerSuccess :: TestTree
test_typedGreaterThanEqIntegerSuccess
    = testProperty "typedGreaterThanEqInteger"
    $ prop_applyBuiltinNameSuccess typedGreaterThanEqInteger (>=)
    $ genTypedBuiltinDef

test_typedEqIntegerSuccess :: TestTree
test_typedEqIntegerSuccess
    = testProperty "typedEqInteger"
    $ prop_applyBuiltinNameSuccess typedEqInteger (==)
    $ genTypedBuiltinDef

test_typedConcatenateSuccess :: TestTree
test_typedConcatenateSuccess
    = testProperty "typedConcatenate"
    $ prop_applyBuiltinNameSuccess typedConcatenate (<>)
    $ genTypedBuiltinConcatenate

test_typedTakeByteStringSuccess :: TestTree
test_typedTakeByteStringSuccess
    = testProperty "typedTakeByteString"
    $ prop_applyBuiltinNameSuccess typedTakeByteString (BSL.take . fromIntegral)
    $ genTypedBuiltinDef

test_typedDropByteStringSuccess :: TestTree
test_typedDropByteStringSuccess
    = testProperty "typedDropByteString"
    $ prop_applyBuiltinNameSuccess typedDropByteString (BSL.drop . fromIntegral)
    $ genTypedBuiltinDef

test_typedEqByteStringSuccess :: TestTree
test_typedEqByteStringSuccess
    = testProperty "typedEqByteString"
    $ prop_applyBuiltinNameSuccess typedEqByteString (==)
    $ genTypedBuiltinDef
