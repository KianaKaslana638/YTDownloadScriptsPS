# Script by Kiana's Kaheru Choco Parfait

# Gets the URL from the first element from the array $args[].
$videoURL = $args[0]

<#  Calls the yt-dlp with options specified below.

    Nomenclature of arguments and options:
    --external-downloader: 
        specifies what downloader yt-dlp will use.
    --external-downloader-args: 
        specifies what arguments yt-dlp will pass to the external downloader.
    --format bestvideo[ext=mp4]+bestaudio[ext=m4a]:
        automatically selects the best video and audio format possible. For
        video, it will automatically select the highest resoultion available in
        MP4 (which for live streams are commonly 1080p60).
    --output "%(uploader)s - %(title)s - %(upload_date)s.%(ext)s":
        Once the download process has finished, yt-dlp will rename the file
        according to the specified format.
    --no-part:
        yt-dlp will not download the video into multiple parts.
    --add-metadata:
        metadata will be embedded to the final downloaded video.
    --write-description:
        writes the video's description to a separate text file.
#>

yt-dlp `
    --external-downloader aria2c `
    --external-downloader-args `
        "--continue --split=8 --max-connection-per-server=8 --min-split-size=1M"`
    --format bestvideo[ext=mp4]+bestaudio[ext=m4a] `
    --output "%(uploader)s - %(title)s - %(upload_date)s.%(ext)s" `
    --no-part `
    --add-metadata `
    --write-description $videoURL