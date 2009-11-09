module Main where
import Scanner

-- parser produced by Happy Version 1.17

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal Token
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

action_0 (9) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail

action_1 (9) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (22) = happyShift action_5
action_3 _ = happyFail

action_4 (35) = happyAccept
action_4 _ = happyFail

action_5 (23) = happyShift action_6
action_5 _ = happyFail

action_6 (15) = happyShift action_7
action_6 _ = happyFail

action_7 (12) = happyShift action_8
action_7 _ = happyFail

action_8 (13) = happyShift action_9
action_8 _ = happyFail

action_9 (14) = happyShift action_10
action_9 _ = happyFail

action_10 (30) = happyShift action_11
action_10 _ = happyFail

action_11 (11) = happyShift action_12
action_11 _ = happyFail

action_12 (26) = happyShift action_13
action_12 _ = happyFail

action_13 (27) = happyShift action_14
action_13 _ = happyFail

action_14 (22) = happyShift action_15
action_14 _ = happyFail

action_15 (31) = happyShift action_16
action_15 _ = happyFail

action_16 (23) = happyShift action_17
action_16 _ = happyFail

action_17 (10) = happyShift action_19
action_17 (17) = happyShift action_20
action_17 (18) = happyShift action_21
action_17 (19) = happyShift action_22
action_17 (21) = happyShift action_23
action_17 (22) = happyShift action_24
action_17 (30) = happyShift action_25
action_17 (34) = happyShift action_26
action_17 (6) = happyGoto action_18
action_17 _ = happyFail

action_18 (26) = happyShift action_31
action_18 (28) = happyShift action_32
action_18 (29) = happyShift action_33
action_18 (32) = happyShift action_34
action_18 (33) = happyShift action_35
action_18 _ = happyFail

action_19 (16) = happyShift action_29
action_19 (22) = happyShift action_30
action_19 _ = happyFail

action_20 _ = happyReduce_9

action_21 _ = happyReduce_10

action_22 _ = happyReduce_12

action_23 _ = happyReduce_8

action_24 _ = happyReduce_11

action_25 (10) = happyShift action_19
action_25 (17) = happyShift action_20
action_25 (18) = happyShift action_21
action_25 (19) = happyShift action_22
action_25 (21) = happyShift action_23
action_25 (22) = happyShift action_24
action_25 (30) = happyShift action_25
action_25 (34) = happyShift action_26
action_25 (6) = happyGoto action_28
action_25 _ = happyFail

action_26 (10) = happyShift action_19
action_26 (17) = happyShift action_20
action_26 (18) = happyShift action_21
action_26 (19) = happyShift action_22
action_26 (21) = happyShift action_23
action_26 (22) = happyShift action_24
action_26 (30) = happyShift action_25
action_26 (34) = happyShift action_26
action_26 (6) = happyGoto action_27
action_26 _ = happyFail

action_27 (26) = happyShift action_31
action_27 (28) = happyShift action_32
action_27 (29) = happyShift action_33
action_27 (33) = happyShift action_35
action_27 _ = happyReduce_15

action_28 (26) = happyShift action_31
action_28 (28) = happyShift action_32
action_28 (29) = happyShift action_33
action_28 (31) = happyShift action_44
action_28 (33) = happyShift action_35
action_28 _ = happyFail

action_29 (26) = happyShift action_43
action_29 _ = happyFail

action_30 (30) = happyShift action_42
action_30 _ = happyFail

action_31 (10) = happyShift action_19
action_31 (17) = happyShift action_20
action_31 (18) = happyShift action_21
action_31 (19) = happyShift action_22
action_31 (21) = happyShift action_23
action_31 (22) = happyShift action_24
action_31 (30) = happyShift action_25
action_31 (34) = happyShift action_26
action_31 (6) = happyGoto action_41
action_31 _ = happyFail

action_32 (10) = happyShift action_19
action_32 (17) = happyShift action_20
action_32 (18) = happyShift action_21
action_32 (19) = happyShift action_22
action_32 (21) = happyShift action_23
action_32 (22) = happyShift action_24
action_32 (30) = happyShift action_25
action_32 (34) = happyShift action_26
action_32 (6) = happyGoto action_40
action_32 _ = happyFail

