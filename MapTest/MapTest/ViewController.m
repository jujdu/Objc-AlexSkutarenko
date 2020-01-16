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
#import "UIView+MKAnnotationView.h"

@interface ViewController () <MKMapViewDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geoCoder;
@property (strong, nonatomic) MKDirections *directions;
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
    
    self.geoCoder = [[CLGeocoder alloc]init];
}

- (void)dealloc {
    if (self.geoCoder.isGeocoding) {
        [self.geoCoder cancelGeocode];
    }
    if (self.directions.calculating) {
        [self.directions cancel];
    }
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
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self action:@selector(actionDescription:) forControlEvents:UIControlEventTouchUpInside];
        pin.rightCalloutAccessoryView = button;
        
        UIButton *directionButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [directionButton addTarget:self action:@selector(actionDirection:) forControlEvents:UIControlEventTouchUpInside];
        pin.leftCalloutAccessoryView = directionButton;
        
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

#pragma mark - Actions

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)actionDescription:(UIButton *)sender {
    MKAnnotationView *annotationView = [sender superAnnotationView];
    
    if (!annotationView) {
        return;
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    CLLocation *location = [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    if (self.geoCoder.isGeocoding) {
        [self.geoCoder cancelGeocode];
    }
    
    [self.geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        NSString *message = nil;
        if (error) {
            message = error.localizedDescription;
        } else {
            if ([placemarks count] > 0) {
                CLPlacemark *placeMark = [placemarks firstObject];
                message = [NSString stringWithFormat:@"%@, %@, %@, %@",placeMark.country, placeMark.name, placeMark.thoroughfare, placeMark.subThoroughfare];
            } else {
                message = @"No placemarks Found";
            }
        }
        
        [self showAlertWithTitle:@"Location" andMessage:message];
    }];
}

- (void)actionDirection:(UIButton *)sender {
    MKAnnotationView *annotationView = [sender superAnnotationView];
    
    if (!annotationView) {
        return;
    }
    
    if (self.directions.calculating) {
        [self.directions cancel];
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
        
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    MKPlacemark *placeMark = [[MKPlacemark alloc]initWithCoordinate:coordinate];
    MKMapItem *destination = [[MKMapItem alloc]initWithPlacemark:placeMark];
    request.destination = destination;
    
    request.requestsAlternateRoutes = YES;
    request.transportType = MKDirectionsTransportTypeAutomobile;
    
    self.directions = [[MKDirections alloc]initWithRequest:request];
    
    [self.directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            [self showAlertWithTitle:@"Location" andMessage:error.localizedDescription];
        } else if ([response.routes count] == 0) {
            [self showAlertWithTitle:@"Location" andMessage:@"No routes found"];
        } else {
            [self.mapView removeOverlays:self.mapView.overlays];
            
            NSMutableArray *array = [NSMutableArray array];
            
            for (MKRoute *route in response.routes) {
                [array addObject:route.polyline];
            }
            
            [self.mapView addOverlays:array level:MKOverlayLevelAboveRoads];
            
        }
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *render = [[MKPolylineRenderer alloc]initWithOverlay:overlay];
        
        render.lineWidth = 5;
        render.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        return render;
    }
    return nil;
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

