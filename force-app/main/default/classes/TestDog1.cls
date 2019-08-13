public class TestDog1 {
public void test(){
      list<Dog1> dlist= new list<Dog1>();
      set<Dog1> nlist= new set<Dog1>();
        
        Dog1 d1= new Dog1();
        d1.name='Puppy';
        d1.type='dog';
        dlist.add(d1);
         
		Dog1 d2= new Dog1();
		d2.name='Bolt';
		d2.type='dog';
		dlist.add(d2);
	
		Dog1 d3= new Dog1();
		d3.name='Bolt2';
		d3.type='dog';
	    nlist.add(d3);
        
		nlist.addAll(dlist);//addall method is available in List and Set Data Types
		system.debug('Nlist+++++++'+nlist.size()); //3
		system.debug('dlist+++++++'+dlist.size()); //2
    }
}