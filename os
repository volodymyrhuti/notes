=========================================================================================================
Memory allocation
=========================================================================================================



=========================================================================================================
Queues vs pipes vs shared memory
=========================================================================================================
Shared memory => area of storage that can be read and written by more than one process
It`s up to programme rto ensure that one process doesn`t clobber another`s data, It`s
efficient in terms of throughtput => reading and writing are relatively fast ops.

Message queue => one-way pipe: one process writes to the queue and another reads the
data in the order it was written until an end-of-data occurs. When the queue is
created, the message size and queue length are set. Access is slower than shared
memory because each read/write is typically a single message. But queue guarantees that
each operation will either processes an entire message successfully or fail without
altering the queue. So the writer can never fail after writing only a partial message,
and the reader will either retrieve a complete message or nothung at all
Queue can be opened and closed on either side without coorporation of the other
side (does it closes queue for another side???)

Pipes => ... . If two different prcoesses try to read from or write to the same end of
a pipe, bad things happen. Pipe`s aren`t limited in size while queues are. They
can be used by file descriptors while queues have their own set of functions
Once one closed, it require some amount of cooperation on both sides to reestablish them
Pipes are flat, like a stream, to impose a message structure you would have to implement
a protocol on both sides while queues are message oriented already.


=========================================================================================================
Spooling
=========================================================================================================
Spooling is a process in which data is temporarily held to be used and executed
by a device, program or the system. Data is sent to and stored in memory or other
volatile storage until the program or device requests it for execution.
"Spool" in an acronym for simultaneous peripheral operations online. Exmaple of
spooling is printer which is issued by multiple programs. To avoid a mess of
writing all requested data to simultaneoulsy, we save them to buffer and when printer
is done with one request, it starts another


=========================================================================================================
Memory/Port mapped IO
=========================================================================================================
Two complementary methids of performing IO between the CPU and peripheral devices in a
computer. An alternatice approach is using dedicated IO processors, commonly known as
channels on mainframe computersm which execute their own instructions.

The idea behind memory mapping is that a device will be connected to the system's address
bus and uses a circuit called an address decoder to watch for reads or writes to its assigned
addresses responds accordingly.

When a northbridge receivers a physical memory request it decides where to route it.
This routing is deciaded via the memory address map. For each region of physical memory
addresses, the memory map knows the device that owns that region. 

Memory mapping is usually performed on boot by BIOS.
1. BIOS discovers all the devices on the system
2. Discovers the device`s BARs (base address register, up to 6 per device)
3. For each BAR, asks the BAR how much space it needs
4. Assigns the BAR a block od address space
5. Programs the BAR with the base address of the chosen block of memory address space

https://manybutfinite.com/post/motherboard-chipsets-memory-map/
https://stackoverflow.com/questions/3215878/what-are-in-out-instructions-in-x86-used-for
https://superuser.com/questions/595672/how-is-memory-mapped-to-certain-hardware-how-is-mmio-accomplished-exactly
=========================================================================================================
General
=========================================================================================================
Chipset => southbridge + northbridge
