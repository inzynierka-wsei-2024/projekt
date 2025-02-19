import pandas as pd
import sys

file_name = sys.argv[1]

df = pd.read_csv(file_name + '.csv', low_memory=False)

part1 = df.iloc[:225000]  
part2 = df.iloc[225000:]

output_file1 = file_name + "_part1.json"
output_file2 = file_name + "_part2.json"

part1.to_json(output_file1, orient='records', indent=4)
part2.to_json(output_file2, orient='records', indent=4)

print(f"Part 1 saved as: {output_file1} ({len(part1)} records)")
print(f"Part 2 saved as: {output_file2} ({len(part2)} records)")




