

spitHere();
gITXTNIdx=0;

function rKWL2(m){
if((ppp&&(gITXTNIdx>=gK.length))||(!ppp&&(gITXTNIdx>=gITXTN.length))) {

itxtprep();
hIT(aAD,aKW,gSI);
var ndbET=new Date().getTime();

}else{
  var tnow = (new Date()).getTime();
  if(ppp){
    while((gITXTNIdx< gK.length)&&((new Date()).getTime()-tnow< m)) {
            aKW = fHp( aKW, gK[gITXTNIdx], gITXTN );
            gITXTNIdx++;
        }
  }else{
    while((gITXTNIdx< gITXTN.length)&&((new Date()).getTime()-tnow< m)){
      if((gOHk.length == 0)||(binarySearch(gOHk,gITXTNIdx+1)>=0))
            
        aKW=fH(aKW,gITXTNIdx,gK,gITXTN[gITXTNIdx],mk);
            
      gITXTNIdx++;
    }
  }
  window.setTimeout('rKWL2(50);', 50);
}}
rKWL2(250);

