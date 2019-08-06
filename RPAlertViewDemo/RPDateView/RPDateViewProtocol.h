//
//  RPDateViewProtocol.h
//  CatchU
//
//  Created by 博信科技 on 2019/8/5.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

#ifndef RPDateViewProtocol_h
#define RPDateViewProtocol_h


// MARK: - datasource
@protocol  RPDateViewDatasource <NSObject>

- (NSInteger)itemforNumberWithPickView;

@end


#endif /* RPDateViewProtocol_h */
