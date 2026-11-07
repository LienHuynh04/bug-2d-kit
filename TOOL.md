# Tool: Muse AI Create Video — tạo clip mèo Bug trong Muse

Từ nay user **không cần làm gì ngoài gõ ý tưởng**. Gõ một dòng trong Muse,
ví dụ: *"tạo clip: Bug canh nhà lúc sen đi làm về trễ"* — Muse tự chạy toàn bộ
dây chuyền và giao clip thành phẩm ngay trong khung chat.

## Muse sẽ tự làm, theo thứ tự

1. **Viết kịch bản** từ ý tưởng (mỗi cảnh: bối cảnh / hành động / cảm xúc /
   thời lượng), lưu vào `scripts/kich-ban-XX.md` trong repo này.
2. **Vẽ ảnh tĩnh từng cảnh** theo `style/STYLE.md` + `prompts/` — kiểm tra
   từng ảnh: chân mèo không thành tay người, lông Bug xám trơn KHÔNG sọc vằn,
   đúng vòng cổ hoa xanh.
3. **Animate** thành video; trích khung kiểm tra lại (video AI hay tự đổi
   bối cảnh/lông mèo — cảnh nào trôi quá đà thì dùng ảnh tĩnh zoom chậm thay thế).
4. **Ghép hình**: dọc 1080×1920, nền giấy kem, **không chữ** trong khung.
5. **Âm thanh**: tắt hẳn tiếng gốc của video AI. Lót hiệu ứng tiếng động +
   tiếng mèo và tiếng biểu cảm **không lời** lấy từ kho `audio/` của repo này
   (do user tạo bằng ElevenLabs). Trước khi đặt tiếng biểu cảm, Muse trích
   khung hình theo từng giây để **đối chiếu biểu cảm nhân vật** rồi mới đặt
   tiếng cho khớp và phủ trọn đoạn biểu cảm. Không lời thoại, không giọng TTS.
6. **Kiểm tra & giao clip**: đo thời lượng, mức âm lượng từng cảnh, xem lại
   dải khung hình; giao file mp4 + caption trong `bug-kenh/clips-dang/`.

## Đã kiểm chứng qua sản xuất thật

- Clip 05 "Bug lúc 5h sáng" (35s) và clip 06 "Bug chùi đít trên nệm" (20.5s)
  đều đi qua đúng dây chuyền này.
- Kho `audio/`: 30 file ElevenLabs (tiếng mèo kêu, giọng nữ biểu cảm, tiếng hét
  tức giận). 3 file gần như im lặng đã được đánh dấu hỏng trong ghi chú của Muse
  (mèo #1-...001016, mèo #3-...978686, nữ #4-...851735) — đừng dùng lại.

## Phía user chỉ cần

- Có ý tưởng thì gõ một dòng; muốn thêm tiếng biểu cảm mới thì tạo trên
  ElevenLabs rồi push vào `audio/` như đã làm — Muse tự tải về, kiểm tra và dùng.
- Bản cài đặt của tool nằm ở Muse: `~/workspace/custom-skills/bug_video_creator/`
  (SKILL.md + skill.yaml) — file này trong repo là bản mô tả để tra cứu.
