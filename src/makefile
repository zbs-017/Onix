boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

master.image: boot.bin
	"yes" | bximage -q -hd -size=16 -mode=flat master.image
	dd if=boot.bin of=master.image bs=512 count=1 conv=notrunc

.PHONY: clean
clean: 
	rm -f boot.bin
	rm -f master.image

.PHONY: clean
bochs:
	bochs -q
