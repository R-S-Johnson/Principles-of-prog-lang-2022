{-
sentence → noun_phrase verb_phrase [ conjunction sentence ]
noun_phrase → article [ adjective_phrase ] noun
verb_phrase → verb noun_phrase prepositional_phrase
prepositional_phrase → preposition noun_ phrase
adjective_phrase → adjective [ adjective_phrase ]
-}

module Generator where
import MyRandom (randomInt, pickRandom, probability)

-- vars --
nouns :: [String]
nouns = ["boy", "girl", "dog", "cat", "table", "chair", "cake"]
verbs :: [String]
verbs = ["hit", "threw", "pushed", "jumped", "ate", "spun"]
articles :: [String]
articles = ["a", "the"]
conjunctions :: [String]
conjunctions = ["for", "and", "nor", "but", "or", "yet", "so"]
prepositions :: [String]
prepositions = ["with", "to", "from", "on", "below", "above", "beside"]
adjectives :: [String]
adjectives = ["big", "small", "short", "tall", "red", "blue", "yellow", "green"]


-- functions --
sentence :: IO String
sentence = do
    nPhrase <- noun_phrase
    vPhrase <- verb_phrase
    prob <- probability .25
    if prob then do
        conj <- pickRandom conjunctions
        sent <- sentence
        return (nPhrase ++ " " ++ vPhrase ++ " " ++ conj ++ " " ++ sent)
    else do
        return (nPhrase ++ " " ++ vPhrase)

noun_phrase :: IO String
noun_phrase = do
    art <- pickRandom articles
    noun <- pickRandom nouns
    prob <- probability .25
    if prob then do
        aPhrase <- adjective_phrase
        return (art ++ " " ++ aPhrase ++ " " ++ noun)
    else do
        return (art ++ " " ++ noun)

verb_phrase :: IO String
verb_phrase = do
    verb <- pickRandom verbs
    nPhrase <- noun_phrase
    pPhrase <- prepositional_phrase
    return (verb ++ " " ++ nPhrase ++ " " ++ pPhrase)

prepositional_phrase :: IO String
prepositional_phrase = do
    prep <- pickRandom prepositions
    nPhrase <- noun_phrase
    return (prep ++ " " ++ nPhrase)

adjective_phrase :: IO String
adjective_phrase = do
    adj <- pickRandom adjectives
    prob <- probability 0.25
    if prob then do
        phrase <- adjective_phrase
        return (adj ++ " " ++ phrase)
    else do
        return adj