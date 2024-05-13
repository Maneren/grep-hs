module Args where

import Options.Applicative (
  Parser,
  ParserInfo,
  execParser,
  fullDesc,
  header,
  help,
  helper,
  info,
  long,
  many,
  metavar,
  progDesc,
  short,
  strArgument,
  switch,
  (<**>),
 )

data Options = Options
  { optInput :: String
  , optPattern :: String
  , optRegex :: Bool
  , optInverted :: Bool
  }

data Sample = Sample
  { hello :: String
  , quiet :: Bool
  , enthusiasm :: Int
  }

options :: Parser Options
options =
  Options
    <$> strArgument (metavar "PATTERNS")
    <*> many (strArgument (metavar "FILE..."))
    <*> switch (long "extended-regexp" <> short 'E' <> help "Interpret PATTERNS as extended regular expressions.")
    <*> switch (long "invert-match" <> short 'v' <> help "Invert the sense of matching, to select non-matching lines.")

parseArgs :: IO Options
parseArgs = execParser opts
 where
  opts :: ParserInfo Options
  opts =
    info
      (options <**> helper)
      ( fullDesc
          <> progDesc "Print the lines in the input that match a specified pattern"
          <> header "grep - print lines matching a pattern"
      )
