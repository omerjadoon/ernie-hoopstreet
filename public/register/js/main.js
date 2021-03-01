
var camount = 0;
var cname= "";
var cemail="";
var caddress="";
var cphone = "";
var cstate = "";
var csource = "bank";
var caccredited ="0"
var stepsWizard = null;

$(function(){
    $("#form-register").validate({
        rules: {
            password : {
                required : true,
            },
            confirm_password: {
                equalTo: "#password"
            }
        },
        messages: {
            username: {
                required: "Please provide an username"
            },
            email: {
                required: "Please provide an email"
            },
            password: {
                required: "Please provide a password"
            },
            confirm_password: {
                required: "Please provide a password",
                equalTo: "Please enter the same password"
            }
        }
    });
    
});

$.fn.steps.setStep = function (step)
{
  var currentIndex = $(this).steps('getCurrentIndex');
  for(var i = 0; i < Math.abs(step - currentIndex); i++){
    if(step > currentIndex) {
      $(this).steps('next');
    }
    else{
      $(this).steps('previous');
    }
  } 
};

$(document).ready(function(){


function populateAgreement(){
    console.log(cname);
    $('#agree_name').text(cname);
    var share = (camount/50);
    $('#agree_shares').text(share);
    $('#agree_amount').text("$" +camount);
    $('#agree_sign').text(cname);
    var d = new Date();
    var strDate =   d.getDate() +"/"+ (d.getMonth()+1) + "/" +d.getFullYear();
    $('#agree_date').text(strDate);
    $('#agree_address').text(caddress);
    $('#agree_phone').text(cphone);
    //$('#agree_cc').checked();
    
}

    var is_async_step = false;
  stepsWizard = $("#form-total").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "fade",
        // enableAllSteps: true,
        autoFocus: true,
        transitionEffectSpeed: 200,
        titleTemplate : '<div class="title">#title#</div>',
        labels: {
            previous : 'Back',
            next : '<i class="zmdi zmdi-arrow-right"></i>',
            finish : '<i class="zmdi zmdi-arrow-right"></i>',
            current : ''
        },
        onStepChanging: function (event, currentIndex, newIndex) { 
            var ss0 = false;
            var ss1 = false;
            var ss2 = false;
            var ss3 = false;
            var ss4 = false;
            

            
            if (currentIndex == 0) {

                             var pass = $('#password').val();
                             var email = $('#email').val();
                              cemail = email;
                             camount = inv;
                             if(pass == "" || email == "")
                             {
                              alert("email or password cant be empty");
                               ss0 = false;
                              return false;
                             }
                            

                            var postForm = { //Fetch form data
                                    'step'     : '1',
                                    'password' : pass,
                                    'email' : email,
                                    //Store name fields value
                                };

                                var requestResult = $.ajax({ url: 'registercustomer',
                                 data: postForm,
                                 type: 'post',
                                 
                                 async: false,
                                 success: function(output) {
                                   console.log(output);
                                   //var t = JSON.parse(output);
                                   if(output.status == "OK")
                                   {
                                      //console.log(t);
                                              ss0 = true;
                                              return ss0;
                                   }
                                   else{
                                    alert(output.message);
                                    ss0= false;
                                    return false;
                                   }
                                   
                                  // cemail = t.email;
                                  //if(output)
                                              
                                          },
                                  error: function(request, status, error){
                                    console.log(error);
                                    alert("Error: Could not create your account. Please Try again"+status + error);
                                    ss0= false;
                                    return false;
                                  }
                            });
                        return ss0;
                        
                    }

                        else if (currentIndex == 1) {

                             var inv = $('#investment').val();
                            
                             camount = inv;

                            var postForm = { //Fetch form data
                                    'step'     : '2',
                                    'investment' : inv,
                                    'email' : cemail,
                                    //Store name fields value
                                };

                                var requestResult = $.ajax({ url: 'addinvestment',
                                 data: postForm,
                                 type: 'post',
                                 
                                 async: false,
                                 success: function(output) {
                                              console.log(output);
                                             //var t = JSON.parse(output);
                                             if(output.status == "OK")
                                             {
                                                //console.log(t);
                                                ss1 = true;
                                                return ss1;
                                             }
                                             else{
                                              alert(output.message);
                                              ss1= false;
                                              return false;
                                             }
                                          },
                                  error: function(request, status, error){
                                    alert("Error: Could not save investment. Please Try again"+status + error);
                                    ss1= false;
                                    return false;
                                  }
                            });
                        return ss1;
                        
                    }

                    else if (currentIndex == 2) {

                             var name = $('#name').val();
                             var phone = $('#phone').val();
                             var state = $('#state').val();
                             var address = $('#address').val();
                             var accredation = $('input[name="accredation"]:checked').val();
                            //console.log(accredation);
                            cname = name;
                            cphone = phone;
                            cstate = state;
                            caddress = address;

                            var formData = new FormData();
                            formData.append('step','3');
                            formData.append('name',name);
                            formData.append('phone',phone);
                            formData.append('address',address);
                            formData.append('state',state);
                            formData.append('email',cemail);
                            formData.append('accredation',accredation);
                            if(caccredited == "1"){
                            formData.append('file', $('#income-file')[0].files[0]);
                            formData.append('worth', $('#worth-file')[0].files[0]);
                        }

console.log(formData);
                            // var postForm = { //Fetch form data
                            //         'step'     : '3',
                            //         'name' : name,
                            //         'phone' : phone,
                            //         'address' : address,
                            //         'state' : state,
                            //         'email' : cemail,
                            //         'accredation' : accredation,
                                    
                            //         //Store name fields value
                            //     };

                               var requestResult = $.ajax({
                                url: "updateuserdetails",
                                dataType: false,
                                cache: false,
                                contentType: false,
                                processData: false,
                                data: formData,                         
                                type: 'post',
                                 async: false,
                                success: function(output){
                                   //console.log(output);
                                     //var t = JSON.parse(output);
                                     if(output.status == "OK")
                                     {
                                        console.log(output);
                                        ss2 = true;
                                        $( "#nav-profile-tab" ).prop('aria-selected', true);

                                        return true;
                                     }
                                     else{
                                      alert(output.message);
                                      ss2 = false;
                                      return false;
                                     }
                                    
                                }
                                ,
                                  error: function(request, status, error){
                                    console.log(error);
                                    alert("Error: Could not save your details. Please Try again" + status + error);
                                    console.log(request.responseText+status+error);
                                    ss2= false;
                                    return false;
                                  }
                            });
                             console.log(ss2);

                        return ss2;
                            
                        
                    }
            
            else if (currentIndex == 3) {

                         populateAgreement();   
                        return true;
                        
                    }
                    
                     else if (newIndex == 4) {

                    
                        console.log("hhhh");
                        alert("hello");
                        return true;


                    }else{
                        return true;
                    }
            
             

          
            
        },
        onContentLoaded: function (event, currentIndex) {
        console.log(currentIndex + "loaded");
   },
   onFinishing: function (event, currentIndex)
        {
            var form = $(this);

console.log(csource);
                         var postForm = { //Fetch form data
                                    'investment_status' : '1',
                                    'payment_source' : csource,
                                    'email': cemail,
                                    'name' : cname
                                    //Store name fields value
                                };

                                var requestResult = $.ajax({ url: 'updateinvestmentsource',
                                 data: postForm,
                                 type: 'post',
                                 
                                 async: true,
                                 success: function(output) {
                                              console.log(output);
                                             //var t = JSON.parse(output);
                                             if(output.status == "OK")
                                             {
                                                console.log("OK");
                                                ss1 = true;
                                                return ss1;
                                                
                                             }
                                             else{
                                              alert(output.message);
                                              ss1= false;

                                              return false;
                                             }
                                          },
                                  error: function(request, status, error){
                                    alert("Error: Could not save investment. Please Try again"+status + error);
                                    ss1= false;
                                    console.log(request.responseText+status+error);
                                    return false;
                                  }
                            });
window.location.href = "login";


            // Disable validation on fields that are disabled.
            // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
            //form.validate().settings.ignore = ":disabled";

            // Start validation; Prevent form submission if false
            //return form.valid();
        },
        onFinished: function (event, currentIndex)
        {
            var form = $(this);

            // Submit form input

            //form.submit();
            console.log("finish");
        },
            saveState: true
    });

  $('#radioBtn a').on('click', function(){
    var sel = $(this).data('title');
    var tog = $(this).data('toggle');
    $('#'+tog).prop('value', sel);
    
    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
})
});

//change radio
$(document).ready(function(){
$('#filess').hide();
$('input[name=accredation]').change(function(){
var value = this.value;
if(value == "1")
{
    $('#filess').show();
    console.log("files visible");
    caccredited = "1";
}else{
    $('#filess').hide();
    console.log("files not visible");
    caccredited = "0"
}
});


});