# STYLE.md — Luật style vẽ Bug 2D tối giản (bất biến)

## Nét vẽ

- Hoạt hình vẽ tay tối giản: **nét mực nâu mảnh, hơi run** (thin wobbly brown ink outlines).
- Màu nước **phẳng, rất nhạt** (very light flat watercolor washes).
- Nền **giấy kem trống** (plain cream paper, mã đệm khi ghép: `#f6f0e1`), nhiều khoảng trống, ít chi tiết.
- Bố cục thưa: 1 ý chính mỗi khung, đồ vật chỉ vẽ đường nét tối thiểu.

## Nhân vật

### Bug (mèo chính)
- Mèo xám lông dài, nhỏ con; **ngực trắng, bàn chân trắng**.
- **Mắt vàng**, mặt nghiêm/hơi quạu dễ thương.
- **Vòng cổ hoa xanh dương nhỏ** — chi tiết nhận diện, luôn phải có.
- Ảnh gốc đối chiếu: `style/refs/bug-anh-that.jpg`.

### Sen (chủ)
- Chàng trai trẻ, tóc nâu rối, pijama xanh nhạt, **mũ ngủ tím**.

## Luật giải phẫu mèo (quan trọng — đã từng bị lỗi)

- Chân mèo **ngắn**, bàn chân **tròn đơn giản**; chân cầm đồ vật phải cong sát người,
  bàn chân tròn ôm lấy tay cầm.
- **Cấm tuyệt đối**: cánh tay dài duỗi thẳng chỉ trỏ như tay người, bàn tay, ngón tay trên mèo.
- Khi animate: khoá cứng vị trí/hình dạng chân, chân không được kéo giãn hay biến hình.

## Luật khung hình & clip

- Khung dọc 9:16, thành phẩm 1080×1920, 30fps.
- **Không chữ, không số La Mã/Ả Rập trang trí, không watermark** trong khung hình
  (ngoại lệ duy nhất: số trên đồng hồ báo thức khi kịch bản yêu cầu).
- Âm thanh: giữ tiếng nền của video AI ở mức vừa (volume 0.9); hiệu ứng thêm duy nhất
  thường dùng là tiếng tít báo thức 880Hz, 0.6s, volume 0.18, đặt tại mốc lật giờ.
  Cảnh vẽ lại **không được tự thêm giọng nói/giọng hát mới** so với bản đã duyệt.
- **Luật âm thanh (user chốt 2026-11-07): KHÔNG lời thoại và không tự chế giọng
  người bằng TTS.** Âm thanh gồm: hiệu ứng tiếng động (đào cát, nhảy, vải sột
  soạt, tít báo thức...), tiếng mèo tự nhiên (kêu meo, gừ gừ khi ngủ), và
  **hiệu ứng giọng biểu cảm KHÔNG LỜI do user tạo bằng ElevenLabs** (kho tại
  repo bug-2d-kit, thư mục audio/) — dùng đúng theo chỉ định của user từng clip.
  Khi dựng lại clip cũ, tắt hẳn track tiếng gốc của video AI rồi lót hiệu ứng từ đầu.
- Mỗi cảnh lấy 4.5–6.5 giây từ video 10s (bỏ đầu/cuối nơi AI hay biến hình).

## Điều cấm

- Không dùng asset dính IP của bên thứ ba (nhân vật game/phim, thú bông hãng khác).
- Không sao chép nhân vật/nét vẽ của kênh mẫu — Bug luôn là nhân vật vẽ riêng.
