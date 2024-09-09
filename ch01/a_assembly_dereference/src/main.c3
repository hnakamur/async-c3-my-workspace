module a_assembly_dereference;
import std::io;

fn int main(String[] args)
{
	usz t = 100;
	usz* ptr = &t;
	usz x = dereference(ptr);
	io::printfn("x=%d", x);
	return 0;
}

fn usz dereference(usz* ptr) {
	usz ret @noinit;
	asm {
		movq ret, [ptr];
	}
	return ret;
}
