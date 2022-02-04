
  
# Phoro Gallery
<table>
  <tr>
    <td>
      <img src="assets/app_logo.png" height=70 align="left"> 
    <p>A photo gallery app, where you can set a photo as wallpaper, share photo and also download the photos 
      </p>
    </td>
  </tr>
</table>
<table>
  <tr>
     <td>Home Screen</td>
     <td>Full Screen</td>
     <td>Set Wallpaper</td>
     <td>Share</td>
    <td>Download</td>
  </tr>
  <tr>
    <td><img src="/assets/home.jpeg" width=270 ></td>
    <td><img src="/assets/fullScreen.jpeg" width=270 ></td>
    <td><img src="/assets/setWallpaper.jpeg" width=270 ></td>
    <td><img src="/assets/share.jpeg" width=270 ></td>
    <td><img src="/assets/download.jpeg" width=270 ></td>
  </tr>
 </table>

## Project Environment:
```
Flutter (Channel stable, 2.8.1)
Android Studio (version 2021.1)
Dart SDK version: 2.15.1 (stable) 
```


## Feature List
```
├── Image List from API with  infinite scroll
├── Full view image with pinch to zoom
├── Set Wallpaper( Home screen, Lock Screen, Both)
├── Share image with all kined of shareable app
├── Download image in download folder
└── Cache images
```

## Used Package:
```
1. provider - for state management
2. bot_toast - for loader and toast message
3. google_fonts - for text fonts
4. http - for API calling
5. cached_network_image - for caching image
6. share_plus - for sharing image with other
7. wallpaper_manager_flutter - for setting wallpaper
8. path_provider - for file path
```
