//
//  KSRootViewController.m
//  KSDemoTemplate
//
//  Created by Klaudz on 2021/11/14.
//

#import "KSRootViewController.h"

#import "KSViewSection.h"
#import "KSViewItem.h"

@interface KSRootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong, readonly) NSMutableArray<KSViewSection *> *viewSections;

@end

@implementation KSRootViewController

@synthesize viewSections = _viewSections;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Demo";
        
        [self initViewModels];
    }
    return self;
}

- (NSMutableArray<KSViewSection *> *)viewSections {
    if (_viewSections == nil) {
        _viewSections = [[NSMutableArray alloc] init];
    }
    return _viewSections;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    [self loadTableView];
}

- (void)initViewModels {
    for (NSUInteger section = 0; section < 2; section++) {
        KSViewSection *viewSection = [[KSViewSection alloc] init];
        viewSection.headerTitle = [NSString stringWithFormat:@"Section %lu", section];
        viewSection.footerTitle = [NSString stringWithFormat:@"Some tips about section %lu...", section];
        for (NSUInteger item = 0; item < 3; item++) {
            KSViewItem *viewItem = [[KSViewItem alloc] init];
            viewItem.title = [NSString stringWithFormat:@"Item %lu", item];
            viewItem.subtitle = @"Description...";
            __weak typeof(self) __weak_self = self;
            viewItem.didSelectBlock = ^(KSViewItem * _Nonnull viewItem) {
                __strong typeof(self) self = __weak_self;
                if (self == nil) {
                    return;
                }
                NSLog(@"%@ is selected", viewItem.title);
            };
            [viewSection.viewItems addObject:viewItem];
        }
        [self.viewSections addObject:viewSection];
    }
}

- (void)loadTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
}

- (void)reloadTableView {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewSections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.viewSections[section].headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return self.viewSections[section].footerTitle;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.viewSections[section].viewItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSViewItem *viewItem = self.viewSections[indexPath.section].viewItems[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:viewItem.cellIdentifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:viewItem.cellIdentifer];
    }
    cell.textLabel.text = viewItem.title;
    cell.detailTextLabel.text = viewItem.subtitle;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    KSViewItem *viewItem = self.viewSections[indexPath.section].viewItems[indexPath.row];
    if (viewItem.didSelectBlock) {
        viewItem.didSelectBlock(viewItem);
    }
}

@end
