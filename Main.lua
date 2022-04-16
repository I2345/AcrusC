
local console = rconsoleprint or nil
local isfolder = isfolder
local makefolder = makefolder
local isfile = isfile
local writefile = writefile
local readfile = readfile
local delfile = delfile

local net = syn.request or httpget or http_request or requests

local version = 1

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

MakeNewFolder("AcrusC")
MakeNewFolder("AcrusC/assets")
MakeNewFolder("AcrusC/assets/pictures")
MakeNewFolder("AcrusC/assets/videos")
MakeNewFolder("AcrusC/logs")
MakeNewFolder("AcrusC/Configs")
MakeNewFolder("AcrusC/data")

if isfile("AcrusC/data/version.dat") then
    if tostring(version) > readfile("AcrusC/data/version.dat") then

        console("Redownloading Assets! Your Version: "..readfile("AcrusC/data/version.dat").." New version: "..version)
        redownload = true
    
    end
else
    console("Redownloading Assets! Your Version: "..tostring("N.A").." New version: "..version)
    redownload = true
end
writefile("AcrusC/data/version.dat", version)

DownloadAssets("kissinglmao.jpg", "AcrusC/assets/pictures", "https://raw.githubusercontent.com/I2345/AcrusC/main/assets/anime.jpg", redownload)

repeat
    task.wait()
until game:IsLoaded()

if game.PlaceId == 6870736769 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/I2345/AcrusC/main/scripts/Day%20Break.lua"))()
end



