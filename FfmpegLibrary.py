import ffmpeg

class FfmpegLibrary:
    """
    Biblioteca customizada para manipulação de arquivos de vídeo usando ffmpeg-python.
    """
    def compress_mp4(self, input_file, output_file, crf=28, preset="fast", audio_bitrate="96k"):
        try:
            (
                ffmpeg
                .input(input_file)
                .output(output_file, crf=crf, preset=preset, audio_bitrate=audio_bitrate, vcodec='libx264', acodec='aac')
                .run(overwrite_output=True)
            )
            return f"Arquivo comprimido com sucesso: {output_file}"
        except ffmpeg.Error as e:
            raise RuntimeError(f"Erro ao comprimir o arquivo: {e.stderr.decode()}")