public class Addition_using_for_loop {
    public static void add(){
list<integer> integerList = new list<integer>();
integerList.add(-123);
integerList.add(12);
integerList.add(11);
integer totalSum = 0;
for(integer inter: integerList){
    totalSum -= inter;
	system.debug('In For  --- '+inter);    
}
system.debug('&&&&&SIZE --- '+integerList.size());
system.debug('Sum '+totalSum); 
}
}