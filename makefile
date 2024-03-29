# Default to replacement and building only
all: replace_files build_castalia run_simulation

# Define the submodule path variable
SUBMODULE_PATH := $(shell git submodule | grep 'Castalia' | awk '{ print $$2 }')

# Replace matching files in the submodule with those from the repo level
replace_files:
	for f in $$(find . -maxdepth 1 -type f \( -name '*.cc' -o -name '*.h' \)); do \
		for path in $$(find $(SUBMODULE_PATH)/src -type f -name $$(basename $$f)); do \
			echo "Replacing $$path with $$f"; \
			cp $$f $$path; \
		done; \
	done

# Build the submodule
build_castalia: replace_files
	cd $(SUBMODULE_PATH) && ./makemake
	make -C $(SUBMODULE_PATH) -j all

# Optional: Clean to start a new environment
clean:
	make -C $(SUBMODULE_PATH) clean

run_simulation: build_castalia
	rm -rf $(SUBMODULE_PATH)/Simulations/simulation
	cp -r simulation $(SUBMODULE_PATH)/Simulations/simulation && \
		cd $(SUBMODULE_PATH)/Simulations/simulation && \
		../../out/gcc-release/src/CastaliaBin 
