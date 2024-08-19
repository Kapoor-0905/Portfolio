import os

def to_camel_case(snake_str):
    components = snake_str.split('_')
    return components[0] + ''.join(x.title() for x in components[1:])

# Define the path to the assets/svg folder
svg_folder_path = 'assets/svg'

# Define the path to the existing Dart file
output_dart_file = 'lib/utils/assets.dart'

# Get a list of all files in the svg folder
svg_files = [f for f in os.listdir(svg_folder_path) if f.endswith('.svg')]

# Open the Dart file in append mode
with open(output_dart_file, 'a') as dart_file:
    for svg_file in svg_files:
        # Create a camelCase variable name from the file name
        file_name = os.path.splitext(svg_file)[0]
        camel_case_name = to_camel_case(file_name)
        
        # Remove the 'assets/' prefix from the path
        relative_path = os.path.join('svg', svg_file)
        const_name = f'static const String {camel_case_name} = "{relative_path}";'
        
        # Append the constant definition to the Dart file
        dart_file.write(f'{const_name}\n')

print(f'Paths appended to: {output_dart_file}')
