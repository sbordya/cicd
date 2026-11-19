# Define ANSI color codes
YELLOW = \033[1;33m
GREEN = \033[1;32m
RESET = \033[0m

.PHONY: build run help pre-commit

# Target to build the Docker container
build:
	@echo "$(YELLOW)Building the Docker container...$(RESET)"
	docker build -t duckdb-data-analysis -f .docker/Dockerfile .
	@echo "$(GREEN)Build completed successfully!$(RESET)"

# Target to run the Docker container
run:
	@echo "$(YELLOW)Starting the Docker container...$(RESET)"
	docker run -it --rm duckdb-data-analysis
	@echo "$(GREEN)Program executed successfully!$(RESET)"

# Target to display help
help:
	@echo "$(YELLOW)Available commands:$(RESET)"
	@echo "  $(GREEN)make build$(RESET) - Build the Docker container."
	@echo "  $(GREEN)make run$(RESET)   - Start the Docker container and run the program."

pre-commit:
	pip install pre-commit shandy-sqlfmt
	pre-commit install
	pre-commit run --all-files
