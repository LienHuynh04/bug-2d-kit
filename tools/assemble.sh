#!/usr/bin/env bash
# assemble.sh — Ghép các video cảnh (AI, 10s) thành 1 clip dọc hoàn chỉnh theo style kit.
# Cách dùng:
#   bash assemble.sh output.mp4 "scene1.mp4:0.5:6.5" "scene2.mp4:0.5:5" ...
# Mỗi cảnh khai báo dạng: file:giây_bắt_đầu:thời_lượng_lấy
# Tuỳ chọn: BEEP_AT=5 BEEP_VOL=0.18 bash assemble.sh ...  (tiếng tít tại mốc giây BEEP_AT)
set -euo pipefail

OUT="${1:?Thiếu tên file output}"; shift
CREAM="0xf6f0e1"
BASE="scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2:color=${CREAM},setsar=1,fps=30,format=yuv420p"
TMP="$(mktemp -d)"
LIST="$TMP/list.txt"; : > "$LIST"

i=0
for spec in "$@"; do
  IFS=':' read -r f ss dur <<< "$spec"
  seg="$TMP/seg$i.mp4"
  ffmpeg -y -v error -ss "$ss" -i "$f" \
    -filter_complex "[0:v]${BASE}[v];[0:a]atrim=0:${dur},asetpts=PTS-STARTPTS,volume=0.9[a]" \
    -map "[v]" -map "[a]" -t "$dur" \
    -c:v libx264 -preset medium -crf 20 -c:a aac -ar 44100 -ac 2 "$seg"
  echo "file '$seg'" >> "$LIST"
  i=$((i+1))
done

if [ -n "${BEEP_AT:-}" ]; then
  ffmpeg -y -v error -f concat -safe 0 -i "$LIST" \
    -f lavfi -i "sine=frequency=880:duration=0.6" \
    -filter_complex "[1:a]adelay=${BEEP_AT}000|${BEEP_AT}000,volume=${BEEP_VOL:-0.18}[beep];[0:a][beep]amix=inputs=2:duration=first:dropout_transition=0[a]" \
    -map 0:v -map "[a]" -c:v copy -c:a aac -b:a 160k "$OUT"
else
  ffmpeg -y -v error -f concat -safe 0 -i "$LIST" -c copy "$OUT"
fi

echo "Xong: $OUT"
ffprobe -v error -show_entries format=duration,size \
  -show_entries stream=width,height,codec_type -of default=noprint_wrappers=1 "$OUT"
