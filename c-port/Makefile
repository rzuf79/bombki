CC ?= cc
CPPFLAGS += -Iinclude -Isrc
CFLAGS ?= -std=c11 -Wall -Wextra -Wpedantic -Wno-missing-field-initializers

BUILD_DIR ?= build
OBJECT_DIR := $(BUILD_DIR)/make-objects
TEST_DIR := $(BUILD_DIR)/make-tests

CORE_NAMES := enemies game items parser persistence world
CORE_OBJECTS := $(addprefix $(OBJECT_DIR)/,$(addsuffix .o,$(CORE_NAMES)))
GAME_OBJECTS := $(OBJECT_DIR)/main.o $(OBJECT_DIR)/terminal.o

TEST_NAMES := comparison combat encounters enemies parser game items \
	item_actions shops loot player persistence turns victory world
TEST_BINARIES := $(addprefix $(TEST_DIR)/test_,$(TEST_NAMES))
DEPENDENCIES := $(CORE_OBJECTS:.o=.d) $(GAME_OBJECTS:.o=.d)

.PHONY: all check clean evidence-check

all: $(BUILD_DIR)/bombki

$(BUILD_DIR)/bombki: $(CORE_OBJECTS) $(GAME_OBJECTS)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJECT_DIR)/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -c $< -o $@

$(TEST_DIR)/test_%: tests/test_%.c $(CORE_OBJECTS)
	@mkdir -p $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $< $(CORE_OBJECTS) $(LDLIBS) -o $@

check: $(TEST_BINARIES)
	@set -e; for test_binary in $(TEST_BINARIES); do \
		"$$test_binary"; \
	done

evidence-check:
	python3 tests/test_evidence.py
	python3 tools/evidence.py --source .. --output evidence/generated --check

clean:
	rm -rf -- "$(OBJECT_DIR)" "$(TEST_DIR)"
	rm -f -- "$(BUILD_DIR)/bombki"

-include $(DEPENDENCIES)
