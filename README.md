# Coffee Shop System

Đây là website quản lý và bán đồ uống cho quán cà phê. Dự án gồm 2 phần chính:

- `backend`: xử lý API, đăng nhập, đăng ký, sản phẩm, danh mục, đơn hàng, tài khoản, thanh toán và chatbot.
- `frontend`: hiển thị giao diện website cho khách hàng và quản trị viên.

## Công nghệ sử dụng

- Backend: Python Flask
- Frontend: ReactJS
- Database: MySQL
- Giao tiếp giữa frontend và backend: REST API

## Cách chạy dự án

### 1. Chuẩn bị database

Tạo database MySQL tên:

```text
coffee_shop_db
```

Import file database:

```text
kcoffee_full.sql
```

Thông tin kết nối database đang cấu hình trong `backend/.env`:

```text
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=root
DB_PASSWORD=1234
DB_NAME=coffee_shop_db
```

Nếu máy khác có mật khẩu MySQL khác thì sửa lại `DB_PASSWORD` trong file `backend/.env`.

### 2. Chạy backend

Mở terminal tại thư mục `backend`:

```powershell
cd backend
python app.py
```

Backend sẽ chạy tại:

```text
http://127.0.0.1:5000
```

Có thể kiểm tra backend bằng đường dẫn:

```text
http://127.0.0.1:5000/api/health
```

### 3. Chạy frontend

Mở terminal khác tại thư mục `frontend`:

```powershell
cd frontend
npm start
```

Frontend sẽ chạy tại:

```text
http://localhost:3000
```

## Cấu trúc thư mục

```text
coffee-shop-system
|-- backend
|   |-- app.py
|   |-- .env.example
|   |-- requirements.txt
|   |-- controllers
|   |-- models
|   |-- scripts
|   |-- tests
|   |-- uploads
|
|-- frontend
|   |-- package.json
|   |-- public
|   |-- src
|       |-- components
|       |-- pages
|       |-- utils
|       |-- assets
|
|-- kcoffee_full.sql
|-- README.md
```

## Ý nghĩa các thư mục backend

### `backend/app.py`

File chính để khởi chạy Flask server. File này đăng ký các route API, cấu hình CORS, cấu hình thư mục upload ảnh và chạy server ở cổng `5000`.

### `backend/controllers`

Chứa các controller xử lý request từ frontend.

- `auth_controller.py`: đăng ký, đăng nhập, xác thực email, quên mật khẩu.
- `profile_controller.py`: xem và cập nhật hồ sơ người dùng, đổi mật khẩu, upload avatar, quản lý tài khoản admin.
- `product_controller.py`: quản lý sản phẩm, danh mục sản phẩm và upload ảnh sản phẩm.
- `order_controller.py`: quản lý giỏ hàng, đơn hàng, thanh toán, thống kê doanh thu.
- `chat_controller.py`: xử lý chatbot hỗ trợ khách hàng.

### `backend/models`

Chứa các hàm thao tác với database MySQL.

- `database.py`: tạo kết nối tới MySQL bằng thông tin trong file `.env`.
- `user_model.py`: thao tác dữ liệu người dùng.
- `product_model.py`: thao tác dữ liệu sản phẩm và danh mục.
- `order_model.py`: thao tác dữ liệu đơn hàng, thanh toán, mã giảm giá và thống kê.
- `email_verification_model.py`: lưu và kiểm tra mã xác thực email.
- `password_reset_model.py`: lưu và kiểm tra mã đặt lại mật khẩu.

### `backend/uploads`

Lưu ảnh upload từ hệ thống.

- `uploads/avatars`: ảnh đại diện người dùng.
- `uploads/products`: ảnh sản phẩm.

### `backend/tests`

Chứa file kiểm thử chức năng đăng nhập.

### `backend/scripts`

Chứa script hỗ trợ xử lý hoặc cập nhật dữ liệu.

## Ý nghĩa các thư mục frontend

### `frontend/src/App.js`

File khai báo các route của website. Mỗi đường dẫn sẽ hiển thị một trang tương ứng.

### `frontend/src/components`

Chứa các component dùng chung trong nhiều trang.

- `ProtectedRoute.jsx`: kiểm tra quyền truy cập theo vai trò `admin` hoặc `customer`.
- `AdminLayoutRed.jsx`: bố cục giao diện quản trị.
- `ClientLayout.js`: bố cục giao diện khách hàng.
- `CustomerHeader.jsx`: thanh header của khách hàng.
- `CustomerSupportChat.jsx`: khung chat hỗ trợ khách hàng.
- `NotificationModal.jsx`: popup thông báo.
- `ProfileContent.jsx`: nội dung trang hồ sơ cá nhân.
- `UserIdentityBadge.jsx`: hiển thị thông tin người dùng đang đăng nhập.

