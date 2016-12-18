//Disable button gerar pdf
function f1(){
  if (document.getElementById("radio1").checked == true){
    //$('#pdf').show();
    document.getElementById("pdf").disabled = false;
  }else{
    // $('#pdf').hide();
    document.getElementById("pdf").disabled = true;
  }
  if(document.getElementById("radio2").checked == true){
    //$('#pdf').hide();
    document.getElementById("pdf").disabled = true;
  }
}