action_33 (10) = happyShift action_19
action_33 (17) = happyShift action_20
action_33 (18) = happyShift action_21
action_33 (19) = happyShift action_22
action_33 (21) = happyShift action_23
action_33 (22) = happyShift action_24
action_33 (30) = happyShift action_25
action_33 (34) = happyShift action_26
action_33 (6) = happyGoto action_39
action_33 _ = happyFail

action_34 (24) = happyShift action_38
action_34 _ = happyFail

action_35 (20) = happyShift action_36
action_35 (22) = happyShift action_37
action_35 _ = happyFail

action_36 _ = happyReduce_6

action_37 (30) = happyShift action_49
action_37 _ = happyFail

action_38 (24) = happyShift action_48
action_38 _ = happyFail

action_39 (26) = happyShift action_31
action_39 (28) = happyShift action_32
action_39 (29) = happyShift action_33
action_39 (33) = happyShift action_35
action_39 _ = happyReduce_4

action_40 (26) = happyShift action_31
action_40 (28) = happyShift action_32
action_40 (29) = happyShift action_33
action_40 (33) = happyShift action_35
action_40 _ = happyReduce_3

action_41 (26) = happyShift action_31
action_41 (27) = happyShift action_47
action_41 (28) = happyShift action_32
action_41 (29) = happyShift action_33
action_41 (33) = happyShift action_35
action_41 _ = happyFail

action_42 (31) = happyShift action_46
action_42 _ = happyFail

action_43 (10) = happyShift action_19
action_43 (17) = happyShift action_20
action_43 (18) = happyShift action_21
action_43 (19) = happyShift action_22
action_43 (21) = happyShift action_23
action_43 (22) = happyShift action_24
action_43 (30) = happyShift action_25
action_43 (34) = happyShift action_26
action_43 (6) = happyGoto action_45
action_43 _ = happyFail

action_44 _ = happyReduce_16

action_45 (26) = happyShift action_31
action_45 (27) = happyShift action_52
action_45 (28) = happyShift action_32
action_45 (29) = happyShift action_33
action_45 (33) = happyShift action_35
action_45 _ = happyFail

action_46 _ = happyReduce_14

action_47 _ = happyReduce_5

action_48 _ = happyReduce_2

action_49 (10) = happyShift action_19
action_49 (17) = happyShift action_20
action_49 (18) = happyShift action_21
action_49 (19) = happyShift action_22
action_49 (21) = happyShift action_23
action_49 (22) = happyShift action_24
action_49 (30) = happyShift action_25
action_49 (34) = happyShift action_26
action_49 (6) = happyGoto action_50
action_49 (7) = happyGoto action_51
action_49 _ = happyReduce_19

action_50 (25) = happyShift action_55
action_50 (26) = happyShift action_31
action_50 (28) = happyShift action_32
action_50 (29) = happyShift action_33
action_50 (33) = happyShift action_35
action_50 (8) = happyGoto action_54
action_50 _ = happyReduce_17

action_51 (31) = happyShift action_53
action_51 _ = happyFail

action_52 _ = happyReduce_13

action_53 _ = happyReduce_7

action_54 _ = happyReduce_18

action_55 (10) = happyShift action_19
action_55 (17) = happyShift action_20
action_55 (18) = happyShift action_21
action_55 (19) = happyShift action_22
action_55 (21) = happyShift action_23
action_55 (22) = happyShift action_24
action_55 (30) = happyShift action_25
action_55 (34) = happyShift action_26
action_55 (6) = happyGoto action_56
action_55 _ = happyFail

