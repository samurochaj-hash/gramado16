ASM = wla-65816
LINK = wlalink
BUILD = build

all: $(BUILD)/gramado16.sfc

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/main.o: src/main.asm src/header.asm src/header_vectors.asm | $(BUILD)
	cd src && $(ASM) -o ../$(BUILD)/main.o main.asm

$(BUILD)/gramado16.sfc: $(BUILD)/main.o
	printf '[objects]\n%s\n' '$(BUILD)/main.o' > $(BUILD)/linkfile
	$(LINK) -S $(BUILD)/linkfile $@

clean:
	rm -rf $(BUILD)

.PHONY: all clean
