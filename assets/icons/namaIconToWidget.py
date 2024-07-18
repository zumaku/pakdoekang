import os

def generate_widget_definitions(directory):
    # Dapatkan semua nama file dalam directory
    file_names = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]
    
    # Buat konten untuk file output
    output_content = ""
    for file_name in file_names:
        # Dapatkan nama file tanpa ekstensi
        name_without_extension = os.path.splitext(file_name)[0]
        
        # Buat nama widget dengan aturan yang diminta
        widget_name = name_without_extension[0].lower() + name_without_extension[1:]
        
        # Buat teks yang sesuai
        widget_definition = f"""
  static Widget {widget_name}({{Color color = MyColor.base, double size = 24.0}}) {{
    return CustomIcon(
      iconName: '{name_without_extension}',
      color: color,
      size: size,
    );
  }}
"""
        # Tambahkan ke konten output
        output_content += widget_definition
    
    # Tulis konten ke file output
    with open(os.path.join(directory, 'output.txt'), 'w') as output_file:
        output_file.write(output_content)
    print(f'File output.txt telah dibuat di {directory}')

# Tentukan directory yang ingin kamu gunakan
directory_path = os.getcwd()
generate_widget_definitions(directory_path)
