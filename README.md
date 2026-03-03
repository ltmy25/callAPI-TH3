# Báo cáo Thực hành 3 (TH3) - Flutter Networking

## Thông tin sinh viên
- **Họ và tên:** Lô Trà My
- **Mã sinh viên:** 2351060469
- **Chủ đề:** Gọi dữ liệu từ mạng (Public API) - Xử lý Loading & Error UI

## 1. Nguồn dữ liệu & Công nghệ sử dụng
- **Public API:** [Fake Store API](https://fakestoreapi.com/products) - Cung cấp danh sách sản phẩm thực tế (Tiêu đề, giá, mô tả, hình ảnh).
- **Thư viện:** `http` để thực hiện các yêu cầu GET bất đồng bộ.
- **Quản lý trạng thái:** Sử dụng `FutureBuilder` để xử lý các luồng dữ liệu (Async flow).

## 2. Các chức năng chính
Ứng dụng thực hiện lấy danh sách sản phẩm và xử lý triệt để 3 trạng thái của giao diện:
- **Trạng thái Đang tải (Loading):** Hiển thị vòng xoay `CircularProgressIndicator` ở chính giữa màn hình khi ứng dụng đang gửi yêu cầu mạng.
- **Trạng thái Thành công (Success):** 
    - Dữ liệu được ánh xạ (map) vào model `Product`.
    - Hiển thị danh sách bằng `ListView.builder`.
    - Mỗi sản phẩm nằm trong một thẻ `Card` với thiết kế gọn gàng.
    - Tiêu đề sản phẩm quá dài sẽ được cắt bớt bằng `TextOverflow.ellipsis`.
- **Trạng thái Lỗi (Error UI & Retry):** 
    - Khi gặp lỗi kết nối (ví dụ: mất mạng), màn hình hiển thị biểu tượng lỗi và thông báo chi tiết.
    - Cung cấp nút **"Thử lại" (Retry)** để người dùng có thể thực hiện gọi lại dữ liệu mà không cần khởi động lại ứng dụng.

## 3. Cấu trúc thư mục (Tổ chức Code)
Mã nguồn được tách bạch rõ ràng theo đúng yêu cầu:
- `lib/models/product.dart`: Định nghĩa lớp đối tượng dữ liệu.
- `lib/services/api_service.dart`: Chứa logic gọi API và xử lý ngoại lệ với `try-catch`.
- `lib/widgets/product_card.dart`: Thành phần UI hiển thị từng item sản phẩm.
- `lib/main.dart`: Giao diện chính và AppBar định danh theo cú pháp yêu cầu.

## 4. Cách chạy ứng dụng
1. Đảm bảo đã cài đặt Flutter SDK.
2. Chạy lệnh `flutter pub get` để tải các thư viện.
3. Kết nối thiết bị/emulator và chạy `flutter run`.
