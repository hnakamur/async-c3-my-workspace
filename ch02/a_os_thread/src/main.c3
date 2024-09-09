module a_os_thread;
import std::io;
import std::thread;

fn void! main(String[] args)
{
	io::printn("So, we start the program here!");

	thread::Thread t1;
	t1.create(fn int (void *) {
		thread::sleep_ms(200);
		io::printn("The long running tasks finish last!");
		return 0;
	}, null)!;

	thread::Thread t2;
	t2.create(fn int (void *) {
		thread::sleep_ms(100);
		io::printn("We can chain callbacks...");

		thread::Thread t3;
		t3.create(fn int (void *) {
			thread::sleep_ms(10);
			io::printn("...like this!");
			return 0;
		}, null)!!;
		t3.join()!!;

		return 0;
	}, null)!;

	int ret1 = t1.join()!;
	int ret2 = t2.join()!;
	io::printfn("ret1=%d, ret2=%d", ret1, ret2);
}
