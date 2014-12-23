$(function () {
  $('.steps').show();

  var failCount = $('.Failed .summaryCount').html();
  var passedCount = $('.Passed .summaryCount').html();
  console.log(failCount);
  if (failCount === "0"){
    $('#BDDfyTitle').html('All tests passed');
  } else if (passedCount === "0"){
    $('#BDDfyTitle').html('All tests failed');
  } else {
    $('#BDDfyTitle').html(failCount + ' tests failed');
  } 
});