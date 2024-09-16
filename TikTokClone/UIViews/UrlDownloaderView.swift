import SwiftUI
import Photos
import AVFoundation


class ProgressObserver: NSObject, ObservableObject {
    @objc @Published var downloadProgress: Double = 0.0
}

struct UrlDownloaderView: View {

    @StateObject private var progressObserver = ProgressObserver()
      @State private var videoURL = ""
      @State private var isDownloading = false
      @State private var isPaused = false
      @State private var downloadTask: URLSessionDownloadTask?
      

    var body: some View {
        VStack {
            TextField("Enter Video URL", text: $videoURL)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 0, y: 2)
                )
                .padding(.horizontal)

            Button(action: {
                if isDownloading {
                    isPaused.toggle()
                } else {
                    downloadVideo()
                }
            }) {
                HStack {
                    Image(systemName: isDownloading ? (isPaused ? "play.circle" : "pause.circle") : "arrow.down.circle")
                        .font(.system(size: 24))
                    Text(isDownloading ? (isPaused ? "Resume" : "Pause") : "Download")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()

            if isDownloading {
                ProgressView("Downloading...", value: progressObserver.downloadProgress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle())
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }

    private func downloadVideo() {
          // Check for URL validity
          guard let url = URL(string: videoURL) else {
              // Handle invalid URL
              return
          }

          // Request Photo Library Access
          PHPhotoLibrary.requestAuthorization { status in
              guard status == .authorized else {
                  // Handle unauthorized status
                  return
              }

              // Proceed with downloading
              DispatchQueue.main.async {
                  self.isDownloading = true
                  self.isPaused = false
                  self.progressObserver.downloadProgress = 0.0

                  self.downloadTask = URLSession.shared.downloadTask(with: url) { localURL, response, error in
                      defer {
                          DispatchQueue.main.async {
                              self.isDownloading = false
                          }
                      }

                      if let localURL = localURL {
                          // Save the downloaded video to the gallery
                          self.saveVideoToGallery(localURL)
                      } else {
                          // Handle download error
                      }
                  }

                  // Monitor download progress
                  self.downloadTask?.resume()
                  self.monitorDownloadProgress(self.downloadTask)
              }
          }
      }

      private func monitorDownloadProgress(_ task: URLSessionDownloadTask?) {
          task?.progress.addObserver(self.progressObserver, forKeyPath: #keyPath(ProgressObserver.downloadProgress), options: .new, context: nil)
      }

    private func saveVideoToGallery(_ localURL: URL) {
        PHPhotoLibrary.shared().performChanges {
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: localURL)
        } completionHandler: { success, error in
            DispatchQueue.main.async {
                if success {
                    print("Video saved to the photo library successfully.")
                } else {
                    if let nsError = error as NSError? {
                        print("Error saving video to the photo library: \(nsError.localizedDescription)")
                        print("PHError code: \(nsError.code), userInfo: \(nsError.userInfo)")
                    } else {
                        print("Unknown error occurred")
                    }
                }
            }
        }
    }

  }

  struct UrlDownloaderView_Previews: PreviewProvider {
      static var previews: some View {
          UrlDownloaderView()
      }
  }