### `frontend/src/pages`

Chứa các trang chính của website.

- `HomeRedPage.jsx`: trang chủ công khai.
- `LoginRedPage.jsx`: trang đăng nhập, đăng ký và quên mật khẩu.

### `frontend/src/pages/client`

Chứa các trang dành cho khách hàng.

- `CustomerHomePage.jsx`: trang chủ sau khi khách hàng đăng nhập.
- `CustomerDrinksPage.jsx`: trang danh sách đồ uống.
- `CustomerCategoryProductsPage.jsx`: trang sản phẩm theo danh mục.
- `CustomerServicesPage.jsx`: trang dịch vụ/liên hệ.
- `CustomerCartPage.jsx`: trang giỏ hàng.
- `CustomerPaymentPage.jsx`: trang thanh toán đơn hàng.
- `CustomerOrderHistoryPage.jsx`: trang lịch sử đơn hàng.
- `CustomerProfilePage.jsx`: trang hồ sơ khách hàng.

### `frontend/src/pages/admin`

Chứa các trang dành cho quản trị viên.

- `AdminDashboardPage.jsx`: trang tổng quan, thống kê doanh thu và đơn hàng.
- `ProductAdminRed.jsx`: trang quản lý sản phẩm.
- `CategoryAdminRed.jsx`: trang quản lý danh mục.
- `OrderAdminRed.jsx`: trang quản lý đơn hàng.
- `AccountsAdminRed.jsx`: trang quản lý tài khoản người dùng.
- `AdminProfileRed.jsx`: trang hồ sơ quản trị viên.

### `frontend/src/utils`

Chứa hàm tiện ích dùng chung.

- `userSession.js`: lưu thông tin đăng nhập, lấy thông tin người dùng, xử lý giỏ hàng và cấu hình API backend.

### `frontend/src/assets`

Chứa hình ảnh tĩnh của frontend, ví dụ logo.

## Các view và đường dẫn hiển thị

### Trang công khai

| Đường dẫn | Trang hiển thị |
|---|---|
| `/` | Trang chủ giới thiệu quán cà phê |
| `/login` | Trang đăng nhập, đăng ký, quên mật khẩu |

### Trang khách hàng

Các trang này yêu cầu đăng nhập bằng tài khoản có vai trò `customer`.

| Đường dẫn | Trang hiển thị |
|---|---|
| `/customer/home` | Trang chủ khách hàng |
| `/customer/drinks` | Danh sách đồ uống |
| `/customer/drinks/:categoryId` | Danh sách sản phẩm theo danh mục |
| `/customer/services` | Trang dịch vụ/liên hệ |
| `/customer/cart` | Giỏ hàng |
| `/customer/payment/:orderId` | Thanh toán đơn hàng |
| `/customer/orders` | Lịch sử đơn hàng |
| `/customer/profile` | Hồ sơ khách hàng |

### Trang quản trị viên

Các trang này yêu cầu đăng nhập bằng tài khoản có vai trò `admin`.

| Đường dẫn | Trang hiển thị |
|---|---|
| `/admin/dashboard` | Tổng quan hệ thống, thống kê doanh thu |
| `/admin/profile` | Hồ sơ quản trị viên |
| `/admin/products` | Quản lý sản phẩm |
| `/admin/categories` | Quản lý danh mục |
| `/admin/orders` | Quản lý đơn hàng |
| `/admin/accounts` | Quản lý tài khoản người dùng |

## Một số API chính

| API | Chức năng |
|---|---|
| `POST /api/login` | Đăng nhập |
| `POST /api/register/request-code` | Gửi mã đăng ký |
| `POST /api/register/verify` | Xác thực đăng ký |
| `GET /api/products` | Lấy danh sách sản phẩm |
| `POST /api/products` | Thêm sản phẩm |
| `GET /api/categories` | Lấy danh sách danh mục |
| `POST /api/categories` | Thêm danh mục |
| `GET /api/orders` | Lấy danh sách đơn hàng |
| `POST /api/orders` | Tạo đơn hàng |
| `GET /api/admin/dashboard` | Lấy dữ liệu thống kê admin |
| `GET /api/admin/users` | Lấy danh sách tài khoản |
| `POST /api/chatbot/message` | Gửi tin nhắn tới chatbot |

## Ghi chú khi đưa lên GitHub

File code có thể đưa lên GitHub. Database MySQL local không tự đi kèm code, vì vậy cần đưa thêm file export `.sql`, ví dụ `kcoffee_full.sql`.

Khi người khác tải project về, họ cần:

1. Tạo database MySQL.
2. Import file `.sql`.
3. Cấu hình lại `backend/.env` cho đúng thông tin MySQL trên máy họ.
4. Chạy backend.
5. Chạy frontend.
