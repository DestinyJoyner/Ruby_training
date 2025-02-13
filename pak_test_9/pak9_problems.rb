# PART_9_IN_CLASS PROBLEMS

# Problem: 102_creating_reading_file

# Instructions:
# Write a Ruby script that:
# 
# Creates a file example.txt with the content:
# Hello, this is a test file.
# Learning Ruby File Handling!
# Reads and prints the file content using File.read("example.txt").
# 
# Output:
# Hello, this is a test file.
# Learning Ruby File Handling!

# Your solution for 102_creating_reading_file goes here:


# Problem: 103_appending_file

# Instructions:
# Write a Ruby script that:
# 
# Appends "Appended line." to output.txt without overwriting existing content.
# Reads and prints the conten
# 
# Output:
# This is new content.
# Appended line.
# 
# NOTE:
# Before you test make sure you reset the output.txt file to "This is new content."

# Your solution for 103_appending_file goes here:


# Problem: 104_file_existence

# Instructions:
# Write a Ruby script that:
# 
# Checks if non_existent.txt exists.
# Prints "File exists!" if true, otherwise "File not found.".
# 
# Output:
# File not found.

# Your solution for 104_file_existence goes here:


# Problem: 105_file_permission

# Instructions:
# Write a Ruby script that:
# 
# Checks if example.txt is writable.
# Prints "File is writable." or "File is not writable.".
# 
# Output:
# File is writable.

# Your solution for 105_file_permission goes here:


# Problem: 106_writing_to_csv

# Instructions:
# Write a Ruby script that:
# 
# Creates a CSV file data.csv and write the following to the file:
# Name, Age, City
# Alice, 30, New York
# Bob, 25, Los Angeles
# 
# Output:
# [["Name", "Age", "City"], ["Alice", "30", "New York"], ["Bob", "25", "Los Angeles"]]

# Your solution for 106_writing_to_csv goes here:


# Problem: 107_parsing_json

# Instructions:
# Write a Ruby script that:
# 
# Creates a json file data.json and write the following to the file:
# { "name": "Alice", "age": 30, "city": "New York" }
# 
# Output:
# Alice

# Your solution for 107_parsing_json goes here:


# Problem: 108_creating_YAML

# Instructions:
# Write a Ruby script that:
# 
# Creates a YAML file config.yml and write the following to the file:
# app_name: MyRubyApp
# version: 1.0
# features:
# 
# - logging
# - debugging
# 
# Output:
# MyRubyApp

# Your solution for 108_creating_YAML goes here:


# Problem: 109_creating_managing_threads

# Instructions:
# Write a Ruby script that:
# 
# Creates two threads:
# One prints "Thread 1 is running".
# The other prints "Thread 2 is running".
# Uses join to ensure both threads finish before the script exits.
# 
# Output:
# Thread 1 is running
# Thread 2 is running

# Your solution for 109_creating_managing_threads goes here:


# Problem: 110_thread_sync_mutex

# Instructions:
# Write a Ruby script that:
# 
# Creates a shared counter.
# Uses multiple threads to increment the counter.
# Uses Mutex to prevent race conditions.
# 
# Output:
# Final count: 10000

# Your solution for 110_thread_sync_mutex goes here:


# Problem: 111_using_queue_thread_safe_operation

# Instructions:
# Write a Ruby script that:
# 
# Uses a queue to store 10 numbers (1-10).
# Creates two worker threads that:
# Remove numbers from the queue.
# Print "Processing: <number>".
# Ensures all numbers are processed.
# 
# Output:
# Processing: 1
# Processing: 2
# ...
# Processing: 10

# Your solution for 111_using_queue_thread_safe_operation goes here:


# Problem: 112_thread_value

# Instructions:
# Write a Ruby script that:
# 
# Creates a thread that returns the square of 5.
# Uses .value to retrieve and print the result.
# 
# Output:
# Square: 25

# Your solution for 112_thread_value goes here:


# Problem: 113_Fiber

# Instructions:
# Write a Ruby script that:
# 
# Creates a fiber that:
# Yields "First step", then "Second step".
# Calls resume twice to get the values.
# 
# Output:
# First step
# Second step

# Your solution for 113_Fiber goes here: