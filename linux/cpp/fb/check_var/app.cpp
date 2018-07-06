//========================================================================================================
//  Basically, all of files downloaded from my website can be modified or redistributed for any purpose.
//  It is my honor to share my interesting to everybody.
//  If you find any illeage content out from my website, please contact me firstly.
//  I will remove all of the illeage parts.
//  Thanks :)
//  
//  Steward Fu
//  steward.fu@gmail.com
//  https://steward-fu.github.io/website/index.htm
//========================================================================================================*/
#include <stdio.h>
#include <SDL/SDL.h>

int main(int argc, char** argv)
{
  int ret=-1;
  SDL_Surface *screen=NULL;

  putenv((char*)"SDL_VIDEODRIVER=fbcon");
  putenv((char*)"SDL_FBDEV=/dev/fb1");
  
  ret = SDL_Init(SDL_INIT_VIDEO);
  printf("%s, SDL_Init(ret=%d)\n", __func__, ret);

  screen = SDL_SetVideoMode(320, 240, 0, SDL_SWSURFACE);
  printf("%s, SDL_SetVideoMode(screen=0x%x)\n", __func__, screen);
  SDL_Quit();
  return 0;
}
