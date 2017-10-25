function geneticMarker(arr, str){

  coun = 0
  for(var i = 0; i<arr.length; i++){

    for(var k=0, c=0 ; k<arr[i].length; k++){
      coun++;
      if(arr[i].charAt(k) == '?' || arr[i].charAt(k) == str.charAt(c)){

        c++;

        if(c == str.length) return true;
        if(str.length > arr[i].length - k) {
          break;

        }

      }

      else {

        k -= c;

        c = 0;
      }

    }
  }
  return false;
}
t0 = performance.now()
console.log(geneticMarker(['they','supercalifragilisticexpialidocious','dociou?aliexpalis?icfragical?rupus','anidi?establish?enta?ianism' ,'poop', 'tha?hes', 'like', 'rainbows','sth?table'], 'fragysgtctg'));
t1 = performance.now()
console.log(t1-t0+ "ms")

console.log(coun)
