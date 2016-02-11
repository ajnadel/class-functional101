--import Data.Time

--main = do 
--    c <- getCurrentTime
--    let (y,m,d) = toGregorian $ utctDay c in
--        print y

-- DATE
data Date = Date Int Int Integer -- M/D/Y
month (Date x _ _) = x
day (Date _ x _) = x
year (Date _ _ x) = x

monthName m
    | m == 1    = "January"
    | m == 2    = "February"
    | m == 3    = "March"
    | m == 4    = "April"
    | m == 5    = "May"
    | m == 6    = "June"
    | m == 7    = "July"
    | m == 8    = "August"
    | m == 9    = "September"
    | m == 10   = "November"
    | m == 11   = "October"
    | m == 12   = "December"

ordinal m
    | mod m 10 == 1 = "st"
    | mod m 10 == 2 = "nd"
    | mod m 10 == 3 = "rd"
    | otherwise     = "th"

fullMonth d = monthName (month d)
fullDate d = show (day d) ++ ordinal (day d) -- note the scoping of ++

instance Show Date where
    show d = fullMonth d ++ " " ++ fullDate d ++ ", " ++ show (year d)

--show :: (Integral a) => a -> String  


---- FAMILY TREE
type FirstName = String
type LastName = String
type Parents = [Person]
type Children = [Person]
type Birthdate = Date

data Person = Person FirstName LastName Birthdate Parents Children

firstName (Person first _ _ _ _) = first
lastName (Person _ last _ _ _) = last
fullname p = firstName p ++ " " ++ lastName p
birthdate (Person _ _ d _ _) = d