<!DOCTYPE html>
<html>
<head>
  <title>Twitter Bootstrap : Segmented Button Groups </title>
<link rel="stylesheet"
      href="dist/css/bootstrap.min.css">

<script src="dist/js/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
</head>
<style>
  .bootstrap-demo{margin:30px;}
</style>
<body>


  <div class="col-lg-6">
     <div class="input-group">
       <div class="input-group-btn">
       <button type="button" class="btn btn-default" tabindex="-1">BEGOH</button>
       <button type="button" class="btn btn-default dropdown-toggle" 
			data-toggle="dropdown" tabindex="-1">
              <span class="caret"></span>
              <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#">User</a></li>
                  <li class="divider"></li>
              <li><a href="#">Property</a></li>
           
          
             
            </ul>
          </div>
          <input type="text" class="form-control">
        </div>
      </div>
  <br>
      <div class="col-lg-6">
        <div class="input-group">
          <input type="text" class="form-control">
          <div class="input-group-btn">
            <button type="button" class="btn btn-default" tabindex="-1">Country</button>
            <button type="button" class="btn btn-default dropdown-toggle"
            data-toggle="dropdown" tabindex="-1">
              <span class="caret"></span>
              <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu pull-right" role="menu">
              <li><a href="#">USA</a></li>
              <li><a href="#">Canada</a></li>
              <li><a href="#">Brazil</a></li>
              <li class="divider"></li>
              <li><a href="#">Cuba</a></li>
            </ul>
          </div>
        </div>
      </div>
 
</body>
</html>