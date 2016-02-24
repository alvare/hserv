-- File: Main.hs
-- Copyright rejuvyesh <mail@rejuvyesh.com>, 2014

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings  #-}
module Main where

import           Network.Wai.Application.Static       (defaultFileServerSettings,
                                                       staticApp, ssAddTrailingSlash)
import           Network.Wai.Handler.Warp             (run)
import           Network.Wai.Middleware.RequestLogger (logStdoutDev)
import           Paths_hserv                          (version)
import           Data.Version                         (showVersion)
import           System.Console.CmdArgs               (Data, Typeable, cmdArgs, help,
                                                       opt, summary, (&=))

data Hserv = Hserv
             { port :: Int
             , verbose :: Bool
             , dir :: FilePath
             }
             deriving (Data, Typeable)

main :: IO()
main = do
  hserv <- cmdArgs $ Hserv
           { port = 8888 &= help "Port on which server should run"
           , verbose = False &= help "Log each request"
           , dir = "." &= help "Path to serve" }
           &= summary ("hserv " ++ showVersion version)
  let Hserv {port=port', verbose=verbose', dir=dir'} = hserv
  let middleware = if verbose' then logStdoutDev else id
  putStrLn $ "Running hserv on port " ++ (show port')
  putStrLn $ "Go to http://0.0.0.0:" ++ (show port')
  run port' $ middleware $ staticApp
            $ (defaultFileServerSettings dir') {ssAddTrailingSlash = True}

