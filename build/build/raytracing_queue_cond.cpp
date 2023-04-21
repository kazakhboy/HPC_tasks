#include "minirt/minirt.h"

#include <mutex>
#include <condition_variable>
#include <queue>
#include <thread>
#include <vector>
#include <cmath>
#include <iostream>
#include <chrono>

using namespace std;
using namespace std::chrono;
using namespace minirt;

void initScene(Scene &scene) {
    Color red {1, 0.2, 0.2};
    Color blue {0.2, 0.2, 1};
    Color green {0.2, 1, 0.2};
    Color white {0.8, 0.8, 0.8};
    Color yellow {1, 1, 0.2};

    Material metallicRed {red, white, 50};
    Material mirrorBlack {Color {0.0}, Color {0.9}, 1000};
    Material matteWhite {Color {0.7}, Color {0.3}, 1};
    Material metallicYellow {yellow, white, 250};
    Material greenishGreen {green, 0.5, 0.5};

    Material transparentGreen {green, 0.8, 0.2};
    transparentGreen.makeTransparent(1.0, 1.03);
    Material transparentBlue {blue, 0.4, 0.6};
    transparentBlue.makeTransparent(0.9, 0.7);

    scene.addSphere(Sphere {{0, -2, 7}, 1, transparentBlue});
    scene.addSphere(Sphere {{-3, 2, 11}, 2, metallicRed});
    scene.addSphere(Sphere {{0, 2, 8}, 1, mirrorBlack});
    scene.addSphere(Sphere {{1.5, -0.5, 7}, 1, transparentGreen});
    scene.addSphere(Sphere {{-2, -1, 6}, 0.7, metallicYellow});
    scene.addSphere(Sphere {{2.2, 0.5, 9}, 1.2, matteWhite});
    scene.addSphere(Sphere {{4, -1, 10}, 0.7, metallicRed});

    scene.addLight(PointLight {{-15, 0, -15}, white});
    scene.addLight(PointLight {{1, 1, 0}, blue});
    scene.addLight(PointLight {{0, -10, 6}, red});

    scene.setBackground({0.05, 0.05, 0.08});
    scene.setAmbient({0.1, 0.1, 0.1});
    scene.setRecursionLimit(20);

    scene.setCamera(Camera {{0, 0, -20}, {0, 0, 0}});
}

void func(Image &image, pair<int, int> elem, int blockSize, ViewPlane viewPlane, Scene scene, int numOfSamples) {
    for (int x = elem.first * blockSize; x < (elem.first + 1) * blockSize; x++)
    for (int y = elem.second * blockSize; y < (elem.second + 1) * blockSize; y++) {
        const auto color = viewPlane.computePixel(scene, x, y, numOfSamples);
        image.set(x, y, color);
    }
}

void thread_func(int id, Image &image, queue<pair<int, int>> &data, mutex &mut, condition_variable &cond, Scene scene, ViewPlane viewPlane, int blockSize, int numOfSamples) {
    while (true) {
	pair<int, int> elem;
	{
	    unique_lock<mutex> lock(mut);
	    while (data.empty()) {
		cond.wait(lock);
	    }
	    elem = data.front();
	    data.pop();
	}

	if (elem.first == -1) {
	    return;
	}

	func(ref(image), elem, blockSize, viewPlane, scene, numOfSamples);
    }
}

int main(int argc, char **argv) {
    int viewPlaneResolutionX = (argc > 1 ? std::stoi(argv[1]) : 600);
    int viewPlaneResolutionY = (argc > 2 ? std::stoi(argv[2]) : 600);
    int numOfSamples = (argc > 3 ? std::stoi(argv[3]) : 1);
    int numOfThreads = (argc > 4 ? std::stoi(argv[4]) : 1);
    std::string sceneFile = (argc > 5 ? argv[5] : "");

    Scene scene;
    if (sceneFile.empty()) {
        initScene(scene);
    } else {
        scene.loadFromFile(sceneFile);
    }

    const double backgroundSizeX = 4;
    const double backgroundSizeY = 4;
    const double backgroundDistance = 15;

    const double viewPlaneDistance = 5;
    const double viewPlaneSizeX = backgroundSizeX * viewPlaneDistance / backgroundDistance;
    const double viewPlaneSizeY = backgroundSizeY * viewPlaneDistance / backgroundDistance;

    ViewPlane viewPlane {viewPlaneResolutionX, viewPlaneResolutionY,
                         viewPlaneSizeX, viewPlaneSizeY, viewPlaneDistance};

    Image image(viewPlaneResolutionX, viewPlaneResolutionY); // computed image
    int blockSize = 20;
    vector<thread> threadsArray;
    mutex mut;
    condition_variable cond;
    queue<pair<int, int>> data;
    auto timerStart = high_resolution_clock::now();
    for (int threadID = 0; threadID < numOfThreads; threadID++) {
	thread thread(&thread_func, threadID, ref(image), ref(data), ref(mut), ref(cond), scene, viewPlane, blockSize, numOfSamples);
	threadsArray.push_back(move(thread));
    }

    for (int indX = 0; indX < (viewPlaneResolutionX / blockSize); indX++)
    for (int indY = 0; indY < (viewPlaneResolutionY / blockSize); indY++) {
        {
	    lock_guard<mutex> lock(mut);
	    data.push({indX, indY});
	    cond.notify_one();
	}
    }

    for (int threadID = 0; threadID < numOfThreads; threadID++) {
	lock_guard<mutex> lock(mut);
	data.push({-1, -1});
    }
    cond.notify_all();

    for (int threadID = 0; threadID < numOfThreads; threadID++) {
	threadsArray[threadID].join();
    }

    auto timerFinish = high_resolution_clock::now();
    double time = duration<double>(timerFinish - timerStart).count();
    cout << "Time = " << time << endl;

    image.saveJPEG("raytracing.jpg");

    return 0;
}
