
local console = rconsoleprint or nil
local isfolder = isfolder
local makefolder = makefolder
local isfile = isfile
local writefile = writefile
local readfile = readfile
local delfile = delfile

local net = syn.request or httpget or http_request or requests

local version = loadstring(game:HttpGet("https://raw.githubusercontent.com/I2345/AcrusC/main/version.dat"))

if console == nil then
    game.Players.LocalPlayer:Kick("Shitty exploit lmao")
end

function MakeNewFolder(foldername)

    if not isfolder(foldername) then
        wait(.2)
        makefolder(foldername)
    end

end

function DownloadAssets(assetName, folder, url, isreDownloading)

    if isfile(folder.."/"..assetName) then
        if isreDownloading then
            delfile(folder.."/"..assetName)
        end
    end

    if not isfile(folder.."/"..assetName) then
        wait(.4)

        writefile(folder.."/"..assetName, net({
            Url = url,
            Method = "GET",
        }).Body)
    end
end
local redownload = false

if version > readfile("AcrusC/data") then

    console("Redownloading Assets! Your Version: "..readfile("AcrusC/data").." New version: "..version)
    redownload = true

end

MakeNewFolder("AcrusC")
MakeNewFolder("AcrusC/assets")
MakeNewFolder("AcrusC/assets/pictures")
MakeNewFolder("AcrusC/assets/videos")
MakeNewFolder("AcrusC/logs")
MakeNewFolder("AcrusC/Configs")
MakeNewFolder("AcrusC/data")

DownloadAssets("kissinglmao.jpg", "AcrusC/assets/pictures", "https://raw.githubusercontent.com/I2345/AcrusC/main/assets/anime.jpg", redownload)

writefile("AcrusC/data/version.dat", version)

repeat
    task.wait()
until game:IsLoaded()

local gameList = loadstring(game:HttpGet("https://raw.githubusercontent.com/I2345/AcrusC/main/gamelist.lua"))

if gameList[game.PlaceId] then

    loadstring(game:HttpGet(gameList[game.PlaceId].Script))

end


