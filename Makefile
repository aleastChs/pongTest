.PHONY: clean All

All:
	@echo "----------Building project:[ ver1 - Debug ]----------"
	@cd "ver1" && "$(MAKE)" -f  "ver1.mk" && "$(MAKE)" -f  "ver1.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ ver1 - Debug ]----------"
	@cd "ver1" && "$(MAKE)" -f  "ver1.mk" clean
