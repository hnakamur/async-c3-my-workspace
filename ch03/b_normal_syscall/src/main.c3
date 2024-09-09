module a_raw_syscall;

extern fn isz write(CInt fd, void* buf, usz len); // C "write"

fn int main(String[] args)
{
	String message = "Hello world from raw syscall!\n";
	usz n = write_to_stdout(message);
	assert(n == message.len);
	return 0;
}

fn usz write_to_stdout(String msg) {
	return write(1, msg.ptr, msg.len);
}
