
OPENSCAD = openscad

MATERIALS = materials
OUT = 3dmodels
BUILD = build

ifeq ($(V),1)
quiet = 
else
quiet = @echo "[$@]";
endif

define vrml_target

include $$(BUILD)/$(1).wrl.d
$$(BUILD)/$(1).wrl.d: $$(BUILD)/$(1).materials
	$$(quiet)materials=$$$$(sed -ne 's/^.*material = "\([^"]*\)"$$$$/\1/p' < $$(<) | sort | uniq); \
	echo "$$(OUT)/$(1).wrl:" $$$$(for m in $$$$materials; do echo "$$(BUILD)/$(1)_$$$${m}.wrl"; done) > $$@

$$(OUT)/$(1).wrl :
	@mkdir -p $$(@D)
	$$(quiet)cat $$^ | sed -e 1b -e '/^#/d' > $$@

$$(BUILD)/$(1)_%.wrl : $$(BUILD)/$(1)_%.wrl.tmp $$(MATERIALS)/%.material
	$$(quiet)sed -e '/^appearance Appearance/r$$(MATERIALS)/$$(*).material' -e '/^appearance Appearance/,/^}/d' < $$< > $$@

.PRECIOUS: $$(BUILD)/$(1)_%.wrl.tmp
-include $$(BUILD)/$(1)_*.wrl.tmp.d
$$(BUILD)/$(1)_%.wrl.tmp : $(2)
	@mkdir -p $$(@D)
	$$(quiet)$$(OPENSCAD) -d $$(@).d --export-format=wrl -o $$@ '-Dmaterial="$$*"' $$<

-include $$(BUILD)/$(1).materials.d
$$(BUILD)/$(1).materials : $(2)
	@mkdir -p $$(@D)
	$$(quiet)$$(OPENSCAD) -d $$(@).d --export-format=echo -o $$@ -Ddump_materials=1 $$<

all_vrml:: $$(OUT)/$(1).wrl

endef

define vrml_part
$(call vrml_target,$(1).3dshapes/$(2),$$(BUILD)/$(1).3dshapes/$(2).scad)
$$(BUILD)/$(1).3dshapes/$(2).scad :
	@mkdir -p $$(@D)
	$$(quiet)(echo 'use <$(CURDIR)/$(1).scad>'; \
	echo 'scale([1/2.54, 1/2.54, 1/2.54]) part_$(subst -,_,$(2))();') > $$@
endef

define component_library
$(foreach part,$(2),$(call vrml_part,$(1),$(part)))
endef

all : all_vrml

clean :
	-rm -rf $(OUT) $(BUILD)

$(eval $(call component_library,TE_Connectivity,   \
	$(addprefix 284512-,2 3 4 5 6 7 8 9)       \
	$(addprefix 1-284512-,0 1 2 3 4 5 6 7 8 9) \
	$(addprefix 2-284512-,0 1 2 3 4 5)         \
	$(addprefix 796695-,2 3 4 5 6 7 8 9)       \
	$(addprefix 1-796695-,0 1 2 3 4 5 6 7 8 9) \
	$(addprefix 2-796695-,0 1 2 3 4 5)         \
	$(addprefix 1776134-,2 3 4 5 6 7 8)        \
	$(addprefix 5530843-,1 2 3 4 5 6 7 8 9)    \
	$(addprefix 1-5530843-,0 6 8)              \
	$(addprefix 2-5530843-,0 2 3)              \
	$(addprefix 5-5530843-,0 3 4)              \
	6-5530843-5                                \
	$(addprefix 7-5530843-,5 6 7)              \
	$(addprefix 8-5530843-,4 5 7 8 9)          \
	$(addprefix 9-5530843-,0 1 2 4)))

$(eval $(call component_library,Samtec, \
	$(foreach pins,05 08 10 13 15 17 20 25,FTSH-1$(pins)-01-K)))

$(eval $(call component_library,Hroparts, \
	TYPE-C-31-M-12))
