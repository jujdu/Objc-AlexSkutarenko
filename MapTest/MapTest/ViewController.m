//
//  ViewController.m
//  MapTest
//
//  Created by Michael Sidoruk on 16.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MapAnnotation.h"

@interface ViewController () <MKMapViewDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager requestWhenInUseAuthorization];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAdd:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    space.width = 15;
    
    UIBarButtonItem *zoomButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(actionShowAll:)];
      self.navigationItem.rightBarButtonItems = @[addButton, space, zoomButton];
}

#pragma mark - Actions

- (void)actionAdd:(UIBarButtonItem *)sender {
    MapAnnotation *annotation = [[MapAnnotation alloc]init];
    annotation.title = @"my Point";
    annotation.subtitle = @"test subtitle";
    annotation.coordinate = self.mapView.region.center;
    
    [self.mapView addAnnotation:annotation];
}

- (void)actionShowAll:(UIBarButtonItem *)sender {
    
    MKMapRect zoomRect = MKMapRectNull;
    
    CLLocation *previousLocation = nil;
    
    for (id <MKAnnotation> annotation in self.mapView.annotations) {
        
        CLLocationCoordinate2D currentCoordinate = annotation.coordinate;
        
        MKMapPoint center = MKMapPointForCoordinate(currentCoordinate);
        
        static double delta = 13000;
        
        MKMapRect rect = MKMapRectMake(center.x - delta, center.y - delta, delta * 2, delta * 2);
        
        zoomRect = MKMapRectUnion(zoomRect, rect);
        
        
#pragma mark - calculate Distance 
        if (!previousLocation) {
            previousLocation = [[CLLocation alloc]initWithLatitude:currentCoordinate.latitude
                                                         longitude:currentCoordinate.longitude];
            continue;
        } else {
            CLLocation *currentLocation = [[CLLocation alloc]initWithLatitude:currentCoordinate.latitude longitude:currentCoordinate.longitude];
            NSLog(@"%f", [previousLocation distanceFromLocation:currentLocation]);
        }
    }
    zoomRect = [self.mapView mapRectThatFits:zoomRect];
    
    [self.mapView setVisibleMapRect:zoomRect edgePadding:UIEdgeInsetsMake(50, 50, 50, 50) animated:YES];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *identifier = @"Annotation";
    
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];

    if (!pin) {
        pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        pin.pinTintColor = [UIColor purpleColor];
        pin.animatesDrop = YES;
        pin.canShowCallout = YES;
        pin.draggable = YES;
    } else {
        pin.annotation = annotation;
    }
    return pin;
    
//    MKMarkerAnnotationView *marker = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
//
//       if (!marker) {
//           marker = [[MKMarkerAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
//           marker.markerTintColor = [UIColor greenColor];
//           marker.animatesWhenAdded = YES;
//       } else {
//           marker.annotation = annotation;
//       }
//       return marker;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
    
    if (newState == MKAnnotationViewDragStateEnding) {
        CLLocationCoordinate2D location = view.annotation.coordinate;
        MKMapPoint point = MKMapPointForCoordinate(location);
        NSLog(@"location = [%f, %f] \npoint = %@", location.latitude, location.longitude, MKStringFromMapPoint(point));
    }
}

//
//- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
//    NSLog(@"regionWillChangeAnimated");
//}
//- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
//    NSLog(@"regionWillChangeAnimated");
//}
//
//- (void)mapViewDidChangeVisibleRegion:(MKMapView *)mapView {
//    NSLog(@"mapViewDidChangeVisibleRegion");
//}
//
//- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
//    NSLog(@"mapViewWillStartLoadingMap");
//}
//- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
//    NSLog(@"mapViewDidFinishLoadingMap");
//}
//- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
//    NSLog(@"mapViewDidFailLoadingMap");
//}
//
//- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView {
//    NSLog(@"mapViewWillStartRenderingMap");
//}
//- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered {
//    NSLog(@"mapViewDidFinishRenderingMap = %d", fullyRendered);
//}

@end

