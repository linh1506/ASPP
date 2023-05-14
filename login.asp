<!--#include file="connect.asp"-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="/bootstrap-5.2.0-dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="/login.css" />
    <link rel="stylesheet" href="/UIcomponents/notification.css">
    <title>login</title>
  </head>
  <body>
    <!--#include file="./UIcomponents/notification.asp"-->
    <h1 class="store-title">ODGB</h1>
    <div class="change-mode">
        <p>Chưa có tài khoản ?</p>
        <button onclick="Reveal()" class="btn ">
          Tạo tài khoản
        </button>
      </div>
    <div class="container-custom">
      <div class="form-background">
        <div class="text-login jamText ">Đăng nhập vào ODBG<br>Dễ dàng thanh toán</div>
        <div class="text-signup jamText">Đăng ký hội viên ODBG<br>Để hưởng nhiều ưu đãi!!!</div>
      </div>
      <div class="form-group overflow-hidden">
            <div class="form-component signup">
              <form class='signup-form' method="post" action='/signup.asp'>
                <input
                  type="text"
                  class="form-control input-control"
                  id="name"
                  name="name"
                  placeholder="Tên Người Dùng"
                />
                <!--Address-->
                <input
                  type="text"
                  class="form-control input-control"
                  id="address"
                  name="address"
                  placeholder="Địa Chỉ"
                />
                <!--Email address-->
                <input
                  type="text"
                  class="form-control input-control"
                  id="email"
                  name="email"
                  placeholder="Email"
                />
                <!--Phone-->
                <input
                  type="text"
                  class="form-control input-control"
                  id="phone"
                  name="phone"
                  placeholder="Số Điện Thoại"
                />
                <!--Password1-->
                <input
                  type="password"
                  class="form-control input-control"
                  id="pass1"
                  name="pass1"
                  placeholder="Mật Khẩu"
                />
                <!--Password2-->
                <input
                  type="password"
                  class="form-control input-control"
                  id="pass2"
                  name="pass2"
                  placeholder="Vui lòng xác nhận lại mật khẩu"
                />
                <br />
                <input type="submit" class="btn btn-success" />
              </form>
            </div>
            <div class="form-component login">
              <form method="post" class='login-form'>
                <div class="input-group flex-nowrap">
                  <input
                    type="text"
                    class="form-control input-control"
                    name="email"
                    placeholder="Email"
                  />
                </div>
                <div class="input-group flex-nowrap">
                  <input
                    type="password"
                    class="form-control input-control"
                    name="password"
                    placeholder="Mật khẩu"
                  />
                </div>
                <br />
                <input type="submit" class="btn right" />
              </form>
            </div>
          </div>
    </div>
    <script>
      const Reveal = () => {
        if($(".form-group").css('clip-path')==='inset(0px 0px 0px 50% round 20px)')
          { $('.change-mode p').text('Đã có tài khoản?')
            $('.change-mode button').text('Đăng nhập')
            $(".form-group").css('clip-path','inset(0px 50% 0px 0px round 20px)')
          }  
        else
        { $('.change-mode p').text('Chưa có tài khoản?')
          $('.change-mode button').text('Tạo tài khoản')
          $(".form-group").css('clip-path','inset(0px 0px 0px 50% round 20px)');
        }
      };
    </script>
    <script src="/Jquery/jquery-3.6.1.min.js"></script>
    <script>
        $(document).ready(function() {
            var localhostAddress = window.location.origin
            $('.login-form').submit(function(event) {
                // Prevent the form from submitting normally
                event.preventDefault();

                // Send the form data to the server using AJAX
                $.ajax({
                url: localhostAddress+'/loginHandler.asp',
                method: 'POST',
                data: $(this).serialize(),
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                    // If the form was submitted successfully, display a success message
                    window.location.href = response.message
                    } else {
                    // If there was an error, display an error message
                    notification(response.message, 'var(--bs-orange)')
                    }
                },
                error: function(xhr, status, error) {
                    // If there was an error with the AJAX request, display an error message
                    alert('An error occurred while submitting the form: ' + error);
                }
                });
            });
            $('.signup-form').submit(function(event) {
                // Prevent the form from submitting normally
                event.preventDefault();

                // Send the form data to the server using AJAX
                $.ajax({
                url: localhostAddress+'/signup.asp',
                method: 'POST',
                data: $(this).serialize(),
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                    // If the form was submitted successfully, display a success message
                    notification(response.message,'var(--bs-green)')
                    Reveal()
                    } else {
                    // If there was an error, display an error message
                    notification(response.message, 'var(--bs-orange)')
                    }
                },
                error: function(xhr, status, error) {
                    // If there was an error with the AJAX request, display an error message
                    alert('An error occurred while submitting the form: ' + error);
                }
                });
            });
        });
    </script>
  </body>
</html>
