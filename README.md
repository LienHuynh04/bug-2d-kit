# Bug 2D Kit — Bộ nhớ style vẽ của kênh @buglaconmeo

Repo này lưu **style vẽ tối giản của Bug** để sau này chỉ cần gửi **kịch bản**,
Muse tự vẽ ra clip mới đúng style, đúng nhân vật, không phải mò lại từ đầu.

## Cách dùng (quy trình chuẩn)

1. User gửi kịch bản theo đúng mẫu trong `scripts/` (xem `scripts/kich-ban-mau-05.md`):
   mỗi cảnh gồm **bối cảnh + hành động + cảm xúc + thời lượng**.
2. Muse đọc `style/STYLE.md` + ảnh mẫu trong `style/refs/` và `style/scenes/`,
   dùng khung prompt trong `prompts/` để vẽ tĩnh từng cảnh.
3. Muse animate từng ảnh tĩnh thành video 10s, **kiểm tra khung hình** (đặc biệt là chân/tay mèo).
4. Ghép bằng `tools/assemble.sh` (chuẩn hoá 1080×1920, nền kem, nối cảnh).
5. Giao clip thành phẩm trong `clips/` (bản local) + caption chỉ gồm hashtag.

## Cấu trúc

- `style/STYLE.md` — luật style bất biến (nét vẽ, màu, nhân vật, điều cấm).
- `style/refs/` — ảnh mẫu nhân vật: Bug thật + khung mẫu Bug & sen.
- `style/scenes/` — các khung cảnh đã duyệt, dùng làm mẫu bố cục cho cảnh tương tự.
- `prompts/` — khung prompt vẽ ảnh tĩnh và animate, đã chèn sẵn luật style.
- `scripts/` — kịch bản theo mẫu chuẩn; mỗi clip một file.
- `tools/assemble.sh` — script ghép các video cảnh thành clip dọc hoàn chỉnh.
- `clips/` — ghi chú các clip đã sản xuất (file video nặng lưu ở workspace `bug-kenh/clips-dang/`).

## Nguyên tắc vàng (rút ra từ clip 05)

- **Báo lỗi thì chỉ sửa đúng lỗi đó** — không đổi bố cục, tâm trạng, âm thanh của cảnh.
- Clip mặc định **không chữ** trong khung hình; caption chỉ để hashtag.
- Mèo là nhân vật gốc Bug — chỉ học *định dạng/không khí* của clip mẫu trên mạng,
  không sao chép nhân vật hay nét vẽ của kênh khác.
