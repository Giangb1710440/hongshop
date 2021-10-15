@extends('layout.master_profile')
@section('title', 'Thông tin người dùng')
@section('content')

    <!-- Women Banner Section Begin -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <style>
                .responsive{
                    width: 140px;
                    height: 140px;
                    border-radius: 50%;
                    border: 1px solid #a0aec0;
                }
                .card-img-user{
                    padding-right: 1px;
                }
                .card-information{
                    padding-left: 1px;
                }

                .imagePreview {
                    margin: auto;
                    width: 100px;
                    height: 100px;
                    border-radius: 50%;
                    display: none;
                    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
                }

                .button-wrapper {
                    position: relative;
                    width: 100px;
                    text-align: center;
                    font-weight: bold;
                }

                .button-wrapper span.label {
                    position: relative;
                    z-index: 0;
                    display: inline-block;
                    width: 100%;
                    background: #00bfff;
                    cursor: pointer;
                    color: #fff;
                    padding: 10px 0;
                    text-transform:uppercase;
                    font-size:12px;
                    border-radius: 5px;
                    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
                }
                #upload {
                    display: inline-block;
                    position: absolute;
                    z-index: 1;
                    width: 100%;
                    height: 50px;
                    top: 0;
                    left: 0;
                    opacity: 0;
                    cursor: pointer;
                }
                /*Small devices (landscape phones, 576px and up)*/
                @media (max-width: 576px) {
                    .card-body .row .card-img-user{
                        text-align: center;
                    }
                    .card-body .row .card-img-user .responsive{
                        margin-bottom: 20px;
                        text-align: center;
                        width: 130px;
                        height: 130px;
                    }
                    .card-information{
                        padding-left: 5%;
                    }
                    .form-group .col-12{
                        font-size: 13px;
                        margin-bottom: 5px;
                    }
                    .form-group .col-12 input{
                        font-size: 13px;
                    }
                    .form-check-inline .form-check-label input{
                        font-size: 13px;
                    }
                }
            </style>

            <div class="card">
                <div class="card-header p-2">
                    <b>Thông tin tài khoản</b>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-lg-3 card-img-user">
                            @if(Auth::user()->avatar == 'users/default.png')
                                <img src="{{ url('public/storage/'.Auth::user()->avatar) }}" class="responsive img-thumbnail" alt="Logo-avatar">
                            @else
                                <img src="{{ url('public/img/avatar/'.Auth::user()->avatar) }}" class="responsive img-thumbnail" alt="Logo">
                            @endif
                        </div>
                        <div class="col-12 col-sm-12 col-lg-9 card-information">
                            <form action="{{ route('updateProfile', Auth::user()->id) }}" class="needs-validation" novalidate method="post" enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-3 font-weight-bold">Tên tài khoản:</div>
                                    <div class="col-12 col-sm-12 col-md-9">
                                        <input type="text" class="form-control" value="{{ $user->name }}" name="inputUsername" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-3 font-weight-bold">Email:</div>
                                    <div class="col-12 col-sm-12 col-md-9">
                                        <input type="email" class="form-control" value="{{ $user->email }}" name="inputEmail" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-3 font-weight-bold">Số điện thoại:</div>
                                    <div class="col-12 col-sm-12 col-md-9">
                                        <input type="number" class="form-control" value="{{ $user->phone }}" name="inputPhone" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-3 font-weight-bold">Ngày sinh:</div>
                                    <div class="col-12 col-sm-12 col-md-9">
                                        <input type="date" class="form-control" name="inputBirthday" required value="{{ $user->birthday }}">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-3 font-weight-bold">Địa chỉ:</div>
                                    <div class="col-12 col-sm-12 col-md-9">
                                        <textarea name="inputAddress" rows="2" required class="form-control">{{ $user->address }}</textarea>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-12 col-sm-12 col-md-3 font-weight-bold">Thay đổi ảnh:</div>
                                    <div class="col-12 col-sm-12 col-md-4">
                                        <div class="button-wrapper">
                                    <span class="label">
                                        <i class="fa fa-picture-o"></i> Thay Ảnh
                                    </span>
                                            <input type="file" id="upload" class="upload-box" accept="image/*" onchange="loadFile(event)" name="fileInput">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-5 text-right">
                                        <img id="output" class="imagePreview img-thumbnail" alt="Review" src=""/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-9 mt-3">
                                        <a href="{{ route('changePassword', $user->id) }}" style="text-decoration-line: underline;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
                                                <path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
                                                <path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                            </svg>
                                            Thay Đổi Mật Khẩu
                                        </a>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-9 text-right">
                                        <hr class="mt-0">
                                        <button type="submit" class="btn btn-danger">Cập Nhật</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    @if(session()->has('update_success'))
        <script>
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: '{{ session()->get('update_success') }}',
                showConfirmButton: false,
                timer: 1000
            })
        </script>
    @endif

    @if(session()->has('change_password_successfully'))
        <script>
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: '{{ session()->get('change_password_successfully') }}',
                showConfirmButton: false,
                timer: 1000
            })
        </script>
    @endif

    <script>
        var msg = '{{Session::get('add_cart_success')}}';
        var exist = '{{Session::has('add_cart_success')}}';
        if(exist){
            swal({
                title: "Đã thêm vào giỏ hàng",
                text: "",
                type: "success",
                timer: 1200,
                showConfirmButton: false,
                position: 'top-end',
            });
        }
    </script>

    <script>
        var loadFile = function(event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                document.getElementById('output').style.display = "block";
                URL.revokeObjectURL(output.src) // free memory
            }
        };
    </script>

    <script>
        // Disable form submissions if there are invalid fields
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Get the forms we want to add validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
@endsection

