#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "timing.h"
#include "vad_process.h"
//采用https://github.com/mackron/dr_libs/blob/master/dr_wav.h 解码
#define DR_WAV_IMPLEMENTATION

#include "dr_wav.h"
#include "vad.h"

#ifndef nullptr
#define nullptr 0
#endif

#ifndef MIN
#define  MIN(A, B)        ((A) < (B) ? (A) : (B))
#endif

#ifndef MAX
#define  MAX(A, B)        ((A) > (B) ? (A) : (B))
#endif


//读取wav文件
int16_t *wavRead_int16(char *filename, uint32_t *sampleRate, uint64_t *totalSampleCount) {
    unsigned int channels;

    struct stat st;
    int ret = lstat(filename, &st);
    if (!st.st_size) {
            return 0;
    }

    printf(" size = %d\r\n",st.st_size);

    int16_t *buffer = drwav_open_and_read_file_s16(filename, &channels, sampleRate, totalSampleCount);
    if (buffer == nullptr) {
        printf("读取wav文件失败.");
    }
    
    printf(" sampleRate = %d  totalSampleCount %d \r\n",*sampleRate, *totalSampleCount);
    //仅仅处理单通道音频
    if (channels != 1) {
        drwav_free(buffer);
        buffer = nullptr;
        *sampleRate = 0;
        *totalSampleCount = 0;
    }
    return buffer;
}

//读取PCM文件
int16_t *pcmRead_int16(char* filename, uint32_t* sampleRate, uint64_t* totalSampleCount) {
  //stat filename, get size


  *sampleRate = 16 * 1024;
  

  struct stat st;
  int ret = lstat(filename, &st);
  if (!st.st_size) {
    return 0;
  }

  printf("tts1.pcm size = %d\r\n", st.st_size/2);
  *totalSampleCount = st.st_size / 2; 
  //fopen file, only read
  FILE* f = fopen(filename, "r"); 
  if (f == 0) {
    return 0;
  } 

  //fread file
  uint8_t* buffer = malloc(st.st_size);
  ret = fread(buffer, 1, st.st_size, f);
  if (ret < 0) {
    return 0;
  }

  //fclose file
  fclose(f);
  return (uint16_t*)(buffer);
}

int vadProcess(int16_t *buffer, uint32_t sampleRate, size_t samplesCount, int16_t vad_mode, int per_ms_frames) {
    if (buffer == nullptr) return -1;
    if (samplesCount == 0) return -1;
    // kValidRates : 8000, 16000, 32000, 48000
    // 10, 20 or 30 ms frames
    per_ms_frames = MAX(MIN(30, per_ms_frames), 10);
    size_t samples = sampleRate * per_ms_frames / 1000;
    printf(" samples = %d\r\n", samples);
    if (samples == 0) return -1;
    int16_t *input = buffer;
    size_t nTotal = (samplesCount / samples);
    printf(" nTotal %d\r\n",nTotal);
    void *vadInst = WebRtcVad_Create();
    if (vadInst == NULL) return -1;
    int status = WebRtcVad_Init(vadInst);
    if (status != 0) {
        printf("WebRtcVad_Init fail\n");
        WebRtcVad_Free(vadInst);
        return -1;
    }
    status = WebRtcVad_set_mode(vadInst, vad_mode);
    if (status != 0) {
        printf("WebRtcVad_set_mode fail\n");
        WebRtcVad_Free(vadInst);
        return -1;
    }
    printf("Activity ： \n");
    int i  = 0;
    for (i = 0; i < nTotal; i++) {
        int keep_weight = 0;
        int nVadRet = WebRtcVad_Process(vadInst, sampleRate, input, samples, keep_weight);
        if (nVadRet == -1) {
            printf("failed in WebRtcVad_Process\n");
            WebRtcVad_Free(vadInst);
            return -1;
        } else {
            // output result
            printf(" %d \t", nVadRet);
        }
        input += samples;
    }
    printf("\n");
    WebRtcVad_Free(vadInst);
    return 1;
}

void vad(char *in_file, char* type) {
    //音频采样率
    uint32_t sampleRate = 0;
    //总音频采样数
    uint16_t* inBuffer = 0;
    uint64_t inSampleCount = 0;
    if (strcmp(type, "1") == 0) {
      inBuffer = wavRead_int16(in_file, &sampleRate, &inSampleCount);
    }
    else {
      inBuffer = pcmRead_int16(in_file, &sampleRate, &inSampleCount);
    }

    printf(" sampleRate %d , inSampleCount %d\r\n", sampleRate, inSampleCount);

    //如果加载成功
    if (inBuffer != nullptr) {
        //    Aggressiveness mode (0, 1, 2, or 3)
        int16_t mode = 1;
        int per_ms = 30;
        double startTime = now();
        vadProcess(inBuffer, sampleRate, inSampleCount, mode, per_ms);
        double time_interval = calcElapsed(startTime, now());
        printf("time interval: %d ms\n ", (int) (time_interval * 1000));
        free(inBuffer);
    }
}
/*
int main(int argc, char *argv[]) {
    printf("WebRTC Voice Activity Detector\n");
    printf("静音检测\n");
    if (argc < 2)
        return -1;
    char *in_file = argv[1];
    char* type = argv[2];
    vad(in_file, type);
    printf("按任意键退出程序 \n");
    getchar();
    return 0;
}
*/