action_56 (26) = happyShift action_31
action_56 (28) = happyShift action_32
action_56 (29) = happyShift action_33
action_56 (33) = happyShift action_35
action_56 _ = happyReduce_20

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happyReduce 18 5 happyReduction_2
happyReduction_2 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_15) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdent happy_var_12)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdent happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (MClass happy_var_2 happy_var_12 happy_var_15
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  6 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
	(HappyTerminal (TOp happy_var_2))
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (ExpOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  6 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_3)
	(HappyTerminal (TComOp happy_var_2))
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (ExpComOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ExpArray happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 _
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (ExpLength happy_var_1
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 6 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdent happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ExpFCall happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyTerminal (TIntLiteral happy_var_1))
	 =  HappyAbsSyn6
		 (ExpInt happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn6
		 (ExpBool True
	)

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn6
		 (ExpBool False
	)

happyReduce_11 = happySpecReduce_1  6 happyReduction_11
happyReduction_11 (HappyTerminal (TIdent happy_var_1))
	 =  HappyAbsSyn6
		 (ExpIdent happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn6
		 (ExpThis
	)

happyReduce_13 = happyReduce 5 6 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ExpNewInt happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 6 happyReduction_14
happyReduction_14 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TIdent happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ExpNewIdent happy_var_2
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_2  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (ExpNot happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (ExpExp happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (ExpListExp happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  7 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (ExpList happy_var_1 happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_0  7 happyReduction_19
happyReduction_19  =  HappyAbsSyn7
		 (ExpListEmpty
	)

happyReduce_20 = happySpecReduce_2  8 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (ExpRest happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 35 35 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TClass -> cont 9;
	TNew -> cont 10;
	TString -> cont 11;
	TStatic -> cont 12;
	TVoid -> cont 13;
	TMain -> cont 14;
	TPublic -> cont 15;
	TInt -> cont 16;
	TTrue -> cont 17;
	TFalse -> cont 18;
	TThis -> cont 19;
	TLength -> cont 20;
	TIntLiteral happy_dollar_dollar -> cont 21;
	TIdent happy_dollar_dollar -> cont 22;
	TLeftBrace -> cont 23;
	TRightBrace -> cont 24;
	TComma -> cont 25;
	TLeftBrack -> cont 26;
	TRightBrack -> cont 27;
	TOp happy_dollar_dollar -> cont 28;
	TComOp happy_dollar_dollar -> cont 29;
	TLeftParen -> cont 30;
	TRightParen -> cont 31;
	TSemiColon -> cont 32;
	TPeriod -> cont 33;
	TNot -> cont 34;
	_ -> happyError' (tk:tks)
	}

happyError_ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [Token] -> HappyIdentity a
happyError' = HappyIdentity . parseError

newl tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Program 
    = MainClass 
      deriving Show

data MainClass
    = MClass String String Exp
      deriving Show

data Exp
    = Exp String
    | ExpOp Exp Char Exp
    | ExpComOp Exp Char Exp
    | ExpArray Exp Exp -- "Exp [ Exp ]"
    | ExpFCall Exp Ident ExpList -- Exp . Ident ( ExpList )
    | ExpInt Int
    | ExpNewInt Exp
    | ExpBool Bool -- True or False
    | ExpIdent Ident
    | ExpNewIdent Ident -- new Ident ()
    | ExpExp Exp -- Exp ( Exp )
    | ExpThis
    | ExpNot Exp
    | ExpLength Exp
    deriving Show
data Op
     = And
     | LessThan
     | Plus
     | Minus
     | Times
     deriving (Show, Eq)

type Ident = String
type Integer_Literal = Int
data ExpList
    = ExpList Exp ExpRest
    | ExpListEmpty
    | ExpListExp Exp
    deriving Show
data ExpRest
    = ExpRest Exp
    deriving Show
--data Ident = Var String

--data Exp  
--      = Let String Exp Exp
--      | Exp1 Exp1
--      deriving Show

--data Exp1 
--      = Plus Exp1 Term 
--      | Minus Exp1 Term 
--      | Term Term
--      deriving Show

--data Term 
--      = Times Term Factor 
--      | Div Term Factor 
--      | Factor Factor
--      deriving Show

--data Factor 
--      = Int Int 
--      | Var String 
--      | Brack Exp
--      deriving Show


main = getContents >>= print . newl . alexScanTokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 28 "templates/GenericTemplate.hs" #-}








{-# LINE 49 "templates/GenericTemplate.hs" #-}

{-# LINE 59 "templates/GenericTemplate.hs" #-}

{-# LINE 68 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where sts1@(((st1@(HappyState (action))):(_))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where sts1@(((st1@(HappyState (action))):(_))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 253 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail  (1) tk old_st _ stk =
--	trace "failing" $ 
    	happyError_ tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 317 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
