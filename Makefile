JAVAC = javac
JAVA = java
OUT_DIR = out
SRC = src/DiskAlgorithmEngine.java src/DiskVisualizerGUI.java src/Main.java

all: compile

compile:
	mkdir -p $(OUT_DIR)
	$(JAVAC) -d $(OUT_DIR) $(SRC)

gui: compile
	$(JAVA) -cp $(OUT_DIR) Main

cli: compile
	$(JAVA) -cp $(OUT_DIR) Main --cli tests/sample_requests.txt

clean:
	rm -rf $(OUT_DIR)
