// const setTimeout = function(cb) {
//   window.setTimeout(1000);
//   cb();
// };

setTimeout(function(){
  alert('HAMMERTIME');
}, 2000);

function hammertime (time) {
  setTimeout(function (){
    console.log('${time} is hammertime!');
  }, 2000);
}

const readline = require('readline');

const reader = readline.createInterface({
  input:process.stdin,
  output: process.stdout
})

function teaAndBisc () {
  let first, second;

  reader.question("Would you like some tea?", (firstR) => {
    reader.question('Would you like some tea?', (secondR) => {
      first = firstR;
      second = secondR;
      console.log('Cool, i hear $(firstR) and $(secondR)');
    })
  })

  const firstRes = (first === 'yes') ? 'do' : 'don\'t';
  const secondRes = (second === 'yes') ? 'do' : 'don\'t';

  console.log('So you $(firstRes) want tea and $(secondRes) want biscuits.');
  reader.close;
}
