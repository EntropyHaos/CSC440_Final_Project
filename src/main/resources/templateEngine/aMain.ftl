<html>
   <head>
      <title>Spark Project</title>
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/bootstrap-theme.min.css">
      <link rel="stylesheet" href="css/starter-template.css">
      <link rel="stylesheet" href="css/bootstrap-datepicker3.standalone.css">
   </head>
   <body>
      <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
         <div class="container">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               </button>
               <a class="navbar-brand" href="#"></a>
            </div>
            <div class="collapse navbar-collapse">
               <ul class="nav navbar-nav">
                  <li class="active"><a href="/">Home</a></li>

                  <li class="dropdown">
                     <a class="dropdown-toggle" data-toggle="dropdown" href="#">Billable<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="createBillable">Create Billable</a></li>
                        <li><a href="getAllBillables">Get All Billables</a></li>
                        <li><a href="updateBillable">Update Billable</a></li>
                        <li><a href="removeBillable">Remove Billable</a></li>
                     </ul>
                  </li>


                  <li class="dropdown">
                     <a class="dropdown-toggle" data-toggle="dropdown" href="#">Provider<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="createProvider">Create Provider</a></li>
                        <li><a href="getAllProviders">Get All Providers</a></li>
                        <li><a href="updateProvider">Update Provider</a></li>
                        <li><a href="removeProvider">Remove Provider</a></li>
                     </ul>
                  </li>


                  <li class="dropdown">
                     <a class="dropdown-toggle" data-toggle="dropdown" href="#">Service<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="createService">Create Service</a></li>
                        <li><a href="getAllServices">Get All Services</a></li>
                        <li><a href="updateService">Update Service</a></li>
                        <li><a href="removeService">Remove Service</a></li>
                     </ul>
                  </li>


                  <li class="dropdown">
                     <a class="dropdown-toggle" data-toggle="dropdown" href="#">User<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="createUser">Create User</a></li>
                        <li><a href="getAllUsers">Get All Users</a></li>
                        <li><a href="updateUser">Update User</a></li>
                        <li><a href="removeUser">Remove User</a></li>
                     </ul>
                  </li>

               </ul>
            </div>
            <!--/.nav-collapse -->
         </div>
      </div>
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/bootstrap-datepicker.min.js"></script>
      <div class="container">
         <#include "${templateName}">
      </div>
   </body>
</html>

