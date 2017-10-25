// // console.log('this is algos');
// function rBinarySearch(arr,num){
//     if(arr.length<1){
//         console.log('false')
//         return false
//     }
//     var mid = arr[Math.floor(arr.length-1/2)];
//     if(mid > num){
//         console.log('greater than')
//         arr = arr.slice(mid+1,arr.length-1);
//         rBinarySearch(arr,num)
//     }
//     else if(mid < num){
//         console.log('less than')
//         arr = arr.slice(0,mid+1);
//         rBinarySearch(arr,num)
//     }
//     else{
//         console.log('true');
//         return true
//     }
// }

// rBinarySearch(arr=[1,2,3,4,5,6,7,8,9],num=12)




//All Possible Anagrams of a String

// var anagrams = allAnagrams('abcd');
console.log(allAnagrams('CARL')); // [ 'abc', 'acb', 'bac', 'bca', 'cab', 'cba' ]

function allAnagrams(string) {

  var uniqueOutput = {};

  (function anagram(ana, str) {

    // could have also written this as: if(!str)....
    if (str === '') {
      uniqueOutput[ana] = 1;
    }
    //recursive call for the length of the anagram.
    for (var i = 0; i < str.length; i++) {
      anagram(ana + str[i], str.slice(0, i) + str.slice(i + 1));
      console.log(ana);
    }
  })('', string);
  console.log(uniqueOutput)
  return Object.keys(uniqueOutput);
};