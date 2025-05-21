*** Settings ***
Library           FfmpegLibrary.py
Library           OperatingSystem
Library           Process

*** Variables ***
${INPUT_DIR}      ./input
${OUTPUT_DIR}     ./output
${CRF}            30
${PRESET}         fast
${AUDIO_BITRATE}  96k

*** Keywords ***
Compress All MP4 Files In Directory
    [Arguments]    ${input_dir}    ${output_dir}    ${crf}=${CRF}    ${preset}=${PRESET}    ${audio_bitrate}=${AUDIO_BITRATE}
    Create Directory    ${output_dir}
    ${files}=    List Files In Directory    ${input_dir}    pattern=*.[mM][pP]4
    FOR    ${file}    IN    @{files}
        ${input_file}=    Join Path    ${input_dir}    ${file}
        ${output_file}=    Join Path    ${output_dir}    ${file}
        Compress Single MP4 File    ${input_file}    ${output_file}    ${crf}    ${preset}    ${audio_bitrate}
    END

Compress Single MP4 File
    [Arguments]    ${input_file}    ${output_file}    ${crf}    ${preset}    ${audio_bitrate}
    Compress Mp4    ${INPUT_FILE}    ${OUTPUT_FILE}    crf=${CRF}    preset=${PRESET}    audio_bitrate=${AUDIO_BITRATE}

*** Test Cases ***
Compress MP4 File
    [Documentation]    Reduz o tamanho de um arquivo MP4 usando a biblioteca customizada.
    Compress All MP4 Files In Directory    ${INPUT_DIR}    ${OUTPUT_DIR}