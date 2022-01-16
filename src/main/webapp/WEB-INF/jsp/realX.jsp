
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="/css/shared.css" rel="stylesheet">


<div class="container-fluid" style="padding-top: 20%">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4 login-form">
            <form role="form" method="post">
                <div class="row row-login">
                    <input name="userName" type="text" class="form-control form-item" placholder="ffff"/>
                </div>
                <div class="row row-login">
                    <input name="password" type="password" class="form-control form-item" id="exampleInputPassword1" placholder="ffff"/>
                </div>
                <div class="row row-login row-btn">
                    <button type="submit" class="btn btn-primary btn-block login-btn form-item">
                        Login
                    </button>
                </div>
                <div class="row row-login row-btn">
                    <a class="btn btn-primary btn-block login-btn form-item" href="/create">
                        Create New Account
                    </a>
                </div>
                <div class ="row row-login">
                    <h3 class="form-item warning">${error}</h3>
                </div>
            </form>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</div>
